+++
title = "MySQL Too many open files"
date = 2021-08-09T09:13:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER", "TECH"]
tags = ["DB", "MySQL", "LINUX", "ISSUE"]
toc = true

[extra]
source = "notion"
notion_id = "8038502c-8fcc-4fb7-8b7a-f86bb6e45018"
notion_url = "https://app.notion.com/p/MySQL-Too-many-open-files-8038502c8fcc4fb78b7af86bb6e45018"
external_url = "https://knoow.tistory.com/220"
+++

## 확인

```bash
ulimit -a
# open files (-n) 확인
```

## OS 일시 변경

```bash
ulimit -n 4096
```

## OS 영구 (`/etc/security/limits.conf`)

```
* hard nofile 4096
* soft nofile 4096
root hard nofile 4096
root soft nofile 4096
```

## MySQL/MariaDB (`my.cnf`)

```
[mysqld]
open-files-limit = 4096
```

```bash
systemctl restart mariadb
```

```sql
SHOW VARIABLES LIKE 'open_files_limit';
```

## CentOS 7 systemd (값이 안 오를 때)

유닛 오버라이드 또는 `/etc/systemd/system/mariadb.service.d/override.conf`:

```
[Service]
LimitNOFILE=10000
```

```bash
systemctl daemon-reload
systemctl restart mariadb
```
