+++
title = "INFORMATION_SCHEMA로 DB·테이블·컬럼 조회"
date = "2019-11-21T05:57:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "641389b8-a6f1-48eb-a32c-702e70465de0"
notion_url = "https://app.notion.com/p/INFORMATION_SCHEMA-DB-641389b8a6f148eba32c702e70465de0"
+++

## DB 명세서용 메타 조회

```sql
SHOW FULL COLUMNS FROM 테이블명;

SELECT *
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'your_db';

SELECT TABLE_NAME, COLUMN_NAME, ORDINAL_POSITION, COLUMN_DEFAULT,
       IS_NULLABLE, COLUMN_TYPE, COLUMN_KEY, COLUMN_COMMENT
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'your_db'
  AND TABLE_NAME IN ('table_a', 'table_b');
```
