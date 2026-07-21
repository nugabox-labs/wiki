+++
title = "mysqldump 전체 DB 이관"
date = "2019-11-20T01:50:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "82b6960e-e789-47ed-8dcb-e574d8938385"
notion_url = "https://app.notion.com/p/mysqldump-DB-82b6960ee78947ed8dcbe574d8938385"
+++

## mysqldump 전체 DB 이관

```bash
mysqldump -u root -p --all-databases > all.sql
mysql -u root -p < all.sql
```

루틴·트리거 포함·옵션 상세 → [mysqldump 백업·복구](https://app.notion.com/p/b762a04fa9374c90aa5ebdd1b14becec)
