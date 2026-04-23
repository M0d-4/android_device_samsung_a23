# Inherit TWRP base
$(call inherit-product, device/samsung/a23/twrp_a23.mk)

# Inherit OrangeFox variables
$(call inherit-product, device/samsung/a23/fox_a23.mk)

PRODUCT_NAME := omni_a23
