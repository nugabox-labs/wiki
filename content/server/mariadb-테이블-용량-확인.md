+++
title = "MariaDB 테이블 용량 확인"
date = 2024-02-13T05:40:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["DB", "MySQL", "SQL"]
toc = true

[extra]
source = "notion"
notion_id = "c8689075-8f8d-4bac-8666-c22bab7a6ed8"
notion_url = "https://app.notion.com/p/MariaDB-c86890758f8d4bac8666c22bab7a6ed8"
+++

## DB별 용량

```sql
SELECT
    table_schema AS 'Database',
    ROUND(SUM(data_length + index_length) / 1024 / 1024, 1) AS 'Size(MB)'
FROM information_schema.tables
WHERE table_schema NOT IN ('sys', 'mysql', 'information_schema', 'performance_schema')
GROUP BY table_schema
ORDER BY 2 DESC;
```
