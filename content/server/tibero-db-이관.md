+++
title = "Tibero DB 이관"
date = 2021-05-06T01:12:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["DB", "Tibero"]
toc = true

[extra]
source = "notion"
notion_id = "25c7e6c6-7b34-4a8f-98d9-dc02f0cbfa64"
notion_url = "https://app.notion.com/p/Tibero-DB-25c7e6c67b344a8f98d9dc02f0cbfa64"
external_url = "https://app.notion.com/p/e2242e505bc34b41b4f02c9edff6704c"
+++

## USER Migration

### 오브젝트 일괄 DROP 문 생성

```sql
SELECT 'drop '
  || object_type
  || ' '
  || object_name
  || DECODE(OBJECT_TYPE, 'TABLE', ' CASCADE CONSTRAINTS;', ';')
FROM user_objects;
```

결과를 실행한 뒤 사용자 삭제.

```sql
DROP USER username CASCADE;
```

### 세션이 남아 삭제 실패할 때

```sql
SELECT * FROM V$SESSION;
ALTER SYSTEM KILL SESSION 'sid,serial#';
```

### 사용자 생성·권한

```sql
CREATE USER username
  IDENTIFIED BY userpassword
  DEFAULT TABLESPACE tablespacename;

GRANT CONNECT, DBA, RESOURCE TO username;

GRANT CREATE DATABASE LINK, CREATE TABLE, ALTER ANY TABLE, DROP ANY TABLE,
  SELECT ANY TABLE, INSERT ANY TABLE, UPDATE ANY TABLE, DELETE ANY TABLE,
  CREATE PROCEDURE, CREATE ANY PROCEDURE, ALTER ANY PROCEDURE, DROP ANY PROCEDURE,
  EXECUTE ANY PROCEDURE, CREATE SESSION, LOCK ANY TABLE, COMMENT ANY TABLE,
  CREATE SEQUENCE, CREATE ANY SEQUENCE, ALTER ANY SEQUENCE, DROP ANY SEQUENCE,
  SELECT ANY SEQUENCE, CREATE TRIGGER, CREATE ANY TRIGGER, ALTER ANY TRIGGER,
  DROP ANY TRIGGER, CREATE VIEW, CREATE ANY VIEW, DROP ANY VIEW TO username;

-- 프로시저에서 동적 테이블 생성 시
GRANT EXECUTE ON DBMS_SQL TO username;
```

## TBEXPORT / TBIMPORT

- 모드: `FULL` | `USER` | `TABLE` 중 **하나만**. import 시 `FROMUSER`면 `TOUSER` 필수.
- Tablespace 이름이 양쪽 DB에서 같은지 확인. 권한 이슈 예방으로 `sys` 권장.
- import 전 Tablespace·User 미리 생성.
- `password=PASS` 등은 플레이스홀더(데모 기본값 `tibero` 아님).

```bash
# export 로컬
tbexport username=sys password=PASS port=8629 sid=SID file=exported.dat full=y
tbexport username=sys password=PASS port=8629 sid=SID file=exported.dat user=SCHEMA
tbexport username=sys password=PASS port=8629 sid=SID file=exported.dat table=SCHEMA.TBL

# export 원격 (파일은 원격에 생성)
tbexport username=sys password=PASS ip=HOST port=8629 sid=SID file=exported.dat full=y

# import
tbimport username=sys password=PASS port=8629 sid=SID file=out.dat full=y
tbimport username=sys password=PASS port=8629 sid=SID file=out.dat fromuser=A touser=B
tbimport username=sys password=PASS ip=HOST port=8629 sid=SID file=out.dat full=y
```
