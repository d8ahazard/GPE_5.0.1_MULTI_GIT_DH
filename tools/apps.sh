#!/sbin/sh
syspath='/system/app/'
datapath='/data/app/'
wipe='cat /tmp/aroma/wipe.prop'
wipeprop='selected.0=2'

names='/tmp/moved.txt'
aapt='/tmp/aapt'
cd /tmp
cat /tmp/moved.txt | while read LINE ; do
	if [ "$wipe"="$wipeprop" ];
	then
		if [ -e $datapath$line ];
		then
			package=`aapt dump badging $datapath$line\$line".apk"' | grep package | busybox awk '{print $2}' | busybox sed s/name=//g | busybox sed s/\'//g`
			rm -rf $datapath$package"-1"
			rm -rf $datapath$package"-2"
			rm -rf $datapath$package"-3"
		fi
		#mv $syspath$line $datapath$line
	fi
done < "$names"
