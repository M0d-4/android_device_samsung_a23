#!/system/bin/sh
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#	  http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# 	Copyright (C) 2025 The OrangeFox Recovery Project
# 	SPDX-License-Identifier: GPL-3.0-or-later
#
# Partly inspired by: https://github.com/TeamWin/android_device_samsung_a35x/blob/android-12.1/recovery/root/system/bin/postrecoveryboot.sh
#

DEBUG=0; # change to 0 for release builds
[ "$DEBUG" = "1" ] && set -o xtrace;

LOGMSG() {
	echo "$@" >> /tmp/recovery.log;
}

# do we have a pristine stock boot partition (ie, unpatched by us)?
has_unpatched_stock_boot_partition() {
	local tempdir=/tmp/fox_vendor_tempdir;
	local res=0;
	rm -rf $tempdir;
	mkdir -p $tempdir;
	mount -r /dev/block/mapper/vendor $tempdir >/dev/null 2>&1;
	if [ "$?" = "0" -a -f "$tempdir/bin/install-recovery.sh" ]; then
		BOOT_HASH=$(sha1sum "/dev/block/by-name/boot" | cut -d ' ' -f 1);
		EXPECTED_BOOT_HASH=$(sed -n '5p' "$tempdir/bin/install-recovery.sh" | cut -d ':' -f 4 | sed 's/ .*//');
		[ "$BOOT_HASH" = "$EXPECTED_BOOT_HASH" ] && res=1; # pristine - we need to patch it with the multidisabler
	fi;
	umount $tempdir >/dev/null 2>&1;
	rm -rf $tempdir;
	echo "$res";
}

disable_stock_recovery() {
	local tempdir=/tmp/fox_vendor_tempdir2;
	local F="$tempdir/recovery-from-boot.p";

	rm -rf $tempdir;
	mkdir -p $tempdir;
	mount -w /dev/block/mapper/vendor $tempdir >/dev/null 2>&1;
	if [ -w $F ]; then
		LOGMSG "I:OrangeFox: Removing stock recovery file in /vendor to prevent the stock ROM from replacing OrangeFox.";
		rm -f $F;
		rm -f $tempdir/bin/install-recovery.sh;
		rm -f $tempdir/etc/init/vendor_flash_recovery.rc;
	fi
	umount $tempdir >/dev/null 2>&1;
	rm -rf $tempdir;
	sleep 0.2s;
}

# ----
need_to_patch_boot=$(has_unpatched_stock_boot_partition);
if [ "$need_to_patch_boot" = "1" ]; then
	/system/bin/multidisabler;
else
	disable_stock_recovery;
fi
exit 0;
#
