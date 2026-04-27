# OrangeFox Device Tree for Samsung Galaxy A23 4G

The Galaxy A23 4G (SM-A235 - codenamed _"a23"_) is a budget smartphone from Samsung.

It was released in March 2022.

## Device specifications

| Feature                        | Specification                                                                             |
| -----------------------------: | :---------------------------------------------------------------------------------------- |
| Chipset                        | Qualcomm SM6225 Snapdragon 680 4G (6 nm)                                                  |
| CPU                            | Octa-core (4x2.4 GHz Kryo 265 Gold & 4x1.9 GHz Kryo 265 Silver)                           |
| GPU                            | Qualcomm Adreno 610                                                                       |
| Memory                         | 4GB / 6GB / 8GB RAM                                                                       |
| Shipped OS                     | Android 12 (One UI 4.1)                                                                   |
| Storage                        | 64GB / 128GB                                                                              |
| SIM                            | Hybrid Dual SIM (Nano-SIM, dual stand-by)                                                 |
| MicroSD                        | microSDXC (dedicated slot)                                                                |
| Battery                        | 5000mAh Li-Po (non-removable), 25W fast charge                                            |
| Display                        | 6.6 inches, 104.9 cm2 (~82.5% ratio) 1080 x 2408 pixels, 20:9 ratio (~400 ppi density)    |

---
# Flashing

## Flashing with an installed custom recovery (OrangeFox/TWRP/PBRP/etc):
    * Download the OrangeFox zip installer file from orangefox.download
    * Reboot your device to your custom recovery
    * Flash the OrangeFox zip installer (there will be an automatic reboot to OrangeFox after flashing)

##  Flashing with Odin - only if there is no installed custom recovery (you must format your data partition afterwards):
    * Ensure that your bootloader is unlocked
    * Download the OrangeFox zip installer file from orangefox.download
    * Extract the OrangeFox "img.tar" file from the zip installer
    * Open Odin
    * Reboot the device to download mode
    * Flash the "img.tar" file to the "AP" slot in Odin
    * Reboot to recovery, using the relevant hardware key combination
    * If flashing a custom recovery for the very first time on OneUI, you *must* now *format* your data partition:
        * Go to Wipe -> Format Data -> type "Yes", and swipe
        * Reboot to System and configure the Android ROM
    * Reboot to OrangeFox and flash the OrangeFox zip installer

---
## Thanks to
@[xenoZ0x](https://github.com/xenoZ0x) and [TeamWin](https://github.com/TeamWin)
For the TWRP tree on which this one is based

---
## Copyright

```
#
# Copyright (C) 2022 The TWRP Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#  *  Copyright (C) 2025 The OrangeFox Recovery Project
#  *
#  * This program is free software: you can redistribute it and/or modify
#  * it under the terms of the GNU General Public License as published by
#  * the Free Software Foundation, either version 3 of the License, or
#  * (at your option) any later version.
#  *
#  * This program is distributed in the hope that it will be useful,
#  * but WITHOUT ANY WARRANTY; without even the implied warranty of
#  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  * GNU General Public License for more details.
#  *
#  * You should have received a copy of the GNU General Public License
#  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
```
