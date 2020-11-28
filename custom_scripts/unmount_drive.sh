#!/bin/bash

lsblk

echo "Enter drive to unmount: "
read drive

udisksctl unmount -b /dev/$drive

echo "Press enter to exit."
read foo
