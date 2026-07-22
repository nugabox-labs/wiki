+++
title = "Oracle 세션·락 확인 및 해제"
date = 2021-11-10T00:24:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "TECH"]
tags = ["Oracle", "DB", "SQL", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "d0e83d37-ec65-4df8-842a-4d73f667860d"
notion_url = "https://app.notion.com/p/Oracle-d0e83d37ec654df8842a4d73f667860d"
external_url = "https://ponyozzang.tistory.com/182"
+++

## 세션 확인

```sql
SELECT SID, SERIAL#, USERNAME, PROGRAM
FROM V$SESSION;
```

## 락 걸린 테이블

```sql
SELECT
  S.SID, S.SERIAL#, S.USERNAME,
  O.OBJECT_NAME, S.OSUSER, S.PROGRAM
FROM V$LOCKED_OBJECT L
LEFT JOIN DBA_OBJECTS O ON L.OBJECT_ID = O.OBJECT_ID
LEFT JOIN V$SESSION S ON L.SESSION_ID = S.SID
ORDER BY S.SID, O.OBJECT_NAME;
```

## 세션 해제

```sql
ALTER SYSTEM KILL SESSION 'sid,serial#';
-- 예: ALTER SYSTEM KILL SESSION '123,45678';
```
