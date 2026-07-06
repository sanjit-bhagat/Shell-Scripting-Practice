#!/bin/bash

#======================================================
#this is a system that manage student records
# Title :  Student Records Management System
# Author : Sanjit Bhagat
#======================================================

file="report.txt"

touch report.txt

add_student(){
echo "Enter student Id :"
read id
if grep -q "^$id," $file
then 
echo "Student Id Already Exist"
else
echo "Enter Student Name:"
read name
echo "Enter Student Course:"
read course
echo "$id,$name,$course" >> $file
echo "Added successfully"
fi
}

view_student(){
echo "---Student Records"
cat $file
}

search_student(){
echo "Enter Student Id"
read id
if grep -q "^$id" $file
then 
    grep "^$id," $file
else
echo "Id does not found"
fi
}

delete_student(){
echo "Enter Student id"
read id
if grep -q "^$id," $file
then
    grep -v "^$id," $file > temp.txt
    mv temp.txt $file
    echo "Deleted successfully"
else
    echo "Student ID not found"
fi
}


count_student(){
echo "Total student"
wc -l $file
}

while true
do 
echo "==============================="
echo "STUDENT RECORDS SYSTEM"
echo "==============================="
echo
echo "1. ADD STUDENT"
echo "2. VIEW STUDENT"
echo "3. SAERCH STUDENT"
echo "4. DELETE STUDENT"
echo "5. COUNT STUDENT"
echo "6. EXIT"
echo
echo "==============================="

echo "Enter your choice:"
read choice

case $choice in
    1) add_student ;;
    2) view_student ;;
    3) search_student ;;
    4) delete_student ;;
    5) count_student ;;
    6) echo "Thanks for using!"; break ;;
    *) echo "Invalid choice" ;;
esac
done

