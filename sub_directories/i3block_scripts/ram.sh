#!/usr/bin/env sh

used=$(free -h | grep Mem | awk -F ' ' '{print $3}')
total=$(free -h | grep Mem | awk -F ' ' '{print $2}')

#echo RAM: $used/$total 
echo RAM: $used
