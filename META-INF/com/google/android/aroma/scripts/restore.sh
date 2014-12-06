#!/sbin/sh
mount /system;
if [ ! -d /system/aroma ] ; then
	echo "AROMA Directory Not Found!";
	umount /system;
	exit 10;
fi
if [ ! -e /system/aroma/wipe.prop ] ; then
	rm -rf /system/aroma/wipe.prop;
fi
cp -f /system/aroma/*.prop /tmp/aroma-data/;
umount /system;
exit 0