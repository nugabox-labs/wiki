+++
title = "MariaDB/MySQL root 비밀번호 재설정"
date = 2023-02-21T02:29:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "edf47ff3-7f13-423b-8b9d-8b57dda99904"
notion_url = "https://app.notion.com/p/MariaDB-MySQL-root-edf47ff37f13423b8b9d8b57dda99904"
external_url = "https://yjshin.tistory.com/entry/CentOS-root-%ED%8C%A8%EC%8A%A4%EC%9B%8C%EB%93%9C-%EB%B6%84%EC%8B%A4-%EC%9E%AC%EC%84%A4%EC%A0%95"
+++

## 1. 서비스 정지

```bash
systemctl stop mariadb
# 또는: systemctl stop mysqld / service mysql stop
```

## 2. skip-grant-tables로 기동

```bash
sudo mysqld_safe --skip-grant-tables &
# 또는
mysqld -uroot --skip-grant-tables &
```

## 3. 비밀번호 변경

```bash
mysql -uroot mysql
```

```sql
FLUSH PRIVILEGES;

-- MySQL 5.x
UPDATE user SET password=PASSWORD('CHANGE_ME') WHERE user='root';

-- MySQL 8.x / 5.7+
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'CHANGE_ME';

FLUSH PRIVILEGES;
EXIT;
```

## 4. 접속 확인 후 정상 재기동

```bash
mysql -uroot -p
# 성공 시 콘솔에서: SHUTDOWN;
systemctl start mariadb
```

권한 오류(Error 13) 시:

```bash
chown -R mysql:mysql /var/lib/mysql
```
