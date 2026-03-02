#
# device.mk for Redmi Note 12 Pro 5G (ruby)
#

LOCAL_PATH := device/xiaomi/ruby

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# A/B
AB_OTA_UPDATER := true
PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_engine_sideload \
    update_verifier

# Virtual A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# Soong Namespaces
PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/fstab.mt6877:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/fstab.mt6877 \
    $(LOCAL_PATH)/recovery/root/init.recovery.mt6877.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.mt6877.rc

# Device Identification
PRODUCT_MODEL := Redmi Note 12 Pro 5G
PRODUCT_NAME := twrp_ruby
PRODUCT_DEVICE := ruby
PRODUCT_BRAND := Redmi
PRODUCT_MANUFACTURER := Xiaomi
