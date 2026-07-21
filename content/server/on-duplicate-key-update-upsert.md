+++
title = "ON DUPLICATE KEY UPDATE upsert"
date = 2019-10-07T10:31:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "51f8fa62-086b-4149-99c5-637dc4e9eacc"
notion_url = "https://app.notion.com/p/ON-DUPLICATE-KEY-UPDATE-upsert-51f8fa62086b414999c5637dc4e9eacc"
external_url = "https://allmana.tistory.com/3"
+++

## Oracle MERGE → MySQL ON DUPLICATE KEY UPDATE

MySQL은 `MERGE INTO` 없음. PK/UNIQUE 기준 upsert:

```sql
INSERT INTO table_name (col1, col2, col3)
VALUES ('val1', 'val2', 'val3')
ON DUPLICATE KEY UPDATE
  col2 = 'val4',
  col3 = 'val5';
```

중복 키 없으면 INSERT, 있으면 UPDATE. **PK/UNIQUE 필수**.
