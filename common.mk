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
#

COMMON_PATH := device/samsung/exynos9810-common

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(COMMON_PATH)

DEVICE_PACKAGE_OVERLAYS += \
    $(COMMON_PATH)/overlay

PRODUCT_ENFORCE_RRO_TARGETS += *

# init
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/init/fstab.samsungexynos9810:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.samsungexynos9810 \
    $(COMMON_PATH)/configs/init/init.recovery.samsungexynos9810.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.samsungexynos9810.rc \
