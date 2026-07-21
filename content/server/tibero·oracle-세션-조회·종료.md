+++
title = "Tibero·Oracle 세션 조회·종료"
date = 2020-07-31T01:30:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["DB", "Oracle", "Tibero"]
toc = true

[extra]
source = "notion"
notion_id = "c48bdb29-838d-4776-accf-4ab20f4e4e4f"
notion_url = "https://app.notion.com/p/Tibero-Oracle-c48bdb29838d4776accf4ab20f4e4e4f"
external_url = "https://app.notion.com/p/d0e83d37ec654df8842a4d73f667860d"
+++

## Tibero 강제 종료

```bash
tbsvr kill   # 세션 번호 지정 후 강제 종료
```

## IDLE\_TIME / 세션 조회

```sql
-- DBA: Tibero tbsql sys/PASS 또는 $dba
SELECT PROFILE, LIMIT FROM DBA_PROFILES WHERE RESOURCE_NAME = 'IDLE_TIME';

SELECT * FROM v$session;
DESC v$session;

SELECT SID, AUDSID, IPADDR, STATUS FROM v$session;
```

## 세션 종료 (Oracle/Tibero 공통 패턴)

```sql
ALTER SYSTEM KILL SESSION 'sid,serial#';
```
