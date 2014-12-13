#!/sbin/sh


ln -s /system/lib/modules/pronto/pronto_wlan.ko /system/lib/modules/wlan.ko

if [ ! -f /system/lib/modules/moc_crypto.ko ]; then
   ln -s /system/lib/modules/pronto/moc_crypto.ko.3.4.10 /system/lib/modules/moc_crypto.ko
fi

if [ ! -f /system/lib/modules/moc_platform_mod.ko ]; then
   ln -s /system/lib/modules/pronto/moc_platform_mod.ko.3.4.10 /system/lib/modules/moc_platform_mod.ko
fi
