+++
title = "Oracle 개인정보(전화번호) 마스킹"
date = "2019-09-26T08:53:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["SERVER"]
tags = ["DB", "Oracle"]
toc = true

[extra]
source = "notion"
notion_id = "eaed5ece-f095-4eaf-9798-cdc9030966e8"
notion_url = "https://app.notion.com/p/Oracle-eaed5ecef0954eaf9798cdc9030966e8"
+++

## Oracle 개인정보(전화번호) 마스킹

```sql
-- 조회 시 마스킹 (원본 데이터는 안 바꾸고 SELECT 결과만 처리)
SELECT REGEXP_REPLACE(컬럼, '^\d{3}-\d{3,4}-\d{4}$', '***-****-****')
FROM 테이블
WHERE REGEXP_LIKE(컬럼, '^\d{3}-\d{3,4}-\d{4}$');

-- 실제 데이터를 마스킹 처리(비가역, 주의해서 사용)
UPDATE 테이블
SET 컬럼 = REGEXP_REPLACE(컬럼, '^\d{3}-\d{3,4}-\d{4}$', '***-****-****')
WHERE REGEXP_LIKE(컬럼, '^\d{3}-\d{3,4}-\d{4}$');
```
