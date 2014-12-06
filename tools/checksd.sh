#!/sbin/sh
if [ -e /external_sd ]; 
then
	echo "hassd=1" >> /tmp/aroma/sd.prop
else
	echo "hassd=0" >> /tmp/aroma/sd.prop
fi