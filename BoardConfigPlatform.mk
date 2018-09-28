#
# Copyright (C) 2021 The LineageOS Project
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

BUILD_TOP := $(shell pwd)

PLATFORM_PATH := device/samsung/exynos9810-common

### BOARD
TARGET_BOARD_PLATFORM := universal9810
TARGET_SLSI_VARIANT := bsp
TARGET_SOC := exynos9810
TARGET_BOOTLOADER_BOARD_NAME := exynos9810
TARGET_BOARD_PLATFORM_GPU := mali-g72

# build/make/core/Makefile
TARGET_NO_BOOTLOADER := true

# Enable hardware/samsung
BOARD_VENDOR := samsung

### PROCESSOR
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53
TARGET_CPU_SMP := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

### RELASETOOLS
TARGET_RELEASETOOLS_EXTENSIONS := $(PLATFORM_PATH)/releasetools

### RENDERSCRIPT
OVERRIDE_RS_DRIVER := libRSDriverArm.so

### HARDWARE INCLUDE
TARGET_SPECIFIC_HEADER_PATH := $(PLATFORM_PATH)/hardware/include

### KERNEL
TARGET_KERNEL_SOURCE = kernel/samsung/exynos9810/
TARGET_KERNEL_CLANG_COMPILE := true

BOARD_CUSTOM_BOOTIMG         := true
BOARD_CUSTOM_BOOTIMG_MK      := hardware/samsung/mkbootimg.mk
BOARD_KERNEL_BASE            := 0x10000000
# See `bbootimg -i boot.img`
BOARD_KERNEL_PAGESIZE        := 2048
# Looks like Samsung's sboot doesn't suppored a zipped Kernel
BOARD_KERNEL_IMAGE_NAME      := Image
BOARD_KERNEL_SEPARATED_DT    := true
TARGET_CUSTOM_DTBTOOL        := dtbhtoolExynos

# See `bbootimg -i boot.img`
BOARD_KERNEL_OFFSET          := 0x00008000
BOARD_KERNEL_RAMDISK_OFFSET  := 0x01000000
BOARD_KERNEL_TAGS_OFFSET     := 0x00000100

# See `bbootimg -i boot.img`
BOARD_BOOT_HEADER_VERSION    := 1
BOARD_BOOT_HEADER_NAME       := SRPQH16B014KU

BOARD_MKBOOTIMG_ARGS := --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_KERNEL_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --board $(BOARD_BOOT_HEADER_NAME)

# APEX image
DEXPREOPT_GENERATE_APEX_IMAGE := true

### VNDK
BOARD_VNDK_VERSION := current

### SYSTEM
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
# system/core and build/make
AB_OTA_UPDATER := false

BOARD_ROOT_EXTRA_FOLDERS := efs

### VENDOR
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

### ODM
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_ODM := odm

### CACHE
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

### USERDATA
TARGET_USERIMAGES_USE_EXT4 := true

### AUDIO
USE_XML_AUDIO_POLICY_CONF := 1

### BLUETOOTH
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(PLATFORM_PATH)/hardware/bluetooth
BOARD_CUSTOM_BT_CONFIG := $(PLATFORM_PATH)/hardware/bluetooth/libbt_vndcfg.txt

### GRAPHICS
# hardware/interfaces/configstore/1.1/default/surfaceflinger.mk
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_HAS_HDR_DISPLAY := true
TARGET_HAS_WIDE_COLOR_DISPLAY := true

### HIDL
DEVICE_MANIFEST_FILE += $(PLATFORM_PATH)/manifest.xml
DEVICE_MATRIX_FILE := $(PLATFORM_PATH)/compatibility_matrix.xml

### SEPOLICY
#include device/lineage/sepolicy/exynos/sepolicy.mk

BOARD_SEPOLICY_TEE_FLAVOR := mobicore
include device/samsung_slsi/sepolicy/sepolicy.mk

BOARD_VENDOR_SEPOLICY_DIRS += $(PLATFORM_PATH)/sepolicy/vendor

### PARTITIONS
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_BOOTIMAGE_PARTITION_SIZE := 57671680
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 68149248
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 4613734400
BOARD_VENDORIMAGE_PARTITION_SIZE := 681574400
BOARD_ODMIMAGE_PARTITION_SIZE := 651387016

### PROPERTIES
TARGET_SYSTEM_PROP += $(PLATFORM_PATH)/system.prop
TARGET_PRODUCT_PROP += $(PLATFORM_PATH)/product.prop
TARGET_VENDOR_PROP += $(PLATFORM_PATH)/vendor.prop

### WIFI
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)

WIFI_HIDL_FEATURE_DUAL_INTERFACE := true

# hardware/broadcom/wlan/bcmdhd/config/Android.mk
# external/wpa_supplicant_8/Android.mk
WPA_SUPPLICANT_VERSION           := VER_0_8_X

# frameworks/opt/net/wifi/libwifi_hal/Android.mk
# hardware/samsung/wifiloader/Android.mk
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/dhd/parameters/firmware_path"

### RIL
# Use stock RIL stack
ENABLE_VENDOR_RIL_SERVICE := true

### ALLOW VENDOR FILE OVERRIDE
BUILD_BROKEN_DUP_RULES := true

### RECOVERY
BOARD_HAS_DOWNLOAD_MODE := true
TARGET_RECOVERY_PIXEL_FORMAT := "ABGR_8888"
TARGET_RECOVERY_FSTAB := $(PLATFORM_PATH)/config/init/fstab.samsungexynos9810
