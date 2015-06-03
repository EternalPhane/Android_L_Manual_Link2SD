#!/system/bin/sh
# added by eternalphane
# edit with Visual Studio Code 0.3.0

LOG=/data/log/mountlog.log
ERR_LOG=/data/log/mounterr.log
echo "$(date) mounting..." > $LOG
sleep 1

if [ -f $ERR_LOG ];then
  rm $ERR_LOG
fi
if [ ! -d /data/sdext4 ];then
  mkdir /data/sdext4
fi
sleep 1

mount -t ext4 -o rw /dev/block/vold/179:34 /data/sdext4 1>>$LOG 2>$ERR_LOG
echo

mount -t ext4 -o rw /dev/block/mmcblk1p2 /data/sdext4 1>>$LOG 2>>$ERR_LOG
echo

mount >> $LOG
echo "$(date) mount finished" >> $LOG

chmod 773 /data/dalvik-cache