+++
title = "Tibero/Oracle 세션 조회 및 종료"
date = 2020-07-31T01:30:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["DB", "Oracle"]
toc = true

[extra]
source = "notion"
notion_id = "c48bdb29-838d-4776-accf-4ab20f4e4e4f"
notion_url = "https://app.notion.com/p/Tibero-Oracle-c48bdb29838d4776accf4ab20f4e4e4f"
+++

## Tibero/Oracle 세션 조회 및 종료

```bash
tbsvr kill   # 세션 강제 종료 (Tibero, 세션 번호 지정)
```

```sql
-- DBA 계정 접속 (Tibero: tbsql sys/tibero, 또는 $dba)
SELECT PROFILE, LIMIT FROM DBA_PROFILES WHERE RESOURCE_NAME = 'IDLE_TIME';

-- 세션 목록/구조 확인
SELECT * FROM v$session;
DESC v$session;

-- 세션 접속자 조회
SELECT SID, AUDSID, IPADDR, STATUS FROM v$session;
```
