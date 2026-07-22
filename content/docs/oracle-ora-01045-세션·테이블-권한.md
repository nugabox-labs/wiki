+++
title = "Oracle ORA-01045 세션·테이블 권한"
date = 2020-04-06T09:16:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["DB", "Oracle"]
toc = true

[extra]
source = "notion"
notion_id = "cc62ba56-369c-405c-84fc-3921994484b5"
notion_url = "https://app.notion.com/p/Oracle-ORA-01045-cc62ba56369c405c84fc3921994484b5"
external_url = "https://rainny.tistory.com/161"
+++

`ORA-01045: user lacks CREATE SESSION privilege` 등으로 접속·DDL이 막힐 때.

```sql
grant create session to 유저이름;
grant create table to 유저이름;
```

## 코멘트 있는 테이블 목록

```sql
SELECT table_name, table_type, comments
FROM USER_TAB_COMMENTS
WHERE comments IS NOT NULL;
```
