# 🏧 ATM Machine Simulation (Bash Script)

A simple ATM machine simulation built using Bash scripting in Linux.  
This project demonstrates basic banking operations using shell scripting and file handling.

---

## 🚀 Features

- 🔐 PIN Authentication (3 attempts limit)
- 💰 Check Account Balance
- ➕ Deposit Money
- ➖ Withdraw Money
- 🧾 Transaction Logging
- 📂 File-based storage

---

## 📁 Project Structure

atm-machine/
│
├── atm.sh
├── users/
│   └── user1.txt
├── logs/
│   └── transactions.log
└── README.md

---

## ⚙️ How It Works

- User balance is stored in a file: `users/user1.txt`
- Script reads balance using:
  balance=$(cat users/user1.txt)
- Updates balance after deposit/withdraw
- Logs transactions in `logs/transactions.log`

---

## ▶️ How to Run

chmod +x atm.sh  
./atm.sh

---

## 💡 Concepts Used

- Bash Scripting  
- if-else and case statements  
- while loop  
- File handling  
- User input (read)  
- Linux permissions  

---

## 🔐 Security Features

- PIN verification  
- Account lock after 3 failed attempts  
- File permission control  

---

## 📌 Future Improvements

- Multi-user system  
- Hidden PIN input  
- Transaction history  
- Database integration  

---

## 👨‍💻 Author

Sanjit Bhagat  
