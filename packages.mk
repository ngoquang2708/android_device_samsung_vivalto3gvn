# HALs
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    audio.primary.scx15 \
    libtinyalsa \
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
    sensors.scx15

# WiFi
PRODUCT_PACKAGES += \
    wpa_supplicant \
    wpa_supplicant.conf \
    hostapd

# RIL
PRODUCT_PACKAGES += \
    modemd \
    nvitemd \
    refnotify \
    rild \
    libsecril-client \
    libatchannel

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
    libstagefright_sprd_mp3dec

# Shim
PRODUCT_PACKAGES += \
    libsecril-shim \
    libril_shim \
    libgps_shim \
    libstagefright_shim \
    libphoneserver_shim

# Filesystem management tools
PRODUCT_PACKAGES += \
    f2fstat \
    fibmap.f2fs \
    fsck.f2fs \
    mkfs.f2fs \
    setup_fs

# Misc
PRODUCT_PACKAGES += \
    Snap

