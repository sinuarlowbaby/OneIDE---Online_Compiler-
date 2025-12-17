<div align="center">

# 📝 **[OneIDE](https://oneide.onrender.com)**
### 🌐 Online Compiler & Coding Community Platform

<img src="https://img.shields.io/badge/Python-3.8+-blue?style=for-the-badge&logo=python&logoColor=white">
<img src="https://img.shields.io/badge/Django-Framework-092E20?style=for-the-badge&logo=django&logoColor=white">
<img src="https://img.shields.io/badge/License-MIT-green?style=for-the-badge">
<img src="https://img.shields.io/badge/Maintained-Yes-brightgreen?style=for-the-badge">

<br/>

### ⚡ *Compile. Collaborate. Connect.*

A powerful **online compiler and coding community platform** with real-time execution, collaboration, and admin control.

[🐞 Report Bug](https://github.com/your-username/your-repo-name/issues) • 
[✨ Request Feature](https://github.com/your-username/your-repo-name/issues)
https://oneide.onrender.com

</div>

---

## 📖 Overview

**OneIDE** is a complete web-based coding platform that provides:
- A **multi-language online compiler**
- A **community for sharing code**
- **Group-based collaboration**
- A full **admin dashboard for moderation**

It bridges the gap between **learning, practicing, and collaborating on code**.

---

## ✨ Features

### 🔐 User Authentication & Management
- Secure Login & Registration  
- Role-Based Access (Admin & User)  
- Forgot Password via Email (SMTP)  
- Profile Management with Image  
- Admin can Block/Unblock Users  

---

### 💻 Online Compiler & Coding Tools
- Supports **Python, Java, C, C++**
- Real-time Code Execution
- Save Code with Topic & Language
- View Execution History
- Edit & Update Saved Code

---

### 🤝 Community & Collaboration
- **Code Sharing**
  - Individual Sharing
  - Group Sharing (Static / Editable)
- **Group Management**
  - Create Groups with Icons
  - Add / Remove Members
  - Assign Roles (Admin, User)
- Feedback & Rating System
- Complaint System with Admin Replies
- Example Program Library

---

### 🛠️ Admin Dashboard
- View & Manage Users
- Block / Unblock Accounts
- Monitor Shared Code
- Handle Complaints & Feedback
- Manage Example Programs

---

## 🛠️ Tech Stack

| Layer | Technology |
|------|------------|
| Backend | Django, Python |
| Frontend | HTML, CSS, JavaScript, Bootstrap |
| Database | SQLite (Development), MySQL (Production) |
| Authentication | Django Auth System |
| Email Service | SMTP (smtplib) |

---

## 🚀 Getting Started

### 1️⃣ Clone Repository
```bash
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name
```

### 2️⃣ Install Dependencies
```bash
pip install django
pip install django-cors-headers
pip install psycopg2-binary
python manage.py createsuperuser
```

### 3️⃣ Run Migrations
```bash
python manage.py makemigrations
python manage.py migrate
```

### 4️⃣ Create Admin User
```bash
python manage.py createsuperuser
```

### 5️⃣ Start Development Server
```bash
python manage.py runserver
```

### 6️⃣ Open in Browser
```
http://127.0.0.1:8000/
```

---

## 🗄️ Database Setup

### ✅ Option 1: Import SQL Dump
```sql
CREATE DATABASE oneide;
```

```bash
mysql -u your_username -p oneide < oneide_dump.sql
```

---

### ✅ Option 2: Fresh Django Setup
```bash
python manage.py makemigrations
python manage.py migrate
```

---

## 🧩 ER Relationship (Simplified)

```
LOGIN ||--|| USER : credentials
USER  ||--o{ CODE : saves
USER  ||--o{ GROUP : creates
GROUP ||--|{ MEMBER : contains
USER  ||--|{ MEMBER : joins
USER  ||--o{ FEEDBACK : writes
USER  ||--o{ SHARE_P2P : sends
GROUP ||--o{ SHARE_GROUP : receives
```

---

## 📂 Project Structure

```
app/
├── migrations/
├── static/
├── templates/
│   ├── admin/
│   ├── user/
│   ├── login.html
│   ├── registration.html
├── admin.py
├── apps.py
├── models.py
├── tests.py
├── urls.py
└── views.py
```

---

## 🤝 Contributing

1. Fork the Repository  
2. Create a Feature Branch  
3. Commit Your Changes  
4. Push to Your Branch  
5. Open a Pull Request  

---

## 📄 License

This project is licensed under the **MIT License** ✅  
Free for **educational and commercial use**.

---

<div align="center">

### ⭐ If you like this project, don't forget to give it a star!

</div>
