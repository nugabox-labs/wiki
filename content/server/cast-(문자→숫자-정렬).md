+++
title = "CAST (문자→숫자 정렬)"
date = 2019-10-25T16:24:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "2cb83882-6dfa-422b-a93c-a741757c95a9"
notion_url = "https://app.notion.com/p/CAST-2cb838826dfa422ba93ca741757c95a9"
external_url = "https://dev114.tistory.com/295"
+++

## CAST (문자 숫자 정렬)

VARCHAR에 숫자 문자열이 있으면 문자 정렬됨 → CAST.

```sql
SELECT * FROM t ORDER BY CAST(col AS UNSIGNED);
SELECT CAST('1' AS UNSIGNED);
SELECT CAST(2 AS CHAR(1));
-- 타입: BINARY, CHAR, SIGNED, UNSIGNED, DATE, DATETIME, TIME
```
