+++
title = "Oracle 홑따옴표 포함 문자열"
date = 2020-05-18T15:41:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["DB", "Oracle"]
toc = true

[extra]
source = "notion"
notion_id = "00e9d070-6907-4975-94a1-496bf17a2cd9"
notion_url = "https://app.notion.com/p/Oracle-00e9d0706907497594a1496bf17a2cd9"
+++

## 홑따옴표(`'`) 포함 문자열

문자열 안 홑따옴표는 `''`(연속 2개)로 이스케이프.

```sql
INSERT INTO 테이블 VALUES ('홑따옴표를 넣을래요');
INSERT INTO 테이블 VALUES ('''홑따옴표를 넣을래요''');

SELECT '홑따옴표를 넣을래요', '''홑따옴표를 넣을래요''' FROM DUAL;
```

- 홑따옴표 1개만 추가 → `ORA-00917: 누락된 콤마`
- 쌍따옴표(`"`)는 이스케이프 없이 포함 가능
