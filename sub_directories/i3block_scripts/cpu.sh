#!/usr/bin/env zsh

cpu_temps=$(sensors | grep Core | awk -F  '+' '{print $2}' | awk -F 'C' '{print $1}' | sed -e 's/.$//')

max_temp=$(
for temp in $cpu_temps ; do
    echo $temp
done | sort -nr | awk 'NR==1 {print;exit}'
)

load=$(iostat | grep avg-cpu -A1 | tail -n 1 | awk -F ' ' '{print $6}')
load=$((100-$load))
load=$(printf "%.0f\n" $load)
echo "CPU: $load %," $max_temp "C"

