#!/sbin/sh

#Build config file
CONFIGFILE="/tmp/aroma/add.prop"

#back key
backkey=`grep "item.0.1" /tmp/aroma/mods.prop | cut -d '=' -f2`
if [ "$backkey" = "1" ]; then
  echo "backkey=1" >> $CONFIGFILE;
else
  echo "backkey=0" >> $CONFIGFILE;
fi
#showmenu
batt=`grep "item.0.2" /tmp/aroma/mods.prop | cut -d '=' -f2`
if [ "$showmenu" = "1" ]; then
  echo "showmenu=1" >> $CONFIGFILE;
else
  echo "showmenu=0" >> $CONFIGFILE;
fi

#battery
batt=`grep "item.0.3" /tmp/aroma/mods.prop | cut -d '=' -f2`
if [ "$batt" = "1" ]; then
  echo "battpct=1" >> $CONFIGFILE;
else
  echo "battpct=0" >> $CONFIGFILE;
fi


#END
