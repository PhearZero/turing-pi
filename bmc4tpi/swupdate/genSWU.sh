#!/bin/sh
CONTAINER_VER="$1"
PRODUCT_NAME="zero-pi-2"
FILES="sw-description rootfs.ubifs env0.fex env1.fex"
for i in $FILES;do
        echo $i;done | cpio -ov -H crc >  ${PRODUCT_NAME}_${CONTAINER_VER}.swu
