+++
title = "SQL 정규식으로 숫자/문자 구별"
date = 2019-06-24T14:58:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["DB", "Oracle"]
toc = true

[extra]
source = "notion"
notion_id = "2c4cddcf-5cfe-4330-b0d1-64ca784a20bd"
notion_url = "https://app.notion.com/p/SQL-2c4cddcf5cfe4330b0d164ca784a20bd"
+++

## SQL 정규식으로 숫자/문자 구별 (MySQL REGEXP 기준)

```sql
-- 숫자만
SELECT * FROM 테이블 WHERE 컬럼 REGEXP '^[0-9]*$';

-- 숫자+영문
SELECT * FROM 테이블 WHERE 컬럼 REGEXP '^[0-9a-zA-Z]*$';

-- 문자만
SELECT * FROM 테이블 WHERE 컬럼 REGEXP '^[a-zA-Z]*$';
```

- Oracle에서는 `REGEXP_LIKE(컬럼, '패턴')` 함수 사용

원문: [https://highcode.tistory.com/6](https://highcode.tistory.com/6)
