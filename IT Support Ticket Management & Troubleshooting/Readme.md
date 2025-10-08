# 🧰 IT Support Ticket Management & Troubleshooting 

## 🧾 Project Overview  
This project simulates a real-world **IT Support workflow** where end users raise issues through a **ticketing system (ServiceNow)**, and an IT Support Engineer diagnoses, resolves, and documents each issue.  
The virtual environment was built using **Windows Server 2019 (CLI-based Domain Controller)** and **Windows 10 (client)**.

---

## 🎯 Objective  
To demonstrate the **technical and operational skills** required in an IT Support role — including user account management, troubleshooting connectivity issues, and using ServiceNow for ticket lifecycle management.

---

## ⚙️ Lab Setup

| Component | Description |
|------------|-------------|
| **Windows Server 2019 (CLI)** | Configured as a Domain Controller (`lab.local`) |
| **Windows 10 Client** | Joined to domain `lab.local` |
| **ServiceNow Developer Instance** | Used for ticket creation, assignment, and closure |

---

## 🧑‍💼 Users in Active Directory

Created sample users and organizational units (OUs):


dsquery user -limit 0
"CN=Administrator,CN=Users,DC=lab,DC=local"
"CN=Guest,CN=Users,DC=lab,DC=local"
"CN=TestUser1,OU=ITDept,DC=lab,DC=local"
"CN=Joe,OU=Sales,DC=lab,DC=local"
"CN=Annabelle Coger,OU=Sales,DC=lab,DC=local"

## 🎟️ Ticket Workflow

Each issue was raised as a ticket in ServiceNow with a complete ITSM lifecycle:

Ticket Creation (user raises issue)

Assignment (ticket assigned to IT Support)

Troubleshooting & Resolution

Ticket Closure (documented in ServiceNow)

### 🧩 Ticket Scenarios & Resolutions

## 1️⃣ Password Reset Request

User Issue:

Annabelle Coger reports: “I forgot my password and cannot log in to my system.”

ServiceNow Ticket:
INC001013 - Password Reset Request (Annabelle Coger)

Technical Steps (Windows Server 2019 CLI):

Unlock user account (if locked)
net user Annabelle Coger /domain

Reset password
dsmod user "CN=Annabelle Coger,OU=Sales,DC=lab,DC=local" -pwd NewPass@123

Force password change at next logon
dsmod user "CN=Annabelle Coger,OU=Sales,DC=lab,DC=local" -mustchpwd yes


Resolution Summary (ServiceNow Update):
Account unlocked and password reset. User verified access successfully. Ticket closed.

## 2️⃣ Permission Denied – Shared Folder Access

User Issue:

Annabelle Coger reports: “Access denied to Sales shared folder.”

ServiceNow Ticket:
INC001017 - Shared Folder Access Denied (Annabelle Coger)


Technical Steps (Windows Server 2019 CLI):

Check group membership
dsget user "CN=Annabelle Coger,OU=Sales,DC=lab,DC=local" -memberof

Add user to proper security group
dsmod group "CN=SalesGroup,OU=Sales,DC=lab,DC=local" -addmbr "CN=Annabelle Coger,OU=Sales,DC=lab,DC=local"


Resolution Summary (ServiceNow Update):
Verified group permissions, added Annabelle Coger to SalesGroup, confirmed folder access restored. Ticket closed.

## 3️⃣ No Internet Connectivity

User Issue:

Annabelle Coger reports: “Wi-Fi is connected but no internet access.”

ServiceNow Ticket:
INC001021 - Internet Connectivity Issue (Annabelle Coger)


Technical Steps (Client & Server Side):

On Windows 10 Client
ipconfig /all
ping 8.8.8.8
ping google.com

If DNS issue → fix DNS
netsh interface ip set dns "Wi-Fi" static 192.168.1.1
ipconfig /flushdns

On Server (verify DHCP/DNS service)
Get-Service | findstr DHCP
Get-Service | findstr DNS


Resolution Summary (ServiceNow Update):
DNS misconfiguration identified. Corrected DNS settings and verified internet access restored. Ticket closed.

## 🧠 Key Learnings

Hands-on experience with Active Directory user management via CLI.

Configured and troubleshooted Windows and network issues.

Managed ticket lifecycle using ServiceNow ITSM.

Developed analytical troubleshooting and documentation skills.

## 📁 Repository Structure
IT-Support-Ticket-Simulation/
│
├── README.md                      # Project documentation
├── screenshots/
│   ├── ad_users_list.png           # AD user list (dsquery output)
│   ├── servicenow_ticket1.png      # Password reset ticket
│   ├── servicenow_ticket2.png      # Folder access issue
│   └── servicenow_ticket3.png      # Connectivity issue


## 🧑‍🔧 Tools & Technologies Used

Windows Server 2019 (CLI-based Active Directory)

Windows 10 Client

ServiceNow ITSM

PowerShell / Command Prompt

VMware / VirtualBox

## 🏁 Outcome

This project demonstrates practical IT Support experience including:

Ticket management using ServiceNow

User account and permission management in Active Directory

Network and endpoint troubleshooting
"CN=Rock,OU=Sales,DC=lab,DC=local"
"CN=Anna,OU=Sales,DC=lab,DC=local"
