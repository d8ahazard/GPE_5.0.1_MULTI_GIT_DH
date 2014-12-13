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
        
    else
        echo $filename not found
    fi;
else
  echo $fullname not found
fi;

