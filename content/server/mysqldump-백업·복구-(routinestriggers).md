+++
title = "mysqldump 백업·복구 (routines/triggers)"
date = 2020-05-11T08:53:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "b762a04f-a937-4c90-aa5e-bdd1b14becec"
notion_url = "https://app.notion.com/p/mysqldump-routines-triggers-b762a04fa9374c90aa5ebdd1b14becec"
+++

## mysqldump 백업·복구 (루틴·트리거 포함)

```bash
mysqldump --routines --triggers -u root -p DB명 > backup.sql
# 소켓이 기본과 다르면
mysqldump --socket=/path/to/mysql.sock --routines --triggers -u root -p DB명 > backup.sql

mysql -u root -p DB명 < backup.sql
```

복원 전 DB는 미리 생성. 권장 순서: 새 덤프 → 기존 백업 → drop → 동일명 create → import.

### Row size too large (>8126)

```sql
SET GLOBAL innodb_file_format = Barracuda;
SET GLOBAL innodb_file_per_table = ON;
ALTER TABLE 테이블명 ROW_FORMAT=COMPRESSED;
```

또는 dump SQL에서 `ROW_FORMAT=COMPACT` → `COMPRESSED` 일괄 치환.
