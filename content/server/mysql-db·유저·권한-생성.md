+++
title = "MySQL DB·유저·권한 생성"
date = 2020-02-04T10:57:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "01de5e90-cf93-4277-9123-e2f69e92c4ff"
notion_url = "https://app.notion.com/p/MySQL-DB-01de5e90cf9342779123e2f69e92c4ff"
external_url = "https://www.lesstif.com/pages/viewpage.action?pageId=24445981"
+++

## DB·유저·권한

```sql
-- utf8mb4
CREATE DATABASE appdb
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- MySQL 5.7+
CREATE USER 'appuser'@'localhost' IDENTIFIED BY 'password'
  PASSWORD EXPIRE NEVER;
GRANT ALL ON appdb.* TO 'appuser'@'localhost';
FLUSH PRIVILEGES;

-- 5.7 미만 (구문)
GRANT ALL ON appdb.* TO 'appuser'@'localhost' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;
```

### password policy (ERROR 1819)

```sql
SHOW VARIABLES LIKE 'validate_password%';
SET GLOBAL validate_password_policy = LOW;
```

또는 `my.cnf` `[mysqld]`에 `validate_password_policy=LOW` 후 재시작.

### 암호 변경

```sql
ALTER USER 'appuser'@'localhost' IDENTIFIED BY 'newpassword';
SET PASSWORD FOR 'appuser'@'localhost' = 'newpassword';
```

### ERROR 1044 Grant

원격에서 GRANT 불가 시 → `SELECT host,user,Grant_priv FROM mysql.user;` 후 **허용된 host**에서 실행.
