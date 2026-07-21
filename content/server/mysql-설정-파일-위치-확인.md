+++
title = "MySQL 설정 파일 위치 확인"
date = 2022-03-29T18:59:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "0e88554f-8dce-435b-bccd-488101a3128f"
notion_url = "https://app.notion.com/p/MySQL-0e88554f8dce435bbccd488101a3128f"
+++

## MySQL 설정 파일 위치 확인

경로 목록은 [MariaDB/MySQL 설정 파일 경로](https://app.notion.com/p/25c032ef73b84ae7b39262de324ff34e) 참고.

### Linux — 읽기 순서

```bash
mysqld --verbose --help | grep -A 1 'Default options'
# 예: /etc/my.cnf /etc/mysql/my.cnf /usr/local/mysql/etc/my.cnf ~/.my.cnf
```

### Windows — 디렉터리 변수

```sql
SHOW VARIABLES WHERE Variable_Name LIKE '%dir';
```

예: `C:\ProgramData\MySQL\MySQL Server 8.0\my.ini`
