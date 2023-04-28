#! /bin/sh

echo " _____ _   _ ____  ___ _   _  ____ "
echo "|_   _| | | |  _ \|_ _| \ | |/ ___|"
echo "  | | | | | | |_) || ||  \| | |  _ "
echo "  | | | |_| |  _ < | || |\  | |_| |"
echo "  |_|  \___/|_| \_\___|_| \_|\____|"

mkdir -p /mnt/sdcard
mount /dev/mmcblk0p1 /mnt/sdcard/
mount /dev/mmcblk0p1 /opt/
echo 3 4 1 7 > /proc/sys/kernel/printk

sleep 1 # wait 
/etc/setStaticNet.sh 

bmc &

/etc/test_ping.sh &
