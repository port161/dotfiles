#!/bin/bash

lsblk

echo "Enter drive to power down: "
read drive

udisksctl power-off -b /dev/$drive

echo "Drive now safe to remove. Press enter to exit."
read foo
