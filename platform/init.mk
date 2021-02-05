### FIRST STAGE INIT
PRODUCT_PACKAGES += \
    fstab.samsungexynos9810_ramdisk

### INIT
PRODUCT_PACKAGES += \
    init.samsungexynos9810.root.rc \
    init.samsungexynos9810.rc \
    init.samsungexynos9810.usb.rc \
    fstab.samsungexynos9810 \
    ueventd.samsungexynos9810.rc
