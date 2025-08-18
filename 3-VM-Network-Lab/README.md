# 3-VM Network Lab Project

## 📌 Objective
Set up a mini isolated lab environment with 3 virtual machines (Windows 10, Windows Server 2019, Ubuntu Server) to test internal network communication and packet capture analysis.

## 🖥️ Lab Setup
- **Windows 10** – IP: 192.168.56.10
- **Ubuntu Server** – IP: 192.168.56.20
- **Windows Server 2019** – IP: 192.168.56.30
- All VMs connected via VirtualBox internal network.

## 🔧 Steps Performed
1. Installed VirtualBox and created 3 VMs.
2. Configured **static IP addresses** on each VM.
3. Verified connectivity using `ping` from each machine.
4. Installed **Wireshark** on Windows 10 to capture traffic.
5. Filtered packets using `icmp` filter and analyzed request/reply traffic.

## ✅ Results
- All 3 systems successfully communicated with each other.
- Packet capture confirmed ICMP requests & replies.
- Network setup is functional and ready for future IT Admin tasks.

## 📂 Screenshots

- Ping Tests  


- Wireshark Capture  


## 🚀 Skills Demonstrated
- Network Configuration (Static IPs, Subnetting)
- Connectivity Troubleshooting
- Packet Capture & Analysis with Wireshark
- Lab Environment Setup (Windows & Linux)


