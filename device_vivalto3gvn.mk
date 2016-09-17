#
# Copyright (C) 2016 The Android Open Source Project
# Copyright (C) 2016 The CyanogenMod Project
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

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Inherit from sprd-common device configuration
$(call inherit-product, device/samsung/sprd-common/common.mk)

# Inherit from vendor
$(call inherit-product, vendor/samsung/vivalto3gvn/vivalto3gvn-vendor.mk)

# Dalvik heap config
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

# WiFi BCMDHD
$(call inherit-product, hardware/broadcom/wlan/bcmdhd/firmware/bcm4343/device-bcm.mk)

# AAPT configuration
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_AAPT_PREBUILT_DPI := hdpi mdpi ldpi

# Boot animation
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

# Prebuilt kernel
PRODUCT_COPY_FILES += \
	device/samsung/vivalto3gvn/kernel:kernel

# Rootdir files
ROOTDIR_FILES := \
	device/samsung/vivalto3gvn/rootdir/init.scx15.rc \
	device/samsung/vivalto3gvn/rootdir/init.scx15.usb.rc \
	device/samsung/vivalto3gvn/rootdir/init.scx15_ss.rc \
	device/samsung/vivalto3gvn/rootdir/init.vivalto3gvn.rc \
	device/samsung/vivalto3gvn/rootdir/init.vivalto3gvn_base.rc \
	device/samsung/vivalto3gvn/rootdir/init.wifi.rc \
	device/samsung/vivalto3gvn/rootdir/ueventd.scx15.rc \
	device/samsung/vivalto3gvn/rootdir/fstab.scx15 \

PRODUCT_COPY_FILES += \
	$(foreach f,$(ROOTDIR_FILES),$(f):root/$(notdir $(f)))

# System init .rc files
SYSTEM_INIT_RC_FILES := \
	device/samsung/vivalto3gvn/system/etc/init/at_distributor.rc \
	device/samsung/vivalto3gvn/system/etc/init/cameraserver.rc \
	device/samsung/vivalto3gvn/system/etc/init/chown_service.rc \
	device/samsung/vivalto3gvn/system/etc/init/data.rc \
	device/samsung/vivalto3gvn/system/etc/init/engpc.rc \
	device/samsung/vivalto3gvn/system/etc/init/gpsd.rc \
	device/samsung/vivalto3gvn/system/etc/init/hostapd.rc \
	device/samsung/vivalto3gvn/system/etc/init/kill_phone.rc \
	device/samsung/vivalto3gvn/system/etc/init/macloader.rc \
	device/samsung/vivalto3gvn/system/etc/init/mediacodec.rc \
	device/samsung/vivalto3gvn/system/etc/init/modemd.rc \
	device/samsung/vivalto3gvn/system/etc/init/nvitemd.rc \
	device/samsung/vivalto3gvn/system/etc/init/p2p_supplicant.rc \
	device/samsung/vivalto3gvn/system/etc/init/phoneserver.rc \
	device/samsung/vivalto3gvn/system/etc/init/refnotify.rc \
	device/samsung/vivalto3gvn/system/etc/init/rild.rc \
	device/samsung/vivalto3gvn/system/etc/init/set_mac.rc \
	device/samsung/vivalto3gvn/system/etc/init/smd_symlink.rc \
	device/samsung/vivalto3gvn/system/etc/init/swap.rc \
	device/samsung/vivalto3gvn/system/etc/init/wpa_supplicant.rc \

PRODUCT_COPY_FILES += \
	$(foreach f,$(SYSTEM_INIT_RC_FILES),$(f):system/etc/init/$(notdir $(f)))

# Recovery
PRODUCT_COPY_FILES += \
	device/samsung/vivalto3gvn/rootdir/init.recovery.scx15.rc:root/init.recovery.scx15.rc \
	device/samsung/vivalto3gvn/rootdir/twrp.fstab:recovery/root/etc/twrp.fstab \

# Keylayouts
KEYLAYOUT_FILES := \
	device/samsung/vivalto3gvn/keylayouts/ist30xx_ts_input.kl \
	device/samsung/vivalto3gvn/keylayouts/sci-keypad.kl

PRODUCT_COPY_FILES += \
	$(foreach f,$(KEYLAYOUT_FILES),$(f):system/usr/keylayout/$(notdir $(f)))

# Bluetooth config
BLUETOOTH_CONFIGS := \
	device/samsung/vivalto3gvn/configs/bluetooth/bt_vendor.conf

PRODUCT_COPY_FILES += \
	$(foreach f,$(BLUETOOTH_CONFIGS),$(f):system/etc/bluetooth/$(notdir $(f)))

