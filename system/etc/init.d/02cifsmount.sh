#!/system/bin/sh

# Your settings here
IP="192.168.1.123"
SHARE="Music"
USER="yourusername"
PASS="yourpassword"
MOUNTPOINT="/data/media/0/cifs"
VERMAGIC="3.0.31-CM-ga034655-dirty SMP preempt mod_unload ARMv7 p2v8 "

# Load cifs (if it isn't already loaded)
if [ `lsmod | grep -o cifs` ] ; then
	:
else
	insmod /system/lib/modules/cifs.ko
fi

# Load nls_utf8 brute-force style (if it isn't already loaded)
if [ `lsmod | grep -o nls_utf8` ] ; then
	:
else
	/system/lib/modules/punchmod /system/lib/modules/nls_utf8.ko "" "$VERMAGIC"
fi

# Check if cifs $MOUNTPOINT dir exists, create it if not, give sufficient permissions
if [ -d $MOUNTPOINT ] ; then 
	: 
else
	mkdir $MOUNTPOINT
fi
chmod 755 $MOUNTPOINT

# Check if $SHARE directory is empty - if not, unmount the share
if [ "$(su root -c busybox ls -A $MOUNTPOINT/$SHARE 2> /dev/null)" == "" ] ; then
	:
else
	/system/xbin/busybox umount -l $MOUNTPOINT/$SHARE
fi

# Create $SHARE directory if necessary, give sufficient permissions
if [ -d $MOUNTPOINT/$SHARE ] ; then 
	: 
else
	mkdir $MOUNTPOINT/$SHARE
fi
chmod 755 $MOUNTPOINT/$SHARE

# Starting adb
adb kill-server
export HOME=/sdcard
# PORT=`getprop service.adb.tcp.port`
setprop service.adb.tcp.port 5555
adb start-server
cat /sdcard/.android/adbkey.pub >> /data/misc/adb/adb_keys
stop adbd
start adbd
adb connect localhost

# Make sure we only use the first device (sometimes there is more than one)
SERIAL=`adb devices | head -n2 | tail -n1 | cut -f1`
if [ "$SERIAL" = "" ] ; then
    echo "ERROR: Could not find ADB device.";
fi

# Mounting share via adb
echo Mounting share via adb...
adb -s $SERIAL shell su root -c /system/xbin/busybox mount -t cifs //$IP/$SHARE $MOUNTPOINT/$SHARE -o user=$USER,pass=$PASS,iocharset=utf8,cache=none,directio,CIFSMaxBufSize=130048,rw,file_mode=0777,dir_mode=0777,uid=1015,gid=1015

# If you started adb, then stop it here for security
adb disconnect localhost
stop adbd
PORT=`getprop service.adb.tcp.port`
setprop service.adb.tcp.port $PORT
start adbd

# Show some results
RESULT=`mount | grep $MOUNTPOINT/$SHARE`

if [ "$RESULT" = "" ] ; then
    echo "FAILED! //$IP/$SHARE could not be mounted."
else
    echo "SUCCESS! //$IP/$SHARE has been mounted on $MOUNTPOINT/$SHARE."
fi

echo 
echo All done. You may close this script window now.