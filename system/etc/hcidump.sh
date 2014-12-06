#!/system/bin/sh
#Copyright (c) 2011-2013, The Linux Foundation. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of Code Aurora nor
#       the names of its contributors may be used to endorse or promote
#       products derived from this software without specific prior written
#       permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NON-INFRINGEMENT ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

LOG_DIR="/sdcard/htclog/"
LOG_TAG="BtSnoop"
LOG_FILE=`date +%Y%m%d%H%M%S`.cfa

logv ()
{
  /system/bin/log -t $LOG_TAG -p v "$LOG_NAME $@"
}

if [ -f /mnt/sdcard/hcidumpconf.txt ]
then
  LOG_DIR="/sdcard/htclog/"
  source /mnt/sdcard/hcidumpconf.txt
  logv "HCIDUMP options on sdcard got detected as $HCIDUMP_OPTS"
elif [ -f /data/hcidumpconf.txt ]
then
  source /data/hcidumpconf.txt
  logv "HCIDUMP options on data got detected as $HCIDUMP_OPTS"
else
  HCIDUMP_OPTS=1
  logv "hcidumpconf.txt doesn't exist. Default output to logcat"
fi

mkdir $LOG_DIR
case $HCIDUMP_OPTS in
  1)  logv "Starting hcidump to adb logs"
      /system/bin/logwrapper /system/xbin/hcidump -x
      ;;

  2)  logv "Starting hcidump to $LOG_DIR$LOG_FILE"
      /system/xbin/hcidump -Rw $LOG_DIR$LOG_FILE 
      ;;

  3 | "true" | "TRUE") 
      logv "Starting hcidump to adb logs & $LOG_DIR$LOG_FILE"
      /system/xbin/hcidump -Rw $LOG_DIR$LOG_FILE &
      /system/bin/logwrapper /system/xbin/hcidump -x
      ;;

  4 | 6) 
      /system/xbin/hcidump -f a2dp -Rw $LOG_DIR$LOG_FILE &  
      ;;

  5 | 7)
      /system/xbin/hcidump -f a2dp -Rw $LOG_DIR$LOG_FILE &
      /system/bin/logwrapper /system/xbin/hcidump -x
      ;;

  *)  logv "hcidump is not started"
      ;;

esac
