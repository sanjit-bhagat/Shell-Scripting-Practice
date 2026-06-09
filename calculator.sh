#!/bin/bash

echo "===== Simple Calculator ====="

echo "Enter first number:"
read num1

echo "Enter second number:"
read num2

echo "CHOOSE OPTION"
echo "1 ADDITION"
echo "2 SUBSTRACTION"
echo "3 MULTIPLICATION"
echo "4 DIVISION"

echo "Enter your choice:"
read choice

if [ $choice -eq 1 ]
then 
result=$((num1+num2))
echo "Addition is: $result"

elif [ $choice -eq 2 ]
then 
result=$((num1-num2))
echo "Substraction is: $result"

elif [ $choice -eq 3 ]
then 
result=$((num1*num2))
echo "Multiplication is: $result"

elif [ $choice -eq 4 ]
then 
if [$num2 % 0]
then
echo "cannot divide by zero"
else
result=$((num1/num2))
echo "Division is: $result"
fi

else
echo "Invalid choice"
fi


