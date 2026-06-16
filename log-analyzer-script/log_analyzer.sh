#!/bin/bash

file_log="app.log"

if [ ! -f "$file_log" ]; then
echo "Error: File not found"
exit 1
fi



while true
do

echo "=========================================="
echo "		 LOG ANALYZER       "
echo "=========================================="
echo "1.  View last 10 entries"
echo "2.  Count Errors"
echo "3.  Count Warning"
echo "4.  Search Keyword"
echo "5.  Generate Reports"
echo "6.  Exit"
echo "=========================================="

echo "Enter your choice:"
read choice

case $choice in
1)
echo "Last 10 Entries:"
tail -10 $file_log
;;

2)
error=$(grep -ci "error" $file_log)
echo "Total error: $error"
;;

3)
warning=$(grep -ci "warning" $file_log)
echo "Total Warning: $warning"
;;

4)
read -p "Enter keywords:" keyword
grep "$keyword" $file_log
;;

5)
report="report.txt"

echo "LOG ANALYSIS REPORT" > $report
echo "Generated : $(date)" >> $report
echo "===========================" >> $report
echo "Errors: $(grep -ci error $file_log)" >> $report
echo "Warning: $(grep -ci warning $file_log)" >> $report
echo "Total Lines: $(wc -l < $file_log)" >> $report

echo "Report Generated successfully:  $report "
;;

6)
echo "Exixting ....."
exit 0
;;

*)
echo "Invalid Choice"
;;

esac
 
done
