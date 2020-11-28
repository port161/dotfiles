#!/bin/bash

lsblk

echo "Enter drive to mount: "
read drive

udisksctl mount -b /dev/$drive

echo "Press enter to exit."
read foo
