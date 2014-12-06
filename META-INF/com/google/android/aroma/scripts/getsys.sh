#!/sbin/sh

getprop > /tmp/aroma/system.prop
sed -i 's/: /=/g' /tmp/aroma/system.prop
sed -i 's/\[//g;s/\]//g' /tmp/aroma/system.prop 