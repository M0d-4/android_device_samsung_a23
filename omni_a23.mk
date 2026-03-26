#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from a23 device
$(call inherit-product, device/samsung/a23/device.mk)

PRODUCT_DEVICE := a23
PRODUCT_NAME := omni_a23
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-A235F
PRODUCT_MANUFACTURER := samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="a23nsxx-user 11 RP1A.200720.012 A235FXXSEEZB1 release-keys"

BUILD_FINGERPRINT := samsung/a23nsxx/a23:11/RP1A.200720.012/A235FXXSEEZB1:user/release-keys
