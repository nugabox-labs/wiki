+++
title = "Oracle 홉따옴표(') 포함 문자열 입력"
date = 2020-05-18T15:41:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["DB", "Oracle"]
toc = true

[extra]
source = "notion"
notion_id = "00e9d070-6907-4975-94a1-496bf17a2cd9"
notion_url = "https://app.notion.com/p/Oracle-00e9d0706907497594a1496bf17a2cd9"
+++

## Oracle 홑따옴표(') 포함 문자열 입력

`'홑따옴표를 넣을래요'`처럼 문자열 안에 홑따옴표를 넣으려면 홑따옴표를 2개 연속(`''`) 입력해야 함:

```sql
-- 그냥 입력: 홑따옴표를 넣을래요
INSERT INTO 테이블 VALUES ('홑따옴표를 넣을래요');

-- 홑따옴표를 문자로 포함하려면 2개 연속으로: '홑따옴표를 넣을래요'
INSERT INTO 테이블 VALUES ('''홑따옴표를 넣을래요''');

-- 확인
SELECT '홑따옴표를 넣을래요', '''홑따옴표를 넣을래요''' FROM DUAL;
```

- 홑따옴표 1개만 추가하면 `ORA-00917: 누락된 콤마` 에러 발생
- 쌍따옴표(`"`)는 이스케이프 없이 그대로 문자열에 포함 가능
