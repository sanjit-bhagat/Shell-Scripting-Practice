#!/bin/bash



#######################################################################
# Project Name  : Employees management system 
# Author        : Sanjit
# Date          : 18-06-2026
#
# Description:
# this shell script provide menu-driven employee management system
# It allow user to 
# 1. Add Employee records 
# 2. View Employee records
# 3. Search Employees 
# 4. Delete Employees
# 5. Count Employee
# 6. Exit 
#
# Employees data stored in :
# employees.txt
#########################################################################



File="employees.txt"
touch "$File"

add_employee(){
echo "Enter Employee ID: "
read id

if grep -q "^$id," "$File"
then
echo "Employee Id already exists. "
return
fi

echo "Enter Employee Name: "
read name 

echo "Enter Departement: "
read dept

echo "$id, $name, $dept" >> "$File"
echo "Employee Added successfully."
}

view_employee(){
if [ -s "$File" ]
then 
cat "$File"
else 
echo "No Employees Record Found!"
fi
}

search_employee(){
read -p "Enter employees ID :" id

if grep -q "^$id," "$File"
then 
echo "Employee Found!"
grep "^$id," "$File"
else
echo "Employee not found!"
fi
}

delete_employee(){
read -p "Enter employee ID: " id
if grep -q "^$id," "$File"
then 
sed -i "/^$id,/d" "$File"
echo "Employee deleted succesfully!"
else
echo "Employee Not Found!"
fi 
}

count_employee(){
count=$(wc -l < "$File")
echo "Total employees: $count "
}

exit_system(){
echo "Thanks for using!"
exit
}


while true
do

echo "===================================="
echo "	 EMPLOYEES MANAGEMENT SYSTEM      "
echo "===================================="
echo "1. Add Employee "
echo "2. View Employee "
echo "3. Search Employee "
echo "4. Delete Employee "
echo "5. Count Employee "
echo "6. Exit "
echo "===================================="

echo "Enter your choice:"
read choice

case "$choice" in
1) add_employee ;;
2) view_employee ;;
3) search_employee ;;
4) delete_employee ;;
5) count_employee ;;
6) exit_system ;;
*) echo "Invalid choice!" ;;

esac

done


