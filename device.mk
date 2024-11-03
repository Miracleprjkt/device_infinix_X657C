#
# Copyright (C) 2021 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/infinix/X657C

# Installs gsi keys into ramdisk, to boot a GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/infinix/X657C/X657C-vendor.mk)

# Inherit common Android Go defaults.
$(call inherit-product, build/make/target/product/go_defaults.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_configuration.xml

# Bluetooth
# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0 \
    android.hardware.bluetooth@1.0.vendor \
    android.hardware.bluetooth@1.1 \
    android.hardware.bluetooth@1.1.vendor \
    android.hardware.bluetooth.audio@2.1-impl \
    libbt-vendor \
    libldacBT_dec

PRODUCT_PACKAGES += \
    libbtconfigstore

# Camera
PRODUCT_PACKAGES += \
    GoogleCameraGo

# Configstore
PRODUCT_PACKAGES += \
    android.hardware.configstore@1.0-service \
    android.hardware.configstore@1.1-service

# DT2W
PRODUCT_PACKAGES += \
    DT2W-Service-X657C

# Dynamic Partitions 
PRODUCT_TARGET_VNDK_VERSION := 29
PRODUCT_SHIPPING_API_LEVEL := 29
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Fstab
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/etc/fstab.mt6761:$(TARGET_COPY_OUT_RAMDISK)/fstab.mt6761

# Health
PRODUCT_PACKAGES += \
    android.hardware.health-service.X657C \
    android.hardware.health-service.X657C-recovery

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0_system \
    android.hidl.manager@1.0_system

# IMS
PRODUCT_BOOT_JARS += \
    mediatek-common \
    mediatek-framework \
    mediatek-ims-base \
    mediatek-ims-common \
    mediatek-telecom-common \
    mediatek-telephony-base \
    mediatek-telephony-common

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/permissions/privapp-permissions-mediatek.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-mediatek.xml

# Keylayout
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-fpc.kl \
    $(DEVICE_PATH)/configs/keylayout/uinput-goodix.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-goodix.kl

# KPOC
PRODUCT_PACKAGES += \
    libsuspend

# Keymaster
PRODUCT_PACKAGES += \
    libkeymaster4.vendor:32 \
    libkeymaster4support.vendor:32 \
    libkeymaster_portable.vendor:32 \
    libkeymaster_messages.vendor:32 \
    libsoft_attestation_cert.vendor:32 \
    libpuresoftkeymasterdevice.vendor:32

# Libxml2
PRODUCT_PACKAGES += \
    libxml2.vendor

# Light
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.X657C

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay

# Power
PRODUCT_PACKAGES += \
    power.mt6761

# Properties
-include $(DEVICE_PATH)/system.prop
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# Ramdisk
PRODUCT_PACKAGES += \
    init.mt6761.rc \
    init.safailnet.rc \
    fstab.mt6761

# RcsService
PRODUCT_PACKAGES += \
    RcsService

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)

# Speed up
PRODUCT_DEXPREOPT_SPEED_APPS += \
    Launcher3QuickStep \
    Settings \
    SystemUI

# Trust HAL
PRODUCT_PACKAGES += \
    vendor.lineage.trust@1.0-service

# Memory optimizations
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.qti.sys.fw.bservice_enable=true \
    ro.vendor.qti.sys.fw.bservice_limit=5 \
    ro.vendor.qti.sys.fw.bservice_age=5000

# Inherit common Android Go defaults.
$(call inherit-product, build/make/target/product/go_defaults_512.mk)

# SystemUI module for Android Go
PRODUCT_PACKAGES += \
    SystemUIGo

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
       ro.surface_flinger.max_frame_buffer_acquired_buffers=3 \
       debug.composition.type=c2d \
       debug.sf.hw=0 \
       debug.egl.hw=0 \
       debug.enable.sglscale=1 \
       debug.sf.disable_backpressure=1 \
       debug.sf.enable_gl_backpressure=1 \
       debug.hwui.renderer=opengl \