# Inherit from the common product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from sprd-common device configuration
$(call inherit-product, device/samsung/sprd-common/common.mk)

# Inherit from vendor
$(call inherit-product, vendor/samsung/vivalto3gvn/vivalto3gvn-vendor.mk)

# Common Android Go configurations
$(call inherit-product, build/target/product/go_defaults_512.mk)

# Dalvik heap config
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

# WiFi BCMDHD
$(call inherit-product, hardware/broadcom/wlan/bcmdhd/firmware/bcm4343/device-bcm.mk)

# Trusty Gatekeeper and Keymaster
$(call inherit-product, system/core/trusty/trusty-base.mk)

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

# Vendor init
files := \
	$(DEVICE_PATH)/system/vendor/etc/init/at_distributor.rc \
	$(DEVICE_PATH)/system/vendor/etc/init/chown_service.rc \
	$(DEVICE_PATH)/system/vendor/etc/init/data.rc \
	$(DEVICE_PATH)/system/vendor/etc/init/engpc.rc \
	$(DEVICE_PATH)/system/vendor/etc/init/gpsd.rc \
	$(DEVICE_PATH)/system/vendor/etc/init/kill_phone.rc \
	$(DEVICE_PATH)/system/vendor/etc/init/macloader.rc \
	$(DEVICE_PATH)/system/vendor/etc/init/modemd.rc \
	$(DEVICE_PATH)/system/vendor/etc/init/nvitemd.rc \
	$(DEVICE_PATH)/system/vendor/etc/init/phoneserver.rc \
	$(DEVICE_PATH)/system/vendor/etc/init/refnotify.rc \
	$(DEVICE_PATH)/system/vendor/etc/init/rild.rc \
	$(DEVICE_PATH)/system/vendor/etc/init/set_mac.rc \
	$(DEVICE_PATH)/system/vendor/etc/init/smd_symlink.rc \
	$(DEVICE_PATH)/system/vendor/etc/init/swap.rc \
	$(DEVICE_PATH)/system/vendor/etc/init/wpa_supplicant.rc \
	$(DEVICE_PATH)/system/vendor/etc/init/android.hardware.media.omx@1.0-service.rc \

PRODUCT_COPY_FILES += \
	$(foreach f,$(files),$(f):$(TARGET_COPY_OUT_VENDOR)/etc/init/$(notdir $(f)))

# System init

files := \
	$(DEVICE_PATH)/system/etc/init/mediaserver.rc \

PRODUCT_COPY_FILES += \
	$(foreach f,$(files),$(f):$(TARGET_COPY_OUT_SYSTEM)/etc/init/$(notdir $(f)))

# Recovery
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/rootdir/init.recovery.scx15.rc:root/init.recovery.scx15.rc \
	$(DEVICE_PATH)/rootdir/twrp.fstab:recovery/root/etc/twrp.fstab \

# Keylayout
files := \
	$(DEVICE_PATH)/system/vendor/usr/keylayout/ist30xx_ts_input.kl \
	$(DEVICE_PATH)/system/vendor/usr/keylayout/sci-keypad.kl \
	$(DEVICE_PATH)/system/vendor/usr/keylayout/headset-keyboard.kl \

PRODUCT_COPY_FILES += \
	$(foreach f,$(files),$(f):$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/$(notdir $(f)))

# Bluetooth
files := \
	$(DEVICE_PATH)/system/etc/bluetooth/bt_vendor.conf

PRODUCT_COPY_FILES += \
	$(foreach f,$(files),$(f):$(TARGET_COPY_OUT_SYSTEM)/etc/bluetooth/$(notdir $(f)))

# Media
files := \
	$(DEVICE_PATH)/system/vendor/etc/audio_policy.conf \
	$(DEVICE_PATH)/system/vendor/etc/audio_hw.xml \
	$(DEVICE_PATH)/system/vendor/etc/audio_para \
	$(DEVICE_PATH)/system/vendor/etc/codec_pga.xml \
	$(DEVICE_PATH)/system/vendor/etc/tiny_hw.xml \
	$(DEVICE_PATH)/system/vendor/etc/media_codecs.xml \
	$(DEVICE_PATH)/system/vendor/etc/media_profiles_V1_0.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml \

PRODUCT_COPY_FILES += \
	$(foreach f,$(files),$(f):$(TARGET_COPY_OUT_VENDOR)/etc/$(notdir $(f)))

# Seccomp
files := \
	$(DEVICE_PATH)/system/vendor/etc/seccomp_policy/mediacodec.policy \
	$(DEVICE_PATH)/system/vendor/etc/seccomp_policy/mediaextractor.policy \

PRODUCT_COPY_FILES += \
	$(foreach f,$(files),$(f):$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/$(notdir $(f)))

# GPS
files := \
	$(DEVICE_PATH)/system/vendor/etc/gps.conf \
	$(DEVICE_PATH)/system/vendor/etc/gps.xml \

PRODUCT_COPY_FILES += \
	$(foreach f,$(files),$(f):$(TARGET_COPY_OUT_VENDOR)/etc/$(notdir $(f)))

# Wifi
files := \
	$(DEVICE_PATH)/system/vendor/etc/wifi/nvram_net.txt \

PRODUCT_COPY_FILES += \
	$(foreach f,$(files),$(f):$(TARGET_COPY_OUT_VENDOR)/etc/wifi/$(notdir $(f)))

# Telephony
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/system/vendor/etc/spn-conf.xml:$(TARGET_COPY_OUT_VENDOR)/etc/spn-conf.xml

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
	sensors.scx15 \

# RIL
PRODUCT_PACKAGES += \
	modemd \
	nvitemd \
	refnotify \
	rild \
	libsecril-client \
	libatchannel \

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
	libsecril-shim \
	libril_shim \
	libgps_shim \
	libstagefright_shim \
	libphoneserver_shim \

# Treble
PRODUCT_PACKAGES += \
	android.hardware.audio@2.0-service \
	android.hardware.audio@2.0-impl \
	android.hardware.audio.effect@2.0-impl \
	android.hardware.camera.provider@2.4-impl-legacy \
	android.hardware.wifi@1.0-service \
	android.hardware.keymaster@3.0-impl \
	android.hardware.keymaster@3.0-service \
	android.hardware.radio@1.0 \
	android.hardware.radio.deprecated@1.0 \
	android.hardware.usb@1.0-service \
	android.hardware.radio@1.0 \
	android.hardware.radio.deprecated@1.0 \
	android.hardware.gnss@1.0-impl \
	android.hardware.power@1.0-impl \
	android.hardware.light@2.0-impl \
	android.hardware.vibrator@1.0-impl \
	android.hardware.sensors@1.0-impl \
	android.hardware.memtrack@1.0-impl \
	android.hardware.gatekeeper@1.0-impl \
	android.hardware.gatekeeper@1.0-service \

#	android.hardware.health@1.0-impl \
#	android.hardware.thermal@1.1-impl \
#	android.hardware.configstore@1.0-impl \
#	android.hardware.graphics.allocator@2.0-impl \
#	android.hardware.graphics.mapper@2.0-impl \
#	android.hardware.graphics.composer@2.1-impl \
#	android.hardware.graphics.composer@2.1-service \

PRODUCT_PACKAGES += \
	Snap \

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
PRODUCT_PROPERTY_OVERRIDES += \
	ro.secure=0 \
	ro.adb.secure=0 \
	ro.debuggable=1 \
	persist.sys.root_access=1 \
	persist.service.adb.enable=1
