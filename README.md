# Android_L_Manual_Link2SD
###步骤
1. 用USB数据线将手机连接至电脑

2. 打开终端(cmd)输入`adb shell`(或者直接在手机终端模拟器内进行以下操作)

3. 输入`cat /proc/partitions | grep mmcblk1p2`, 记住输出结果的第一个字段和第二个字段(如: 179和34)

4. 将`11mount_sdext4.sh`拷贝到`/system/etc/init.d`目录下, 用RE文件管理器修改脚本中`179:34`为第3步的`字段1:字段2`

5. 重启手机, 用RE文件管理器打开`/data/sdext4`查看是否成功挂载ext4分区, 若失败, 则可能为以下原因: 
   * 延迟时间不足: 适当修改脚本中`sleep`后的数值(单位: 秒)
   * 未获取完全root权限, system分区重启自动还原: 使用aroma文件管理器(recovery模式下)拷贝脚本, 或将脚本制作成刷机包刷入手机

6. 在ext4分区中新建`data/app`, `data/dalvik-cache/arm`, `data/data`目录

7. 将`/data/app`, `/data/dalvik-cache/arm`, `/data/data`中所有想要置入ext4分区里的文件/目录剪切到ext4分区中相应的目录下, 然后在原文件/目录位置新建软链接(即: RE文件管理器中的`链接到此文件夹`/`创建链接`)

8. 重启手机, 完成~
