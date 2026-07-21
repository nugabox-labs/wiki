+++
title = "MySQL 로그 파일 관리"
date = 2020-04-07T14:42:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "46d0c221-8f1d-4b6a-a483-f97a00ffdf04"
notion_url = "https://app.notion.com/p/MySQL-46d0c2218f1d4b6aa483f97a00ffdf04"
external_url = "https://server-talk.tistory.com/37"
+++

## MySQL 로그 종류

- **error log**: 기동·크래시·쿼리 오류 → `log-error=`
- **general log**: 모든 쿼리 (부하 큼) → `general_log=ON`
- **binlog / update 계열**: 변경 기록 (복제·복구)

```
[mysqld]
log-error=/var/log/mysql/error.log
```

```sql
SHOW VARIABLES LIKE 'general%';
SET GLOBAL general_log = ON;   -- 필요 시에만
```

디스크 용량 수시 점검·로테이션.
