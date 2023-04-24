#! /bin/sh


BANNER=$(
  cat <<-EndOfMessage
__________                 __________.__  ________
\____    /___________  ____\______   \__| \_____  \\
  /     // __ \_  __ \/  _ \|     ___/  |  /  ____/
 /     /\  ___/|  | \(  <_> )    |   |  | /       \\
/_______ \___  >__|   \____/|____|   |__| \_______ \\
        \/   \/                                   \/
Custom Firmware for the Turing Pi 2, there be dragons
OS: $(uname -a)
Version: v1.0.0
EndOfMessage
)
echo "$BANNER"

mount /dev/mmcblk0p1 /mnt/sdcard/
echo 3 4 1 7 > /proc/sys/kernel/printk

sleep 1 # wait 
/etc/setStaticNet.sh 

bmc &

/etc/test_ping.sh &
