#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2020-2021 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2025 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#

#set -o xtrace
FDEVICE="a23"

fox_get_target_device() {
local chkdev
  if echo "$BASH_SOURCE" | grep -q "/$FDEVICE/"; then
      FOX_BUILD_DEVICE="$FDEVICE"
  elif set | grep BASH_ARGV | grep -w \"$FDEVICE\"; then
      FOX_BUILD_DEVICE="$FDEVICE"
  elif echo "${BASH_SOURCE[0]}" | grep -q "/$FDEVICE/"; then
      FOX_BUILD_DEVICE="$FDEVICE"
  elif echo "$0" | grep -q "$FDEVICE"; then
      FOX_BUILD_DEVICE="$FDEVICE"
  fi
}

if [ -z "$FOX_BUILD_DEVICE" ]; then
	fox_get_target_device
fi

    # Binaries & Tools
  export TW_DEFAULT_LANGUAGE="en"
  export LC_ALL="C"
  export FOX_USE_BASH_SHELL=1
  export FOX_ENABLE_APP_MANAGER=1
  export FOX_ASH_IS_BASH=1
  export FOX_USE_NANO_EDITOR=1
  export FOX_USE_TAR_BINARY=1
  export FOX_USE_SED_BINARY=1
  export FOX_USE_XZ_UTILS=1
  export FOX_USE_LZ4_BINARY=1
  export FOX_USE_ZSTD_BINARY=1
  export FOX_USE_BUSYBOX_BINARY=1
  export FOX_USE_DATE_BINARY=1
  export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
  export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"
  export FOX_ENABLE_KERNELSU_SUPPORT=1
  export FOX_ENABLE_KERNELSU_NEXT_SUPPORT=1
  export FOX_ENABLE_SUKISU_SUPPORT=1
  export FOX_INSTALLER_DISABLE_AUTOREBOOT=1
  export FOX_REPLACE_TOOLBOX_GETPROP=1
else
	if [ -z "$FOX_BUILD_DEVICE" -a -z "$BASH_SOURCE" ]; then
		echo "I: This script requires bash. Not processing the $FDEVICE $(basename $0)"
	fi
fi


