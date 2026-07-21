+++
title = "시놀로지 Docker MariaDB 설치"
date = 2024-05-24T02:35:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["DB", "MySQL", "SYNOLOGY"]
toc = true

[extra]
source = "notion"
notion_id = "f6be34f6-6b76-4691-ad35-f2318d5a61d7"
notion_url = "https://app.notion.com/p/Docker-MariaDB-f6be34f66b764691ad35f2318d5a61d7"
external_url = "https://quantmania.net/1249"
+++

## Container Manager

1. 레지스트리에서 `mariadb` 이미지
1. 폴더: `docker/mariadb/config`, `docker/mariadb/data`
1. 볼륨: config → `/etc/mysql/conf.d`, data → `/var/lib/mysql`
1. 환경변수: `TZ=Asia/Seoul`, `MYSQL_ROOT_PASSWORD=비밀번호`
1. 포트 3306 (또는 변경)

## 앱 유저

```sql
CREATE USER 'newuser'@'%' IDENTIFIED BY 'password';
GRANT ALL ON mydatabase.* TO 'newuser'@'%';
FLUSH PRIVILEGES;
```
