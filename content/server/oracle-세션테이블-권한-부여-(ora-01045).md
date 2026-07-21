+++
title = "Oracle 세션/테이블 권한 부여 (ORA-01045)"
date = "2020-04-06T09:16:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["SERVER"]
tags = ["DB", "Oracle"]
toc = true

[extra]
source = "notion"
notion_id = "cc62ba56-369c-405c-84fc-3921994484b5"
notion_url = "https://app.notion.com/p/Oracle-ORA-01045-cc62ba56369c405c84fc3921994484b5"
external_url = "https://rainny.tistory.com/161"
+++

## Oracle 세션/테이블 권한 부여 (ORA-01045 해결)

```sql
grant create session to 유저이름;
grant create table to 유저이름;
```

## 코멘트 있는 테이블 목록 조회

```sql
SELECT table_name, table_type, comments FROM USER_TAB_COMMENTS WHERE comments IS NOT NULL;
```

원문: [https://rainny.tistory.com/161](https://rainny.tistory.com/161)
