#!/bin/bash

# System health monitoring system.
# Author: Sanjit Bhagat 
# Description 
# Menu-driven linux monitoring tool for checking.

while true
do 
echo ""
echo "==================================="
echo "SERVER HEALTH MONITORING TOOLS"
echo "==================================="
echo "1.   Check Disk Usage"
echo "2.   Check Memory Usage"
echo "3.   Check CPU Load"
echo "4.   Check System Uptime"
echo "5.   Check Logged-In Users"
echo "6.   Check Hostname"
echo "7.   Check IP Address"
echo "8.   Check Running Processes"
echo "9.   Top 5 Memory Consuming Processes"
echo "10.  Top 5 CPU Consuming Processes"
echo "11.  Exit"
echo ""


echo "Enter Choice:"
read choice

case $choice in
1)
echo "===== Disk Usage ====="
du -h
;;

2)
echo "===== Memory Usage ====="
free -h
;;

3)
echo "===== CPU Loads ====="
uptime
;;

4)
echo "===== System Uptime ====="
uptime -p
;;

5)
echo "===== Logged-In Users ====="
whoami
;;

6)
echo "===== Hostname ====="
hostname
;;

7)
echo "===== IP Address ====="
hostname -I
;;

8)
echo "===== Running Processes ====="
ps -ef
;;

9)
echo "===== Top 5 Memory Consuming Processes ====="
ps aux --sort=-%mem | head -6 
;;

10)
echo "===== Top 5 CPU Consuming Processes ====="
ps aux --sort=-%cpu | head -6 
;;

11)
echo "Existing server health monitor.."
echo "Thanks for using this system."
break
;;

*)
echo "Invalid Choice, plz try Again"
;;
esac
done

