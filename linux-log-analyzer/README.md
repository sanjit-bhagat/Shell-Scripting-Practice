# 📊 Linux Log Analyzer

A simple **Shell Script project** to analyze Linux log files and generate useful reports such as total logs, errors, and warnings.

---

## 🚀 Features

- Count total log lines  
- Detect and count Errors  
- Detect and count Warnings  
- Generate separate report files  
- Show recently modified files  
- Display log file disk usage  

---

## 📁 Project Structure

```
linux-log-analyzer/
├── archives/
│   └── logs_backup.tar.gz
├── logs/
│   ├── access.log
│   ├── error.log
│   └── system.log
├── logs-analyzer.sh
└── reports/
    ├── error.txt
    ├── reports.txt
    └── warning.txt
```

---

## 📄 Output Files

After running the script, reports will be generated inside the `reports/` directory:

- error.txt → Total number of errors  
- warning.txt → Total number of warnings  
- reports.txt → Complete summary report  

---

## 📌 Sample Output

```
Linux Log Analyzer Reports
====================================
Total log lines: 120
Total Error: 6
Total Warning: 4
Date: Tue Jul 7 06:15:00 IST 2026
```

---

## 🔍 Commands Used

- grep → search patterns (error/warning)
- wc -l → count lines
- find → recently modified files
- du -sh → file size
- date → current timestamp

---

## 💡 Future Improvements

- Menu-driven interface  
- Analyze multiple log files  
- Show top frequent errors  
- Email alerts for critical logs  

---

## 👨‍💻 Author

Sanjit Bhagat  

---