# Media config
MEDIA_CONFIGS := \
	device/samsung/vivalto3gvn/media/media_codecs.xml \
	device/samsung/vivalto3gvn/media/media_profiles.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml

PRODUCT_COPY_FILES += \
	$(foreach f,$(MEDIA_CONFIGS),$(f):system/etc/$(notdir $(f)))

# HWC
PRODUCT_PACKAGES += \
	gralloc.scx15 \
	hwcomposer.scx15 \
	sprd_gsp.scx15 \
	libion_sprd \
	libdither \

# Codecs
PRODUCT_PACKAGES += \
	libstagefrighthw \
	libstagefright_sprd_soft_mpeg4dec \
	libstagefright_sprd_soft_h264dec \
	libstagefright_sprd_mpeg4dec \
	libstagefright_sprd_mpeg4enc \
	libstagefright_sprd_h264dec \
	libstagefright_sprd_h264enc \
	libstagefright_sprd_vpxdec \
	libstagefright_sprd_aacdec \
	libstagefright_sprd_mp3dec \

# Lights
PRODUCT_PACKAGES += \
	lights.scx15

# Bluetooth
PRODUCT_PACKAGES += \
	bluetooth.default \

# Audio
PRODUCT_PACKAGES += \
	audio.primary.scx15 \
	libaudio-resampler \
	libatchannel_wrapper \

AUDIO_CONFIGS := \
	device/samsung/vivalto3gvn/configs/audio/audio_policy.conf \
	device/samsung/vivalto3gvn/configs/audio/audio_hw.xml \
	device/samsung/vivalto3gvn/configs/audio/audio_para \
	device/samsung/vivalto3gvn/configs/audio/codec_pga.xml \
	device/samsung/vivalto3gvn/configs/audio/tiny_hw.xml \

PRODUCT_COPY_FILES += \
	$(foreach f,$(AUDIO_CONFIGS),$(f):system/etc/$(notdir $(f))) \

# Common libraries
PRODUCT_PACKAGES += \
	libmemoryheapion_sprd

# Shim libraries
PRODUCT_PACKAGES += \
	libril_shim \
	libgps_shim \

# GPS
GPS_CONFIGS := \
	device/samsung/vivalto3gvn/configs/gps/gps.xml \

PRODUCT_COPY_FILES += \
	$(foreach f,$(GPS_CONFIGS),$(f):system/etc/$(notdir $(f)))

# Nvitem
NVITEM_CONFIGS := \
	device/samsung/vivalto3gvn/configs/nvitem/nvitem_td.cfg \
	device/samsung/vivalto3gvn/configs/nvitem/nvitem_w.cfg

PRODUCT_COPY_FILES += \
	$(foreach f,$(NVITEM_CONFIGS),$(f):system/etc/$(notdir $(f)))

# Wifi
WIFI_CONFIGS := \
	device/samsung/vivalto3gvn/configs/wifi/wpa_supplicant.conf \
	device/samsung/vivalto3gvn/configs/wifi/nvram_net.txt \

PRODUCT_COPY_FILES += \
	$(foreach f,$(WIFI_CONFIGS),$(f):system/etc/wifi/$(notdir $(f)))

# Radio
PRODUCT_PACKAGES += \
	FMRadio \
	radio.fm.default \

# Memtrack
PRODUCT_PACKAGES += \
	memtrack.scx15 \

# Permissions
PERMISSION_XML_FILES := \
	frameworks/native/data/etc/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml \

PRODUCT_COPY_FILES += \
	$(foreach f,$(PERMISSION_XML_FILES),$(f):system/etc/permissions/$(notdir $(f)))

# Languages
PRODUCT_PROPERTY_OVERRIDES += \
	ro.product.locale.language=en \
	ro.product.locale.region=GB

# Override phone-hdpi-512-dalvik-heap to match value on stock
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.heapgrowthlimit=48m

# Enable Google-specific location features, like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.locationfeatures=1 \
	ro.com.google.networklocation=1

# ART device props
PRODUCT_PROPERTY_OVERRIDES += \
	ro.kernel.android.checkjni=0 \
	dalvik.vm.checkjni=false \
	dalvik.vm.dex2oat-Xms=8m \
	dalvik.vm.dex2oat-Xmx=96m \
	dalvik.vm.dex2oat-flags=--no-watch-dog \
	dalvik.vm.dex2oat-filter=speed \
	dalvik.vm.image-dex2oat-Xms=48m \
	dalvik.vm.image-dex2oat-Xmx=48m \
	dalvik.vm.image-dex2oat-filter=everything
