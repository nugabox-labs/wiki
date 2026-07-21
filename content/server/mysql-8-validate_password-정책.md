+++
title = "MySQL 8 validate_password 정책"
date = 2021-03-16T01:23:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "d7234d68-60c2-4f03-b218-47fea24f33e8"
notion_url = "https://app.notion.com/p/MySQL-8-validate_password-d7234d6860c24f03b21847fea24f33e8"
external_url = "https://www.lesstif.com/dbms/mysql-8-password-policy-89555994.html"
+++

## MySQL 8 validate\_password

MySQL 8은 옵션명이 `_` → `.` 로 바뀜 (`validate_password_policy` → `validate_password.policy`).

```sql
SHOW VARIABLES LIKE 'validate_password.%';
```

개발 환경에서 완화 예 (`/etc/my.cnf` 또는 `/etc/mysql/mysql.conf.d/mysqld.cnf`):

```
[mysqld]
validate_password.policy=LOW
default_password_lifetime=0
# 더 완화하려면
validate_password.length=6
validate_password.special_char_count=0
validate_password.mixed_case_count=0
validate_password.number_count=0
```

재시작 후 적용.
