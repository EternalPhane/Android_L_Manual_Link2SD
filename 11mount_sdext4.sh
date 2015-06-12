#!/system/bin/sh
# added by eternalphane
# edit with Visual Studio Code 0.3.0

LOG_DIR=/data/log
MOUNT_DIR=/data/sdext4
LOG=${LOG_DIR}/mountlog.log
ERR_LOG=${LOG_DIR}/mounterr.log
echo "$(date) mounting..." > $LOG
sleep 1

if [ ! -d ${LOG_DIR} ];then
  mkdir ${LOG_DIR}
fi
if [ -f ${ERR_LOG} ];then
  rm ${ERR_LOG}
fi
if [ ! -d ${MOUNT_DIR} ];then
  mkdir ${MOUNT_DIR}
fi
sleep 1

mount -t ext4 -o rw /dev/block/vold/179:34 ${MOUNT_DIR} 1>>$LOG 2>$ERR_LOG
echo

mount -t ext4 -o rw /dev/block/mmcblk1p2 ${MOUNT_DIR} 1>>$LOG 2>>$ERR_LOG
echo

mount >> $LOG
echo "$(date) mount finished" >> $LOG

chmod 773 /data/dalvik-cache