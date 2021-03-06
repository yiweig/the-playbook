#!/bin/bash

DEVICE_NAME="PIXEL"
IMAGE_FILE_PATH=/Users/cmoore/Desktop/ubuntu-minimal-16.04-server-armhf-raspberry-pi.img
DEVICE=/dev/disk2

FILESIZE_IN_BYTES=$(stat -c%s $IMAGE_FILE_PATH)
FILESIZE_IN_MB=$(( ${FILESIZE_IN_BYTES%% *} / 1024 / 1024))
# echo $FILESIZE_IN_MB

# echo "diskutil eraseDisk FAT32 ${DEVICE_NAME} MBRFormat ${DEVICE}"
diskutil eraseDisk FAT32 "${DEVICE_NAME}" MBRFormat "${DEVICE}"
# echo "diskutil umount /dev/disk2"
diskutil umount "${DEVICE}"
# echo "diskutil umount /dev/disk2s1"
diskutil umount "${DEVICE}s1"

# echo "dd if=${IMAGE_FILE_PATH} | pv -s ${FILESIZE_IN_MB}M | dd bs=4M of=${DEVICE}"

sudo dd bs=4M if="${IMAGE_FILE_PATH}" of="${DEVICE}" status=progress
