# 📧 Phishing Email Analysis – IOC Extraction and Validation 

This project simulates the analysis of a phishing email received by a target. The attacker used a spoofed domain that mimics Microsoft and attempted to trick the user into clicking a fake password reset link. This exercise is part of my 30-day SOC Analyst learning challenge.

---

## 🔍 Email Header Sample (Analyzed)

Return-Path: security-notice@micros0ft-support.com  

Received: from mail.micros0ft-support.com (185.203.119.8)
  
Subject: Important Security Update  

From: "Microsoft Support" support@micros0ft-support.com 

To: victim@example.com  

Message-ID: f28r8p3b2m3@example.com 

Date: Tue, 2 Jun 2025 08:00:00 -0700 

Content-Type: text/html 

---

## 🧠 Extracted Indicators of Compromise (IOCs)

| Type          | Value                                        |
|---------------|----------------------------------------------|
| Sender Email  | support@micros0ft-support.com                |
| IP Address    | 185.203.119.8                                |
| Message-ID    | f28r8p3b2m3@example.com                      |
| URL           | http://micros0ft-reset-password.com/verify   |

---

## 🔎 Threat Intel Lookups

### 🟠 AbuseIPDB (for IP `185.203.119.8`)
- Not reported in AbuseIPDB
- Hosted on Redcluster LTD (Bulgaria) — common for temporary phishing infra

![AbuseIPDB Lookup](screenshots/abuseipdb_lookup.png)

---

### 🟡 VirusTotal (for URL `http://micros0ft-reset-password.com/verify`)
- 0/97 engines flagged the URL
- **BUT** domain mimics Microsoft using "0" instead of "o" — social engineering trick

![VirusTotal Lookup](screenshots/virustotal_url_check.png)

---

## 📑 Summary of Findings

- **Email is a spoofed phishing attempt**
- Tools showed no immediate flagging, but:
  - Domain is deceptive (`micros0ft`)
  - IP is not trusted and used for shady hosting
- Human judgment identifies this as a phishing indicator

---

## 🛡 Recommended Response

- Block domain and IP at email gateway
- Add `micros0ft-support.com` to domain deny list
- Educate users to detect fake brand domains
- Add to internal IOC watchlist
- Raise awareness through phishing training campaigns

---

## 🧠 Lesson Learned

> “Don’t fully rely on tools. Always validate IOCs contextually.”

Even when tools report “clean,” it’s your **analyst judgment** that catches real threats.

---

## 👨‍💻 Project by: Vinay 
