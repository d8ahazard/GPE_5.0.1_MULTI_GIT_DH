#!/sbin/sh

sed -i '/lpa.decode/s/true/false/g' /system/build.prop
sed -i '/tunnel.decode/s/false/true/g' /system/build.prop
sed -i '/lpa.use-stagefright/s/true/false/g' /system/build.prop
echo lpa.releaselock=false >> /system/build.prop