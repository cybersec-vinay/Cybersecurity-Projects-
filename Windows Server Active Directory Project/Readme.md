# Windows Server Active Directory Project

This project demonstrates the setup and configuration of a **Windows Server 2019 (CLI-based)** as a Domain Controller with Active Directory, along with client integration and administration tasks.  

The project simulates a small IT infrastructure with:
- **1 Windows Server (Domain Controller)**
- **1 Windows 10 Client**
- **1 Linux (Ubuntu) Client** (optional for cross-platform testing)

---

## 📌 Project Goals
- Understand and configure **Active Directory Domain Services (AD DS)**  
- Manage **Organizational Units (OUs)**, **Users**, and **Groups**  
- Join clients (Windows/Linux) to the domain  
- Perform common **administration tasks** (resetting passwords, account policies)  
- Practice commands and documentation for **System Administrator / IT Support roles**  

---

## ⚙️ Lab Environment Setup

### Virtual Machines
- **Windows Server 2019 (CLI-based)**
- **Windows 10 Pro** (Client)
- **Ubuntu Linux 22.04** (Client)

### Network Configuration
All machines are on the same internal network (`192.168.10.0/24`).  

| Machine | Hostname   | IP Address   | Role              |
|---------|------------|-------------|-------------------|
| Server  | DC.Lab     | 192.168.10.10 | Domain Controller |
| Client1 | Win10-PC   | 192.168.10.20 | Windows Client    |
| Client2 | Ubuntu-PC | 192.168.10.30 | Linux Client      |

Steps:
1. In **VMware/VirtualBox**, create an **Internal Network**.
2. Assign **static IP addresses** to each VM.
3. Set **DNS server** of clients to the **Domain Controller (192.168.10.10)**.

---

## 🏗️ Windows Server Configuration (Domain Controller)

### 1. Rename Server
powershell
sconfig

Choose option 2 → Set Computer Name → DC

Reboot server after rename.

### 2. Assign Static IP
netsh interface ip set address name="Ethernet0" static 192.168.10.10 255.255.255.0 192.168.10.1
netsh interface ip set dns name="Ethernet0" static 192.168.10.10

### 3. Install Active Directory Domain Services (AD DS)
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools


Promote server as Domain Controller:

Install-ADDSForest -DomainName "DC.Lab"


Domain: DC.Lab

Safe Mode Admin Password: (set during setup)

Reboot required.

## 👥 Active Directory Configuration

### 1. Create Organizational Units (OUs)
New-ADOrganizationalUnit -Name "IT Dept" -Path "DC=DC,DC=Lab"
New-ADOrganizationalUnit -Name "Sales" -Path "DC=DC,DC=Lab"
New-ADOrganizationalUnit -Name "Sales Admins" -Path "DC=DC,DC=Lab"

### 2. Create Users
New-ADUser -Name "John Doe" -AccountPassword (ConvertTo-SecureString "Password@123" -AsPlainText -Force) -Enabled $true -Path "OU=IT Dept,DC=DC,DC=Lab" -UserPrincipalName "john@DC.Lab" -SamAccountName "john"

### 3. Add User to Group
Add-ADGroupMember -Identity "Sales Admins" -Members "john"

### 4. Reset User Password
Set-ADAccountPassword -Identity "john" -Reset -NewPassword (ConvertTo-SecureString "NewPass@123" -AsPlainText -Force)

### 5. Unlock User Account
Unlock-ADAccount -Identity "john"

## 🖥️ Client Integration

### Windows 10 Client

Change DNS → 192.168.10.10

Join Domain:

System Properties → Change Settings → Member of Domain → DC.Lab


Login with domain user: DC\john

Linux Client (optional)
sudo apt update && sudo apt install realmd sssd adcli

### 🔧 Common Administration Tasks

Resetting passwords

Unlocking locked accounts

Creating new OUs and Groups

Adding users to groups

Joining new clients to the domain
sudo realm join DC.Lab -U administrator

### 📂 Repository Structure
📦 Windows-Server-ActiveDirectory
 ┣ 📜 README.md   (This file)
 ┣ 📂 screenshots (Add your setup screenshots)


### 🚀 Skills Gained

Windows Server Administration (CLI)

Active Directory Domain Services (AD DS)

User/Group/OU management with PowerShell

Domain joining (Windows & Linux)

Troubleshooting authentication issues

### ✅ Next Steps

Explore Group Policy Objects (GPOs) for centralized management.

Practice backup & restore of AD.

Automate user creation with PowerShell scripts.
