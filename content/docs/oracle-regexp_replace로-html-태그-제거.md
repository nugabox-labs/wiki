+++
title = "Oracle REGEXP_REPLACE로 HTML 태그 제거"
date = 2019-09-26T08:53:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["DB", "Oracle"]
toc = true

[extra]
source = "notion"
notion_id = "7b25ab38-fd75-4efa-be3d-0797d2590675"
notion_url = "https://app.notion.com/p/Oracle-REGEXP_REPLACE-HTML-7b25ab38fd754efabe3d0797d2590675"
+++

```sql
UPDATE 테이블명
SET 컬럼명 = REGEXP_REPLACE(컬럼명, '<[^>]*>|&([^;])*;', '')
WHERE 조건;
```

- `<[^>]*>`: HTML 태그 / `&([^;])*;`: HTML 엔티티(`&nbsp;` 등)
