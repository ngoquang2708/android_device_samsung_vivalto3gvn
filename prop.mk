# HW
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.hardware=VIVALTO_V1.0.0

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
    dalvik.vm.dex2oat-flags=--no-watch-dog

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240 \
    ro.sf.lcd_width=52 \
    ro.sf.lcd_height=87 \
    ro.opengles.version=131072 \
    ro.egl.destroy_after_detach=true \
    debug.hwui.render_dirty_regions=false

# DRM
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=1

# Strict Mode
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.strictmode.disable=1

# zRAM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.zram.compressor=lz4 \
    ro.config.zram.disksize=128M

# ADB
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb \
    persist.sys.root_access=1 \
    persist.service.adb.enable=1 \
    ro.secure=0 \
    ro.adb.secure=0 \
    ro.debuggable=1 \

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.legacyencoder=true \
    media.stagefright.less-secure=true \
    persist.media.treble_omx=false

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/vendor/lib/libsecril-shim.so \
    ro.product.partitionpath=/dev/block/platform/sprd-sdhci.3/by-name/ \
    persist.modem.w.enable=1 \
    ro.modem.w.dev=/dev/cpw \
    ro.modem.w.tty=/dev/stty_w \
    ro.modem.w.eth=rmnet \
    ro.modem.w.snd=2 \
    ro.modem.w.diag=/dev/slog_w \
    ro.modem.w.loop=/dev/spipe_w0 \
    ro.modem.w.nv=/dev/spipe_w1 \
    ro.modem.w.assert=/dev/spipe_w2 \
    ro.modem.w.vbc=/dev/spipe_w6 \
    ro.modem.w.id=0 \
    ro.modem.w.count=2 \
    ro.modem.w.fixnv_size=0x40000 \
    ro.modem.w.runnv_size=0x60000 \
    ro.modem.w.nvp="" \
    ro.msms.phone_count=2 \
    persist.msms.phone_count=2 \
    persist.msmslt=0 \
    persist.sys.modem.diag=,gser \
    sys.usb.gser.count=2 \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    persist.radio.multisim.config=dsds \
    ro.ril.telephony.mqanelements=6 \
    keyguard.no_require_sim=true \
    ro.com.android.dataroaming=false \
    persist.sys.sprd.modemreset=0

# Package Manager
PRODUCT_PROPERTY_OVERRIDES += \
    pm.dexopt.first-boot=extract \
    pm.dexopt.boot=extract \
    pm.dexopt.install=quicken \
    pm.dexopt.bg-dexopt=speed-profile \
    pm.dexopt.ab-ota=speed-profile \
    pm.dexopt.inactive=verify \
    pm.dexopt.shared=speed
