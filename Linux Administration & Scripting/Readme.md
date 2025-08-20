# Linux Administration & Scripting

## 🎯 Objective
Today’s focus was on strengthening Linux system administration skills and basic scripting for automation.  
Key tasks included:  
- Installing and managing web servers (Apache/Nginx).  
- Configuring SSH and securing remote access.  
- Setting up a firewall and Fail2Ban.  
- Writing a basic shell script for backups.  
- Managing users, groups, and file permissions.  

---

## 🛠️ Environment Setup
- **Linux Distro Used:** Ubuntu 22.04 (VM on VMware/VirtualBox)  
- **Privileges:** Root or sudo access required  

---

## 🔹 Task 1: Install Apache/Nginx & Manage Services

Update system
sudo apt update && sudo apt upgrade -y

Install Apache
sudo apt install apache2 -y

Start, Stop, Enable service
sudo systemctl start apache2
sudo systemctl status apache2
sudo systemctl stop apache2
sudo systemctl enable apache2

✅ Verified by accessing http://localhost in browser.

## Task 2: Configure SSH & Secure Access
Install SSH server
sudo apt install openssh-server -y

Start & enable SSH
sudo systemctl start ssh
sudo systemctl enable ssh

Configure firewall to allow SSH
sudo ufw allow ssh
sudo ufw enable
sudo ufw status


🔒 Security Step:
Edited /etc/ssh/sshd_config to disable root login & change default port.

sudo nano /etc/ssh/sshd_config
Change: PermitRootLogin no

## Task 3: Fail2Ban Setup
Install Fail2Ban
sudo apt install fail2ban -y

 Check service status
sudo systemctl status fail2ban


Created local jail configuration /etc/fail2ban/jail.local:

[sshd]
enabled = true
port = 2222
maxretry = 3
bantime = 600


✅ Tested brute-force attempt (multiple wrong SSH logins) → IP got banned.

## Task 4: Basic Shell Script – Automated Backup

Created a script backup.sh:

!/bin/bash
Simple backup script

SRC="/home/student/documents"
DEST="/home/student/backup"



echo "Backup completed at $(date)" >> /home/student/backup/backup.log

Make script executable
chmod +x backup.sh

Run script
./backup.sh


✅ Output: Backup created in /home/student/backup/ with timestamp.

## Task 5: User & File Management
Create a new user
sudo adduser testuser

Add user to sudo group
sudo usermod -aG sudo testuser

Create group & add user
sudo groupadd developers
sudo usermod -aG developers testuser

File permissions
touch secure.txt
chmod 600 secure.txt
ls -l secure.txt


✅ Verified permissions restrict file access.

## 📸 Evidence

Apache welcome page screenshot

SSH login attempt on new port

Fail2Ban banning IP logs (/var/log/fail2ban.log)

Backup directory screenshot

User & file permission check

## 📝 Learning Outcomes

Learned to install, configure, and manage Linux services (Apache, SSH).

Hardened SSH using config changes & Fail2Ban.

Practiced automation using shell scripting.

Understood Linux user/group management & permissions.

