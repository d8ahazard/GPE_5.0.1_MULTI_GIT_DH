#!/sbin/sh
# script for modPack
# ========================================
# Created by lyapota

fullname=$1
filename=$(basename $fullname)

if [ -e $fullname ]; then
    if [ -d /tmp/$filename ]; then
        cd /tmp/$filename

        echo "Processing $fullname"
        /tmp/zip -r $fullname *

        echo "Zipaligning $fullname"
        cd /system/lib
        /tmp/zipalign -f 4 $fullname /cache/$filename

        if [ -e /cache/$filename ]; then
            cp -f -p /cache/$filename $fullname
            rm /cache/$filename
        else
            echo ZipAligning $filename failed
        fi;
    else
        echo $filename not found
    fi;
else
  echo $fullname not found
fi;

