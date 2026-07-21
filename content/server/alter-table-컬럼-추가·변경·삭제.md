+++
title = "ALTER TABLE 컬럼 추가·변경·삭제"
date = 2019-10-16T16:06:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "b808397b-ff77-45ea-8e88-3348dc8a5ac9"
notion_url = "https://app.notion.com/p/ALTER-TABLE-b808397bff7745ea8e883348dc8a5ac9"
external_url = "https://juyoung-1008.tistory.com/17"
+++

## ALTER TABLE 컬럼

```sql
-- 이름 변경 (타입 필수)
ALTER TABLE t CHANGE old_col new_col INT;
-- 순서
ALTER TABLE t MODIFY col VARCHAR(64) AFTER other_col;
-- 기본값
ALTER TABLE t ALTER COLUMN col SET DEFAULT 100;
-- 타입
ALTER TABLE t MODIFY col VARCHAR(64);
-- 추가
ALTER TABLE t ADD level INT DEFAULT 1;
ALTER TABLE t ADD COLUMN ranking INT DEFAULT 0 AFTER user_id;
ALTER TABLE t ADD COLUMN test INT DEFAULT 1 FIRST;
-- 삭제
ALTER TABLE t DROP level;
```
