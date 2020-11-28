#!/usr/bin/env bash

used=$(df -BG | grep sd | awk -F ' ' '{print $3}' | sed 's/G//')
total=$(df -BG | grep sd | awk -F ' ' '{print $2}' | sed 's/G//')

gig_tol=5000

total_sum=0
for x in $total ; do
    total_sum=$((total_sum+$x))
done

used_sum=0
for x in $used ; do
    used_sum=$((used_sum+$x))
done

total_changed_to_tb=0
if [[ $total_sum -gt $gig_tol ]]; then
    total_sum=$(awk "BEGIN {printf \"%.3f\",${total_sum}/1024}")
    total_changed_to_tb=1
fi

used_changed_to_tb=0
if [[ $used_sum -gt $gig_tol ]]; then
    used_sum=$(awk "BEGIN {printf \"%.3f\",${used_sum}/1024}")
    used_changed_to_tb=1
fi

if [[ $total_changed_to_tb -eq 1 ]]; then
    if [[ $used_changed_to_tb -eq 0 ]]; then
        echo Disk: $used_sum G\/ $total_sum T
    else
        echo Disk: $used_sum T\/ $total_sum T
    fi
else
    if [[ $used_changed_to_t -eq 1 ]]; then
        echo Disk: $used_sum T\/ $total_sum G
    else
        echo Disk: $used_sum G\/ $total_sum G
    fi
fi
