#!/bin/bash




USER="user1"
FILE="users/$USER.txt"
LOG="logs/transaction.log"
PIN=1234
balance=10000

attempt=0
while [ $attempt -lt 3 ]
do 

echo "Enter PIN:"
read input

if [ "$input" -eq "$PIN" ]
then
echo "Login Successfully"
break
else
echo "Wrong Pin"
attempt=$((attempt + 1))
fi
done

if [ $attempt -eq 3 ]
then 
echo "Account Locked"
exit 1
fi

#Atm Loop

while true
do 
if [ ! -f "$FILE" ]; then
  echo "$balance" > "$FILE"
fi
balance=$(cat $FILE)

echo "===== ATM ====="
echo "1. CHECK BALANCE"
echo "2. DEPOSIT"
echo "3. WITHDRAW"
echo "4. EXIT"

echo "Enter your choice:"
read choice

#CHECK BALANCE

if [ "$choice" -eq 1 ]
then
echo "Your Current Balance is: $balance Rs"

#DEPOSIT

elif [ "$choice" -eq 2 ]
then
echo "Enter Amount to Deposit:"
read amount
balance=$((balance+amount))
echo "$balance" > "$FILE"
echo "Rs$amount has been credited to your account."
echo "Available Balance: $balance"


# WITHDRAW

elif [ "$choice" -eq 3 ]
then
echo "Enter Amount to Withdraw:"
read amount

if [ $amount -le $balance ]
then
balance=$((balance-amount))
echo "$balance" > "$FILE"
echo "Rs$amount has been debited from your account."
echo "Available Balance: $balance"
else
echo "Insufficient Balance"
fi


# EXIT

elif [ "$choice" -eq 4 ]
then
echo "Thanks for using ATM Machine."
break

else
echo "Invalid choice"
fi
done

