#
# device.mk for Redmi Note 12 Pro 5G (ruby)
#

LOCAL_PATH := device/xiaomi/ruby

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a55

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a55

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
    $(LOCAL_PATH)/recovery/root/init.recovery.mt6877.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.mt6877.rc

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)
