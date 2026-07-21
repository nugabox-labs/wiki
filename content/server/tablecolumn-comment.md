+++
title = "TABLE/COLUMN COMMENT"
date = 2019-11-21T15:34:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "74909162-8096-4945-b7e5-2ea93b4eb983"
notion_url = "https://app.notion.com/p/TABLE-COLUMN-COMMENT-7490916280964945b7e52ea93b4eb983"
external_url = "http://blog.naver.com/PostView.nhn?blogId=hanajava&logNo=220551737824"
+++

## COMMENT 조회·설정

```sql
SHOW TABLE STATUS;
SHOW FULL COLUMNS FROM table_name;

SELECT TABLE_SCHEMA, TABLE_NAME, TABLE_COMMENT
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'db';

SELECT COLUMN_NAME, COLUMN_TYPE, COLUMN_COMMENT
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'db' AND TABLE_NAME = 't';

ALTER TABLE t COMMENT = '테이블 설명';
ALTER TABLE t CHANGE col col INT NULL COMMENT '컬럼 설명';
```
