#!/sbin/sh

#Build config file
CONFIGFILE="/tmp/skydragon.conf"

#Wake Gestures
WG=`grep selected.0 /tmp/aroma/wg.prop | cut -d '=' -f2`
echo -e "\n\n##### Wake Gestures Settings #####\n# 0 to disable wake gestures" >> $CONFIGFILE
echo -e "# 1 to enable wake gestures\n" >> $CONFIGFILE
if [ $WG = 2 ]; then
  echo "WG=1" >> $CONFIGFILE;
else
  echo "WG=0" >> $CONFIGFILE;
fi

#S2W
SR=`grep "item.1.1" /tmp/aroma/gest.prop | cut -d '=' -f2`
SL=`grep "item.1.2" /tmp/aroma/gest.prop | cut -d '=' -f2`
SU=`grep "item.1.3" /tmp/aroma/gest.prop | cut -d '=' -f2`
SD=`grep "item.1.4" /tmp/aroma/gest.prop | cut -d '=' -f2`
echo -e "\n\n##### Sweep2wake Settings #####\n# 0 to disable sweep2wake" >> $CONFIGFILE
echo -e "# 1 to enable sweep right" >> $CONFIGFILE
echo -e "# 2 to enable sweep left" >> $CONFIGFILE
echo -e "# 4 to enable sweep up" >> $CONFIGFILE
echo -e "# 8 to enable sweep down\n" >> $CONFIGFILE
echo -e "# For combinations, add values together (e.g. all gestures enabled = 15)\n" >> $CONFIGFILE
if [ $SL = 1 ]; then
  SL=2
fi
if [ $SU == 1 ]; then
  SU=4
fi
if [ $SD == 1 ]; then
  SD=8
fi  

if [ $WG = 1 ]; then
  echo S2W=0 >> $CONFIGFILE;
else
  S2W=$(( SL + SR + SU + SD ))
  echo S2W=$S2W >> $CONFIGFILE;
fi

#DT2W
DT2W=`grep "item.1.5" /tmp/aroma/gest.prop | cut -d '=' -f2`
echo -e "\n\n##### Doubletap2wake Settings #####\n# 0 to disable Doubletap2wake" >> $CONFIGFILE
echo -e "# 1 to enable Doubletap2wake (default)\n" >> $CONFIGFILE
if [ $DT2W = 1 ] && [ $WG != 1 ]; then
  echo "DT2W=1" >> $CONFIGFILE;
else
  echo "DT2W=0" >> $CONFIGFILE;
fi

#WG vibration strength
WVIB=`grep "item.2.1" /tmp/aroma/gest.prop | cut -d '=' -f2`
echo -e "\n\n##### Wake Vibration Settings #####\n# Set vibration strength (0 to 60)" >> $CONFIGFILE
echo -e "# 0 to disable haptic feedback\n" >> $CONFIGFILE
echo -e "# 20 is default\n" >> $CONFIGFILE
if [ $WVIB = 1 ]; then
  echo "WVIB=20" >> $CONFIGFILE;
else
  echo "WVIB=0" >> $CONFIGFILE;
fi

#Pocket Detection
POCKET=`grep "item.2.2" /tmp/aroma/gest.prop | cut -d '=' -f2`
echo -e "\n\n##### Pocket Detectione Settings #####\n# 0 to disable Pocket Detection (default)" >> $CONFIGFILE
echo -e "# 1 to enable Pocket Detection\n" >> $CONFIGFILE
if [ $POCKET = 1 ]; then
  echo "POCKET=1" >> $CONFIGFILE;
else
  echo "POCKET=0" >> $CONFIGFILE;
fi

#Camera Launch
CAM=`grep "item.2.3" /tmp/aroma/gest.prop | cut -d '=' -f2`
echo -e "\n\n##### Camera Launch Settings #####\n# 0 to disable volume buttons launch camera in landscape" >> $CONFIGFILE
echo -e "# 1 to enable volume buttons launch camera in landscape\n" >> $CONFIGFILE
if [ $CAM = 1 ]; then
  echo "CAM=1" >> $CONFIGFILE;
else
  echo "CAM=0" >> $CONFIGFILE;
fi

#S2S
S2S=`grep selected.0 /tmp/aroma/s2s.prop | cut -d '=' -f2`
echo -e "\n\n##### Sweep2sleep Settings #####\n# 0 to disable sweep2sleep" >> $CONFIGFILE
echo -e "# 1 to enable sweep2sleep right" >> $CONFIGFILE
echo -e "# 2 to enable sweep2sleep left" >> $CONFIGFILE
echo -e "# 3 to enable sweep2sleep left and right\n" >> $CONFIGFILE
if [ $S2S = 2 ]; then
  echo "S2S=1" >> $CONFIGFILE;
elif [ $S2S = 3 ]; then
  echo "S2S=2" >> $CONFIGFILE;
elif [ $S2S = 4 ]; then
  echo "S2S=3" >> $CONFIGFILE;
else
  echo "S2S=0" >> $CONFIGFILE;
fi

#USB Fastcharge
FC=`grep "item.0.1" /tmp/aroma/sky.prop | cut -d '=' -f2`
echo -e "\n\n##### Fastcharge Settings ######\n# 1 to enable usb fastcharge\n# 0 to disable usb fastcharge\n" >> $CONFIGFILE
if [ $FC = 1 ]; then
  echo "FC=1" >> $CONFIGFILE;
else
  echo "FC=0" >> $CONFIGFILE;
fi

#fsync
FSYNC=`grep "item.0.2" /tmp/aroma/sky.prop | cut -d '=' -f2`
echo -e "\n\n##### fsync Settings ######\n# 1 to enable (default)\n# 0 to disable\n" >> $CONFIGFILE
if [ $FSYNC = 1 ]; then
  echo "FSYNC=0" >> $CONFIGFILE;
else
  echo "FSYNC=1" >> $CONFIGFILE;
fi

#Reduce button vibration
SVIB=`grep "item.0.3 /tmp/aroma/sky.prop | cut -d '=' -f2`
echo -e "\n\n##### Button Vibration #####\n# Values: 0 to 3100" >> $CONFIGFILE
if [ $SVIB = 1 ]; then
  echo "SVIB=2500" >> $CONFIGFILE;
else
  echo "SVIB=3100" >> $CONFIGFILE;
fi

#Graphics Boost
GBOOST=`grep "item.0.4" /tmp/aroma/sky.prop | cut -d '=' -f2`
echo -e "\n\n##### Graphics Boost Settings ######\n# 1 to enable\n# 0 to disable\n" >> $CONFIGFILE
if [ $GBOOST = 1 ]; then
  echo "GBOOST=1" >> $CONFIGFILE;
else
  echo "GBOOST=0" >> $CONFIGFILE;
fi

echo -e "\n\n##############################" >> $CONFIGFILE
#END
