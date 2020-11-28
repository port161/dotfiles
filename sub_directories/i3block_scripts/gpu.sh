#!/usr/bin/env sh

temp=$(sensors | grep edge | awk -F ' ' '{print $2}' | sed 's/+//')
echo GPU: $temp
