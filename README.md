<h1 align="center">🧰 InfraCraft</h1>
<h2 align="center">☁️ VPC-Builder: Terraform + Python CLI for AWS Infrastructure</h2>


<p align="center">
  <img src="https://img.shields.io/badge/IaC-Terraform-623CE4?style=flat-square&logo=terraform" style="margin-right: 12px;"/>
  <img src="https://img.shields.io/badge/Cloud-AWS-orange?style=flat-square&logo=amazonaws" style="margin-right: 12px;"/>
  <img src="https://img.shields.io/badge/CLI-Python-blue?style=flat-square&logo=python" style="margin-right: 12px;"/>
  <img src="https://img.shields.io/badge/Logging-Daily%20Logs-green?style=flat-square&logo=logstash"/>
</p>

---

## ❓ What is this project?

**`VPC-Builder`** is a real-world, resume-ready AWS automation project using:

- ✅ Terraform modules for **VPC** and **IAM** infrastructure
- ✅ Python-powered CLI to **interactively pass values** to Terraform
- ✅ Daily smart logging with **cool headers and error tracking**
- ✅ Validation & edge-case handling for safe, dynamic deployment

---

## 🎯 Why should you care?

- 📄 Great for **Cloud Internship & Entry-Level DevOps roles**
- 🧩 Built like a **real infra repo** with modular structure & dynamic input
- ✅ Follows best practices (naming, tagging, input validation)
- 🚀 Clean commit history, perfect for GitHub & LinkedIn showcase

---

## 🛠️ How does it work?

### 📁 Project Structure

```bash
VPC-Builder/
├── environments/
│   └── dev/
│       └── main.tf            # Entry point: uses modules & variables
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── iam/
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
├── tf_input_runner.py         # Python CLI for dynamic Terraform inputs
├── logger_setup.py            # Daily log file generator with headers
├── logs/                      # Auto-generated logs folder
└── README.md

```

# 🏗️ VPC & IAM Terraform Builder

## 🧪 Features

- **🧱 VPC Module:** Create VPC, subnets, route tables
- **🔐 IAM Module:** Add groups, users, attach policies
- **✨ Python CLI:** Prompts you to input group name, usernames, policies, tags
- **🧠 Validation:** Terraform checks for IAM naming rules, tag structure, etc.
- **📜 Logging:** Logs every CLI run with date, random DevOps quote & info

---

## 🚀 Getting Started

### 1. 🧰 Prerequisites

- AWS CLI
- Terraform
- Python 3.x

### 2. 📦 Install Python dependencies

No third-party packages required — just built-in Python! -->
    ```    cd VPC-Builder/  ```

### 3. 🧙 Run the CLI script
```bash
python tf_input_runner.py
```
- You’ll be prompted like this:
    * 👉 Enter IAM group name:
    * 👉 Enter IAM usernames (comma-separated):
    * 🔐 Enter extra policy names:
    * 🏷️ Enter Tags (Owner, Project, ManagedBy, Environment):


- It will then:
    * Create the required variables
    * Run `terraform apply` with your inputs
    * Store logs in `/logs/` with a cool header 😎
---

## 📂 Logs Example
```
    ============================================================
    📅 2025-06-23 === Monday === Terraform like a wizard 🧙‍♂️
    ============================================================

    [2025-06-23 20:31:42] INFO - Started IAM Builder CLI session
    [2025-06-23 20:31:45] INFO - Group Name: DevOpsTeam
    ...
```


## 💡 Pro Tips

- ✅ Customize tags in CLI
- 🚫 Invalid group names like `Tin` will be caught by Terraform validations
- 📜 Logs help debug broken runs with full visibility

---

## 📘 Extra Credit

- Add subnet-level tagging and private/public division
- Add S3 bucket or EC2 module as side quests
- Convert `tf_input_runner.py` into a full TUI with [questionary](https://github.com/tmbo/questionary)

---

## 🧑‍💻 Made with 💻 by Fanoy

Let me know if you'd like:

- 🔖 GitHub Topics/Tags to add (e.g., `cloud-infra`, `devops-project`)
- 📸 A custom **README diagram** (Excalidraw-style)
- 📹 Video walkthrough script or LinkedIn post template

You’ve built something **recruiters love** — let’s package it like a pro 👨‍🚀📦
