+++
title = "Oracle CLOB 컴럼 내용 SELECT하기"
date = "2019-09-26T09:08:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["SERVER"]
tags = ["DB", "Oracle"]
toc = true

[extra]
source = "notion"
notion_id = "e373a72d-5f5f-4a3c-8b3b-8b9bbd1995db"
notion_url = "https://app.notion.com/p/Oracle-CLOB-SELECT-e373a72d5f5f4a3c8b3b8b9bbd1995db"
external_url = "https://heyhyungki.tistory.com/59"
+++

## Oracle CLOB 컬럼 내용 SELECT 하기

```sql
-- dbms_lob.substr(clob컬럼, 바이트수, 시작바이트) — 최대 4000바이트까지 문자열로 변환
SELECT dbms_lob.substr(x, 4000, 1) FROM T;
```

원문: [https://heyhyungki.tistory.com/59](https://heyhyungki.tistory.com/59)
