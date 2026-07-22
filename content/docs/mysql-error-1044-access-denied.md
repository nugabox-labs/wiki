+++
title = "MySQL ERROR 1044 Access denied"
date = 2021-09-17T06:53:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "TECH"]
tags = ["MySQL", "SQL", "ISSUE"]
toc = true

[extra]
source = "notion"
notion_id = "870562a4-d1b1-42b1-b542-a0d8eb229e9f"
notion_url = "https://app.notion.com/p/MySQL-ERROR-1044-Access-denied-870562a4d1b142b1b542a0d8eb229e9f"
+++

## 증상

```
ERROR 1044 (42000): Access denied for user 'root'@'localhost' to database 'some_db'
```

## 확인

```sql
SELECT USER();
SELECT CURRENT_USER();
SELECT host, user, password, Grant_priv, Super_priv FROM mysql.user;
```

## 해결 (Grant\_priv=N)

```sql
UPDATE mysql.user SET Grant_priv='Y', Super_priv='Y' WHERE User='root';
FLUSH PRIVILEGES;
GRANT ALL ON *.* TO 'root'@'localhost';
```
