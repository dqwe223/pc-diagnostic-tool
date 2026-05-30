# 🖥️ Ultra PC Diagnostic Suite v1.0

A powerful Windows Batch-based diagnostic and troubleshooting utility designed to help users analyze system performance, monitor hardware resources, diagnose network issues, and perform basic maintenance tasks from a single command-line interface.

---

## 📖 Overview

Ultra PC Diagnostic Suite is an all-in-one Windows diagnostic toolkit built using Batch scripting (.BAT/.CMD).

The tool provides quick access to essential system information and troubleshooting utilities without requiring third-party software.

Designed for:

* IT Support Engineers
* System Administrators
* Computer Technicians
* Power Users
* Students Learning Windows Administration

---

## ✨ Features

### 🧠 CPU Diagnostics

* View CPU information
* Display CPU core count
* Show logical processors
* Monitor CPU load percentage
* View running processes
* Check active power plan

### 💾 Memory Diagnostics

* RAM information
* RAM manufacturer details
* Memory speed detection
* Physical memory statistics
* Virtual memory information
* Basic memory cache clearing

### 💽 Disk Diagnostics

* Disk space analysis
* Drive information
* Disk error checking
* System file integrity verification
* Windows Disk Cleanup integration

### 🌐 Network Diagnostics

* Complete IP configuration
* Internet connectivity testing
* DNS cache flushing
* Full network repair
* Wi-Fi profile listing
* Winsock reset
* TCP/IP stack reset

### ⚙️ System Diagnostics

* Full system information
* Performance Monitor launcher
* Hardware overview
* Operating System details

---

## 🛠 Technologies Used

| Technology           | Purpose                  |
| -------------------- | ------------------------ |
| Windows Batch Script | Core Application         |
| CMD Commands         | System Diagnostics       |
| WMIC                 | Hardware Information     |
| NETSH                | Network Management       |
| PowerCFG             | Power Configuration      |
| SFC                  | System File Verification |
| CHKDSK               | Disk Checking            |
| PerfMon              | Performance Monitoring   |

---

## 📋 Main Menu

```text
CPU
 ├── CPU Information
 ├── Live CPU Usage
 ├── Running Processes
 └── Power Plan Information

RAM
 ├── RAM Information
 ├── Memory Usage
 ├── Virtual Memory Status
 └── Clear RAM Cache

DISK
 ├── Disk Usage
 ├── Check Disk Errors
 ├── Disk Cleanup
 └── System File Checker

NETWORK
 ├── IP Configuration
 ├── Internet Test
 ├── Flush DNS
 ├── Full Network Repair
 └── WiFi Profiles

SYSTEM
 ├── System Information
 └── Performance Monitor
```

---

## 🔐 Administrator Privileges

This tool requires Administrator privileges to access advanced system diagnostics and repair functions.

The application automatically checks for administrator rights during startup.

If administrator privileges are not detected, the tool will display:

```text
PLEASE RUN THIS TOOL AS ADMINISTRATOR
```

---

## 🚀 Installation

### Method 1: Download ZIP

1. Download the repository ZIP file.
2. Extract the archive.
3. Navigate to the project folder.
4. Right-click the batch file.
5. Select:

```text
Run as Administrator
```

---

### Method 2: Clone Repository

```bash
git clone https://github.com/your-username/Ultra-PC-Diagnostic-Suite.git
```

Open the project folder and run:

```text
Ultra-PC-Diagnostic-Suite.bat
```

as Administrator.

---

## 📂 Project Structure

```text
Ultra-PC-Diagnostic-Suite/
│
├── Ultra-PC-Diagnostic-Suite.bat
│
├── README.md
│
└── LICENSE
```

---

## 🔍 Diagnostic Modules

### CPU Information

Displays:

* Processor Name
* Number of Cores
* Logical Processors
* Maximum Clock Speed
* Current Load Percentage

Command Used:

```cmd
wmic cpu get Name,NumberOfCores,NumberOfLogicalProcessors,MaxClockSpeed,LoadPercentage
```

---

### Memory Information

Displays:

* RAM Capacity
* Memory Speed
* Manufacturer
* Total Physical Memory

Command Used:

```cmd
wmic MEMORYCHIP get Capacity,Speed,Manufacturer
```

---

### Disk Usage

Displays:

* Drive Letters
* Total Disk Size
* Available Free Space

Command Used:

```cmd
wmic logicaldisk get caption,FreeSpace,Size
```

---

### Network Repair

Performs:

```cmd
ipconfig /flushdns
ipconfig /release
ipconfig /renew
netsh winsock reset
netsh int ip reset
arp -d *
```

Useful for resolving:

* No Internet Access
* DNS Problems
* Network Adapter Issues
* IP Configuration Errors

---

## ⚠ Important Notes

* Some functions may take several minutes to complete.
* SFC scans can take 10–30 minutes.
* Network repair may temporarily disconnect active connections.
* Administrator privileges are required for most repair operations.

---

## 🎯 Future Improvements

* Real-time CPU Graph
* RAM Usage Graph
* GPU Information Module
* Battery Health Analyzer
* Temperature Monitoring
* Export Diagnostic Reports
* Automatic Log Generation
* Dark-Themed Interface
* PowerShell Integration
* Windows 11 Optimization Tools

---

## 🧪 Tested On

* Windows 10
* Windows 11

---

## 👨‍💻 Author

Iruka Mihishan

* Full-Stack Developer
* IT Support Specialist
* BSc (Hons) Information Technology Undergraduate

---

## 📜 License

This project is released under the MIT License.

---

## ⭐ Support

If you find this project useful:

⭐ Star the repository

🍴 Fork the project

🐛 Report issues

🚀 Contribute improvements

---

Made with ❤️ using Windows Batch Scripting
