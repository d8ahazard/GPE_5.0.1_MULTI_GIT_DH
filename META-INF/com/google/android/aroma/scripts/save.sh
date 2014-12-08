#!/sbin/sh
mount /system;
if [ ! -d /system/aroma ]; then
	mkdir /system/aroma;
fi
cp -f /tmp/aroma-data/*.prop /system/aroma/;
cp -f /tmp/aroma-data/menuprop /system/aroma/;
cp -f /tmp/aroma-data/backprop /system/aroma/;
cp -f /tmp/aroma-data/battprop /system/aroma/;
rm -rf /system/aroma/wipe.prop;
umount /system;
exit 0