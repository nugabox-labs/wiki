+++
title = "Oracle Tablespace 생성/확인/이동"
date = 2020-06-04T11:32:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["DB", "Oracle"]
toc = true

[extra]
source = "notion"
notion_id = "3a1c89c6-b967-475a-900b-51947716425b"
notion_url = "https://app.notion.com/p/Oracle-Tablespace-3a1c89c6b967475a900b51947716425b"
+++

> 원본이 스크린샷 이미지뿐(텍스트 추출 불가)

## Oracle Tablespace 생성/확인/이동 (일반 참고)

```sql
-- 생성
CREATE TABLESPACE 테이블스페이스명
  DATAFILE '/경로/파일명.dbf' SIZE 100M AUTOEXTEND ON NEXT 10M MAXSIZE UNLIMITED;

-- 확인
SELECT tablespace_name, file_name, bytes/1024/1024 AS MB FROM dba_data_files;
SELECT tablespace_name, status FROM dba_tablespaces;

-- 테이블을 다른 테이블스페이스로 이동
ALTER TABLE 테이블명 MOVE TABLESPACE 새테이블스페이스명;

-- 데이터파일 자체 이동(오프라인 필요)
ALTER TABLESPACE 테이블스페이스명 OFFLINE;
-- OS에서 파일 이동 후
ALTER TABLESPACE 테이블스페이스명 RENAME DATAFILE '기존경로' TO '새경로';
ALTER TABLESPACE 테이블스페이스명 ONLINE;
```
