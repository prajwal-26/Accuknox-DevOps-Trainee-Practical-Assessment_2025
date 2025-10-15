#!/bin/bash

LOG="/home/prajwal/health_check.log" 

echo "System Health: $(date)" >> "$LOG"

# CPU check
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print int($2+$4)}')
[ $CPU -gt 80 ] && echo "ALERT: CPU usage $CPU%" >> "$LOG"

# Memory check
MEM=$(free | awk '/Mem/ {printf "%d", $3/$2*100}')
[ $MEM -gt 80 ] && echo "ALERT: Memory usage $MEM%" >> "$LOG"

# Disk check
df -h | awk 'NR>1 {gsub("%",""); if($5>90) print "ALERT: Disk "$5"% on "$6}' >> "$LOG"

# Top CPU processes
echo "Top processes:" >> "$LOG"
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 5 >> "$LOG"

echo "Check done: $(date)" | tee -a "$LOG"

