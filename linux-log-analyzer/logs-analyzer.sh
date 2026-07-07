#!/bin/bash

#=========================
# Title: Linux Log Analyzer
# Author: Sanjit bhagat
# Date : 07-07-2026
#=========================

file="logs/system.log"
report_dir="reports"

mkdir -p $report_dir
touch $report_dir/reports.txt $report_dir/error.txt $report_dir/warning.txt

total_line=$( wc -l < $file ) 

count_error=$(grep -i "error" $file | wc -l) 

count_warning=$(grep -i "warning" $file | wc -l )

echo "Total Error: $count_error" >$report_dir/error.txt
echo "Total Warning: $count_warning" >$report_dir/warning.txt

echo "Recently Modified files"
find . -type f -mtime -1

echo "The Size of Disk Usage"
du -sh $file



# generate reports file

echo "Linux Log Analyzer Reports" > $report_dir/reports.txt
echo "====================================" >> $report_dir/reports.txt
echo "Total log files: $total_line " >> $report_dir/reports.txt
echo "Total Error: $count_error " >> $report_dir/reports.txt
echo "Total Warning: $count_warning" >> $report_dir/reports.txt
echo "Date: $(date)" >> $report_dir/reports.txt






