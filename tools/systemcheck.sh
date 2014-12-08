#!/sbin/sh

if [ ! -f /system/xbin/busybox ]; then
   cp /tmp/busybox /system/xbin/busybox; 
   chmod 755 /system/xbin/busybox;
   /system/xbin/busybox --install -s /system/xbin
fi

if [ ! -d /system/etc/init.d ]; then
   if [ -f /system/etc/init.d ]; then
      mv /system/etc/init.d /system/etc/init.d.bak;
   fi
   mkdir /system/etc/init.d;
fi

ln -s /system/lib/modules/pronto/pronto_wlan.ko /system/lib/modules/wlan.ko

if [ ! -f /system/lib/modules/moc_crypto.ko ]; then
   ln -s /system/lib/modules/pronto/moc_crypto.ko.3.4.10 /system/lib/modules/moc_crypto.ko
fi

if [ ! -f /system/lib/modules/moc_platform_mod.ko ]; then
   ln -s /system/lib/modules/pronto/moc_platform_mod.ko.3.4.10 /system/lib/modules/moc_platform_mod.ko
fi
