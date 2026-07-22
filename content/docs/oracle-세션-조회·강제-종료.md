+++
title = "Oracle 세션 조회·강제 종료"
date = 2021-11-10T00:23:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "TECH"]
tags = ["Oracle", "DB", "SQL", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "db9c7e38-855a-4be8-93ef-be5d735ad990"
notion_url = "https://app.notion.com/p/Oracle-db9c7e38855a4be893efbe5d735ad990"
external_url = "https://crone.tistory.com/23"
+++

## 세션 조회

```sql
SELECT * FROM V$SESSION;

SELECT *
  FROM V$SESSION A, V$PROCESS B
 WHERE A.PADDR = B.ADDR
   AND A.USERNAME = '프로세스아이디';

SELECT USERNAME, PROGRAM FROM V$SESSION;
```

## 강제 종료

```sql
ALTER SYSTEM KILL SESSION '세션번호,시리얼번호';
```

## KILL 스크립트 생성

```sql
SELECT A.LOGON_TIME, A.SID, A.SERIAL#, A.USERNAME, A.SCHEMANAME,
       A.MACHINE, A.TERMINAL, A.PROGRAM, A.MODULE, A.CLIENT_INFO,
       'ALTER SYSTEM KILL SESSION '''||A.SID||','||A.SERIAL#||''';' AS KILLSCRIPT
  FROM V$SESSION A
 ORDER BY A.LOGON_TIME;
```
