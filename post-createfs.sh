#!/bin/sh

set -e

FWUP_CONFIG=$NERVES_DEFCONFIG_DIR/fwup.conf

# Create/copy u-boot files to the images directory
$HOST_DIR/usr/bin/mkimage -A arm -O linux -T script -C none -a 0 -e 0 \
    -n "nerves boot script" -d $NERVES_DEFCONFIG_DIR/uboot-script.cmd \
    $BINARIES_DIR/boot.scr

cp $NERVES_DEFCONFIG_DIR/board/uEnv.txt $BINARIES_DIR
cp $NERVES_DEFCONFIG_DIR/board/system.bit $BINARIES_DIR

# Run the common post-image processing for nerves
$BR2_EXTERNAL_NERVES_PATH/board/nerves-common/post-createfs.sh $TARGET_DIR $FWUP_CONFIG
