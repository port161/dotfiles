#!/usr/bin/env sh

used_swap=$(free -h | grep Swap | awk -F ' ' '{print $3}')
total_swap=$(free -h | grep Swap | awk -F ' ' '{print $2}')

echo SWAP: $used_swap/$total_swap
