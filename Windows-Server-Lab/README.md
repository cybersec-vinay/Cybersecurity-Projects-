# Windows Server 2019 Active Directory Lab

## 🎯 Objective
Set up a Windows Server 2019 environment to simulate IT Support & System Administrator tasks:
- Install Active Directory Domain Services (AD DS)
- Configure a new domain: `DC.Lab`
- Create Organizational Units (OUs)
- Add users (e.g., ITDept, Sales, SalesAdmins)
- Apply basic policies like password reset

## 🖥️ Lab Environment
- **Host Machine:** VMware Workstation
- **VMs:** 
  - Windows Server 2019 (Core/CLI)
  - Windows 10 (Client)
  - Linux (Optional for testing connectivity)

## ⚙️ Tasks Completed
1. Installed Windows Server 2019 in CLI mode
2. Promoted server to **Domain Controller** with domain: `DC.Lab`
3. Created Organizational Units:
   - IT Department
   - Sales
   - SalesAdmins
4. Created and managed domain user accounts
   - Login tested with domain credentials
   - Password reset performed
5. Joined Windows 10 client to the domain
6. Verified login with domain users

## 📸 Screenshots
(Include important screenshots like successful login to domain user, OU structure in AD, password reset, etc.)

## 📌 Learnings
- Understood **Active Directory basics** (OUs, users, groups)
- Practiced **Windows CLI commands** for AD management
- Learned **user account management**: creation, login, reset
- Simulated a **real IT Support workflow** (resetting passwords, managing users)

## 🔗 Next Steps
- Implement Group Policy Objects (GPOs) for user restrictions
- Automate AD tasks with PowerShell
