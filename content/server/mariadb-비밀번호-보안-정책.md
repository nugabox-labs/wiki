+++
title = "MariaDB 비밀번호 보안 정책"
date = 2024-09-19T02:56:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "fcae4aac-6f11-429e-a373-cc2cd2560c5a"
notion_url = "https://app.notion.com/p/MariaDB-fcae4aac6f11429ea373cc2cd2560c5a"
+++

## 확인

```sql
SHOW VARIABLES LIKE '%password%';
SHOW PLUGINS;
SHOW COMPONENTS;
```

## 플러그인/컴포넌트

```sql
-- MySQL 5+: 플러그인
INSTALL PLUGIN validate_password SONAME 'validate_password.so';
UNINSTALL PLUGIN validate_password;

-- MySQL 8+: 컴포넌트
INSTALL COMPONENT 'file://component_validate_password';
UNINSTALL COMPONENT 'file://component_validate_password';
```

## 정책 (임시 완화)

```sql
SET GLOBAL validate_password_policy = 0;
SHOW VARIABLES LIKE 'validate_password%';
```
