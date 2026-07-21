+++
title = "SQL 날짜/시간 컴럼 수정 (Oracle TO_DATE)"
date = "2019-09-26T09:20:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["SERVER"]
tags = ["DB", "Oracle"]
toc = true

[extra]
source = "notion"
notion_id = "2f5eb756-51d5-46be-8aac-445aae22cfe9"
notion_url = "https://app.notion.com/p/SQL-Oracle-TO_DATE-2f5eb75651d546be8aac445aae22cfe9"
+++

## SQL 특정 컬럼의 날짜/시간 값 수정 (Oracle TO\_DATE)

```sql
UPDATE 스키마.테이블명
SET REG_DT = TO_DATE('2019/05/24 11:00:00', 'YYYY/MM/DD HH24:MI:SS')
WHERE PK컬럼 = '값';
```

- `TO_DATE`의 포맷 문자열은 입력 날짜 문자열의 형식과 정확히 일치해야 함
