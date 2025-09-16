#!/bin/bash

CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print int($2+$4)}')
MEM=$(free | awk '/Mem/{printf("%.0f", $3/$2 * 100)}')
DISK=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

echo "CPU Usage: $CPU%"
echo "Memory Usage: $MEM%"
echo "Disk Usage: $DISK%"

if [ $CPU -gt $CPU_THRESHOLD ]; then
  echo "Alert: CPU usage above threshold!"
fi

if [ $MEM -gt $MEM_THRESHOLD ]; then
  echo "Alert: Memory usage above threshold!"
fi

if [ $DISK -gt $DISK_THRESHOLD ]; then
  echo "Alert: Disk usage above threshold!"
fi

