+++
title = "시놀로지 MariaDB 설정"
date = 2021-04-08T07:42:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["SYNOLOGY", "DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "4f64d963-16ca-4a37-9742-4e2cf62afe55"
notion_url = "https://app.notion.com/p/MariaDB-4f64d96316ca4a3797424e2cf62afe55"
+++

## 설치·외부 접속

1. DSM 패키지 센터에서 MariaDB 설치
1. root 비밀번호·포트 설정
1. DSM 방화벽·공유기 포트포워딩 개방
1. SSH 접속 후 CLI:

```bash
sudo su -
cd /usr/local/mariadb10/bin
./mysql -uroot -p
```

1. 외부 접속 계정·권한:

```sql
CREATE USER 'root'@'%' IDENTIFIED BY '비밀번호';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';
FLUSH PRIVILEGES;
```

## my.cnf

```bash
cd /var/packages/MariaDB10/etc
vim my.cnf   # 없으면 생성
/usr/syno/bin/synopkg restart MariaDB10
```
