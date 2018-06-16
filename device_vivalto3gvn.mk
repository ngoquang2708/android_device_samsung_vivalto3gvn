# Inherit from the common product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

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

DEVICE_PATH := device/samsung/vivalto3gvn

# Root init
files := \
	$(DEVICE_PATH)/rootdir/init.scx15.rc \
	$(DEVICE_PATH)/rootdir/init.scx15.usb.rc \
	$(DEVICE_PATH)/rootdir/init.scx15_ss.rc \
	$(DEVICE_PATH)/rootdir/init.vivalto3gvn.rc \
	$(DEVICE_PATH)/rootdir/init.vivalto3gvn_base.rc \
	$(DEVICE_PATH)/rootdir/init.wifi.rc \
	$(DEVICE_PATH)/rootdir/ueventd.scx15.rc \
	$(DEVICE_PATH)/rootdir/fstab.scx15 \

PRODUCT_COPY_FILES += \
	$(foreach f,$(files),$(f):root/$(notdir $(f)))

# System init
files := \
	$(DEVICE_PATH)/system/etc/init/at_distributor.rc \
	$(DEVICE_PATH)/system/etc/init/chown_service.rc \
	$(DEVICE_PATH)/system/etc/init/data.rc \
	$(DEVICE_PATH)/system/etc/init/engpc.rc \
	$(DEVICE_PATH)/system/etc/init/gpsd.rc \
	$(DEVICE_PATH)/system/etc/init/hostapd.rc \
	$(DEVICE_PATH)/system/etc/init/kill_phone.rc \
	$(DEVICE_PATH)/system/etc/init/macloader.rc \
	$(DEVICE_PATH)/system/etc/init/mediacodec.rc \
	$(DEVICE_PATH)/system/etc/init/mediaserver.rc \
	$(DEVICE_PATH)/system/etc/init/modemd.rc \
	$(DEVICE_PATH)/system/etc/init/nvitemd.rc \
	$(DEVICE_PATH)/system/etc/init/p2p_supplicant.rc \
	$(DEVICE_PATH)/system/etc/init/phoneserver.rc \
	$(DEVICE_PATH)/system/etc/init/refnotify.rc \
	$(DEVICE_PATH)/system/etc/init/rild.rc \
	$(DEVICE_PATH)/system/etc/init/set_mac.rc \
	$(DEVICE_PATH)/system/etc/init/smd_symlink.rc \
	$(DEVICE_PATH)/system/etc/init/swap.rc \
	$(DEVICE_PATH)/system/etc/init/wpa_supplicant.rc \

PRODUCT_COPY_FILES += \
	$(foreach f,$(files),$(f):$(TARGET_COPY_OUT_SYSTEM)/etc/init/$(notdir $(f)))

# Recovery
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/rootdir/init.recovery.scx15.rc:root/init.recovery.scx15.rc \
	$(DEVICE_PATH)/rootdir/twrp.fstab:recovery/root/etc/twrp.fstab \

# Keylayout
files := \
	$(DEVICE_PATH)/system/usr/keylayout/ist30xx_ts_input.kl \
	$(DEVICE_PATH)/system/usr/keylayout/sci-keypad.kl \
	$(DEVICE_PATH)/system/usr/keylayout/headset-keyboard.kl \

PRODUCT_COPY_FILES += \
	$(foreach f,$(files),$(f):$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/$(notdir $(f)))

# Bluetooth
files := \
	$(DEVICE_PATH)/system/etc/bluetooth/bt_vendor.conf

PRODUCT_COPY_FILES += \
	$(foreach f,$(files),$(f):$(TARGET_COPY_OUT_SYSTEM)/etc/bluetooth/$(notdir $(f)))

# Media
files := \
	$(DEVICE_PATH)/system/etc/audio_policy.conf \
	$(DEVICE_PATH)/system/etc/audio_hw.xml \
	$(DEVICE_PATH)/system/etc/audio_para \
	$(DEVICE_PATH)/system/etc/codec_pga.xml \
	$(DEVICE_PATH)/system/etc/tiny_hw.xml \
	$(DEVICE_PATH)/system/etc/media_codecs.xml \
	$(DEVICE_PATH)/system/etc/media_profiles.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml \

PRODUCT_COPY_FILES += \
	$(foreach f,$(files),$(f):$(TARGET_COPY_OUT_SYSTEM)/etc/$(notdir $(f)))

# GPS
files := \
	$(DEVICE_PATH)/system/etc/gps.conf \
	$(DEVICE_PATH)/system/etc/gps.xml \

PRODUCT_COPY_FILES += \
	$(foreach f,$(files),$(f):$(TARGET_COPY_OUT_SYSTEM)/etc/$(notdir $(f)))

# Wifi
files := \
	$(DEVICE_PATH)/system/etc/wifi/nvram_net.txt \

PRODUCT_COPY_FILES += \
	$(foreach f,$(files),$(f):$(TARGET_COPY_OUT_SYSTEM)/etc/wifi/$(notdir $(f)))

# Telephony
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/system/etc/spn-conf.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/spn-conf.xml

# Permissions
files := \
	frameworks/native/data/etc/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml \

PRODUCT_COPY_FILES += \
	$(foreach f,$(files),$(f):$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/$(notdir $(f)))

# HALs
PRODUCT_PACKAGES += \
	audio.primary.scx15 \
	libaudio-resampler \
	camera.scx15 \
	camera2.scx15 \
	bluetooth.default \
	memtrack.scx15 \
	gralloc.scx15 \
	hwcomposer.scx15 \
	sprd_gsp.scx15 \
	libdither \
	lights.scx15 \
	libion_sprd \
	libmemoryheapion_sprd \
	libbt-vendor \

#	sensors.scx15 \

# RIL
PRODUCT_PACKAGES += \
	modemd \
	nvitemd \
	refnotify \

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

# Shim
PRODUCT_PACKAGES += \
	libril_shim \
	libgps_shim \
	libstagefright_shim \

# Languages
PRODUCT_PROPERTY_OVERRIDES += \
	ro.product.locale.language=en \
	ro.product.locale.region=GB

# Google-specific location features
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.locationfeatures=1 \
	ro.com.google.networklocation=1

# ART device props
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.dex2oat-Xms=8m \
	dalvik.vm.dex2oat-Xmx=96m \
	dalvik.vm.dex2oat-flags=--no-watch-dog \

# Enable insecure ADB for userdebug builds
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.secure=0 \
	ro.adb.secure=0 \
	ro.debuggable=1 \
	persist.sys.root_access=1 \
	persist.service.adb.enable=1 \

