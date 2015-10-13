$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product-if-exists, vendor/huawei/sturgeon/sturgeon-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/huawei/sturgeon/overlay

LOCAL_PATH := device/huawei/sturgeon
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fstab.sturgeon:root/fstab.sturgeon \
    $(LOCAL_PATH)/init.recovery.sturgeon.rc:root/init.recovery.sturgeon.rc

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_sturgeon
PRODUCT_DEVICE := sturgeon
