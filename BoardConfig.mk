# Copyright (C) 2014 The CyanogenMod Project
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

# Inherit from SPRD common configs
-include device/samsung/sprd-common/BoardConfigCommon.mk

# Inherit from the proprietary version
-include vendor/samsung/vivalto3gvn/BoardConfigVendor.mk

# Platform
TARGET_ARCH := arm
TARGET_BOARD_PLATFORM := scx15
TARGET_BOARD_PLATFORM_GPU := mali-400 MP
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_SMP := false
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_BOOTLOADER_BOARD_NAME := SC7715T
BOARD_VENDOR := samsung

# Config u-boot
TARGET_NO_BOOTLOADER := true

BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1111490560
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2457862144
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_HAS_LARGE_FILESYSTEM := true

# RIL
BOARD_PROVIDES_RILD := true
BOARD_PROVIDES_LIBRIL := true
BOARD_RIL_CLASS += ../../../device/samsung/vivalto3gvn/ril
BOARD_GLOBAL_CFLAGS += -DDISABLE_ASHMEM_TRACKING

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/vivalto3gvn/bluetooth
BOARD_CUSTOM_BT_CONFIG := device/samsung/vivalto3gvn/bluetooth/libbt_vndcfg.txt

# FM
BOARD_HAVE_FMRADIO_BCM := true

# Wifi
BOARD_WLAN_DEVICE := bcmdhd
BOARD_WLAN_DEVICE_REV := bcm4343
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA := "/system/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_P2P := "/system/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP := "/system/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_NVRAM_PATH_PARAM := "/sys/module/dhd/parameters/nvram_path"
WIFI_DRIVER_NVRAM_PATH := "/system/etc/wifi/nvram_net.txt"
WIFI_BAND := 802_11_ABG
BOARD_HAVE_SAMSUNG_WIFI := true

# Graphics
#HWUI_COMPILE_FOR_PERF := true
TARGET_REQUIRES_SYNCHRONOUS_SETSURFACE := true

# HWComposer
USE_SPRD_HWCOMPOSER := true
USE_SPRD_DITHER := true

# Resolution
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

# Audio
BOARD_USE_LIBATCHANNEL_WRAPPER := true

# Media
BOARD_CANT_REALLOCATE_OMX_BUFFERS := true

# Board specific features
BOARD_GLOBAL_CFLAGS += -DUSES_LEGACY_BLOBS
BOARD_USE_SAMSUNG_COLORFORMAT := true

# Healthd
BOARD_HAL_STATIC_LIBRARIES := libhealthd.scx15

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_NO_CHARGER_LED := true
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging
CHARGING_ENABLED_PATH := /sys/class/power_supply/battery/batt_lp_charging
BACKLIGHT_PATH := /sys/class/backlight/panel/brightness

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=ttyS1,115200n8
BOARD_KERNEL_PAGESIZE := 2048
TARGET_KERNEL_CONFIG := cyanogen_vivalto3gvn_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/vivalto3gvn
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-eabi-
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/arm/arm-eabi-4.8/bin

# Assert
TARGET_OTA_ASSERT_DEVICE := vivalto3gvn,vivalto3gvndx,vivalto3gub,vivalto3g,SM-G313HZ,SM-G313H,SM-G313ML

# SELinux
BOARD_SEPOLICY_DIRS += device/samsung/vivalto3gvn/sepolicy

# Memory
MALLOC_SVELTE := true
BOARD_USES_LEGACY_MMAP := true

# Enable dex-preoptimization to speed up the first boot sequence
WITH_DEXPREOPT := true
WITH_DEXPREOPT_PIC := true

# Recovery
BOARD_HAS_DOWNLOAD_MODE := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_FSTAB := device/samsung/vivalto3gvn/rootdir/fstab.scx15
TARGET_RECOVERY_TWRP := false

# Build system
WITHOUT_CHECK_API := true

ifeq ($(TARGET_RECOVERY_TWRP),true)
RECOVERY_VARIANT := twrp
TARGET_USES_LOGD := true
# TWRP
TW_INTERNAL_STORAGE_PATH := "/data/media/0"
TW_EXTERNAL_STORAGE_PATH := "/sdcard"
TW_CUSTOM_CPU_TEMP_PATH := "/sys/devices/platform/sec-thermistor/temperature"
TW_NO_REBOOT_BOOTLOADER := true
TW_NO_USB_STORAGE := true
TW_HAS_DOWNLOAD_MODE := true
TW_USE_TOOLBOX := true
TWRP_INCLUDE_LOGCAT := true
TW_EXCLUDE_SUPERSU := true
TW_EXCLUDE_ENCRYPTED_BACKUPS := true
TW_THEME := portrait_mdpi
TWHAVE_SELINUX := true
RECOVERY_SDCARD_ON_DATA := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_10x18.h\"
# UMS
BOARD_UMS_LUNFILE := "/sys/devices/virtual/android_usb/android0/f_mass_storage/lun/file"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/virtual/android_usb/android0/f_mass_storage/lun/file"
endif
