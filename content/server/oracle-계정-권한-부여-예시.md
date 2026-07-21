+++
title = "Oracle 계정 권한 부여 예시"
date = "2020-09-24T02:54:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["SERVER"]
tags = ["DB", "Oracle"]
toc = true

[extra]
source = "notion"
notion_id = "f1fe707b-b5af-4093-b2ae-250418316f55"
notion_url = "https://app.notion.com/p/Oracle-f1fe707bb5af4093b2ae250418316f55"
+++

## Oracle 계정 권한 부여 예시

```sql
GRANT DBA, CONNECT, RESOURCE TO 계정명;
GRANT CREATE SEQUENCE, CREATE PROCEDURE, CREATE TRIGGER TO 계정명;

SELECT * FROM DBA_SYS_PRIVS;   -- 부여된 시스템 권한 확인
```
