#
# device.mk for Redmi Note 12 Pro 5G (ruby)
#

LOCAL_PATH := device/xiaomi/ruby

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Virtual A/B
ENABLE_VIRTUAL_AB := true
AB_OTA_UPDATER := true

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Copy recovery files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/fstab.mt6877:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/fstab.mt6877 \
    $(LOCAL_PATH)/recovery/root/init.recovery.mt6877.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.mt6877.rc \
    $(LOCAL_PATH)/recovery/root/fstab.mt6877:$(TARGET_COPY_OUT_RAMDISK)/fstab.mt6877

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)
