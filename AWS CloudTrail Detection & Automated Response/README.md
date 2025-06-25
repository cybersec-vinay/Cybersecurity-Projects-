#  AWS CloudTrail Detection & Automated Response

## 🔍 Objective
This project demonstrates how to set up cloud-level logging using AWS CloudTrail, analyze logs with CloudWatch Logs Insights, and automate security alert responses using EventBridge + SNS Email.

---

## 📦 Components Used

| Tool | Purpose |
|------|---------|
| **AWS CloudTrail** | Records AWS API activity across your account |
| **CloudWatch Logs Insights** | Analyze logs using custom queries |
| **EventBridge** | Detect specific log patterns |
| **SNS (Simple Notification Service)** | Sends email alerts on detection |

---

## 🚀 Workflow Overview

1. **CloudTrail Setup:**  
   Created a multi-region trail to monitor all management and data events.

2. **Log Group & Querying:**  
   Linked the trail to CloudWatch. Used Logs Insights to detect suspicious behavior:
   - Root login attempts
   - IAM `CreateUser`, `DeleteUser`
   - Disabled CloudTrail (T1562.008)

3. **Detection Query Example:**
  
  ` fields eventName, userIdentity.type, userIdentity.arn
   | filter eventName = "CreateUser"
   | stats count() by userIdentity.arn, bin(1h)`

## Automated Response:

Created EventBridge rule to catch DeleteTrail

Triggered SNS Topic to send email alert

## 📈 Dashboard Preview
📊 Logs query results

🔄 EventBridge rules triggered

✉️ Email alert on specific event detection

## 📌 MITRE Mapping

MITRE Technique	Description

T1562.008	CloudTrail Disabling

T1078	Valid Accounts Usage

T1087	Account Discovery via IAM
   
