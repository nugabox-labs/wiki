+++
title = "Oracle 실행쿼리 조회·세션 KILL"
date = 2021-11-09T01:52:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "TECH"]
tags = ["Oracle", "DB", "SQL", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "1e080255-8405-4a1b-b189-cb471ded1c26"
notion_url = "https://app.notion.com/p/Oracle-KILL-1e08025584054a1bb189cb471ded1c26"
external_url = "https://huskdoll.tistory.com/205"
+++

## Oracle 실행 중 쿼리 조회 · 세션 KILL

### 세션별 실행 SQL

```sql
SELECT S.SID, S.SERIAL#, S.USERNAME, S.STATUS, Q.SQL_TEXT
FROM V$SESSION S
JOIN V$SQL Q ON S.SQL_ADDRESS = Q.ADDRESS
WHERE S.USERNAME IS NOT NULL;
```

### 세션 KILL

```sql
ALTER SYSTEM KILL SESSION 'sid,serial#';
ALTER SYSTEM KILL SESSION 'sid,serial#' IMMEDIATE;
```
