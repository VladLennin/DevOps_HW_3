#!/bin/bash

distribution=$(lsb_release -si)

if [ "$distribution" != "Ubuntu" ]; then
    echo "Error: This script is intended for Ubuntu only."
    exit 1
fi

while true; do
    cpu_usage=$(sar -u 1 1 | tail -n 1 | awk '{print 100 - $NF}')

    echo "$(date '+%Y-%m-%d %H:%M:%S') CPU Usage: $cpu_usage%" >> ./cpu-usage.log

    sleep 10
done
