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
# PATCHED: this script no longer writes to the boot or vendor partitions.
# The original repacked /boot with magiskboot (multidisabler) and deleted
# stock-recovery restore files from /vendor. Both break AVB verification
# once the stock vbmeta is flashed back, so the phone fails to boot.
#

LOGMSG() {
	echo "$@" >> /tmp/recovery.log;
}

LOGMSG "I:OrangeFox: postrecoveryboot.sh - boot/vendor patching disabled (no changes made).";
exit 0;
#
