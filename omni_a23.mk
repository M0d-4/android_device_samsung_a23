#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit everything from the TWRP product
$(call inherit-product, device/samsung/a23/twrp_a23.mk)

# Override the product name for OrangeFox/omni builds
PRODUCT_NAME := omni_a23
