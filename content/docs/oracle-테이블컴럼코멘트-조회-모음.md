+++
title = "Oracle 테이블/컴럼/코멘트 조회 모음"
date = 2020-11-04T11:20:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["DB", "Oracle"]
toc = true

[extra]
source = "notion"
notion_id = "80eb18f6-021b-4f61-805e-d05dc1dd2ae9"
notion_url = "https://app.notion.com/p/Oracle-80eb18f6021b4f61805ed05dc1dd2ae9"
external_url = "https://coding-factory.tistory.com/415"
+++

## Oracle 테이블/컬럼/코멘트 조회 모음

**전체 테이블 목록**

```sql
select * from all_all_tables;
select * from dba_tables;
select * from all_objects where object_type = 'TABLE';
-- 접속 계정 테이블만
select * from tabs;
select * from user_objects where object_type = 'TABLE';
select * from user_tables;
```

- dba\_*, all\_* 계열은 권한 필요, 없으면 user\_\* 계열 사용

**테이블 코멘트 조회** (어떤 테이블을 써야 할지 모를 때 유용, WHERE절에 LIKE로 검색)

```sql
select * from all_tab_comments;
select * from user_tab_comments;
```

**전체 컬럼 조회** (특정 컬럼을 쓰는 테이블 찾을 때: `WHERE column_name = '컬럼명'`)

```sql
select * from cols;
select * from all_tab_columns;
select * from user_tab_columns;
```

**컬럼 코멘트 조회**

```sql
select * from all_col_comments;
select * from user_col_comments;
```
