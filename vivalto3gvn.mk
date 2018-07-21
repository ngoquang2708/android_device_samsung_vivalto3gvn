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

$(call inherit-product, $(DEVICE_PATH)/packages.mk)
$(call inherit-product, $(DEVICE_PATH)/prop.mk)
$(call inherit-product, $(DEVICE_PATH)/treble.mk)
