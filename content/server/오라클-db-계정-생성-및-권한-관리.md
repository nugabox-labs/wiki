+++
title = "오라클 DB 계정 생성 및 권한 관리"
date = "2020-02-18T19:26:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["SERVER"]
tags = ["DB", "Oracle"]
toc = true

[extra]
source = "notion"
notion_id = "9d60d463-a97a-41b4-a6af-7bec5cc14f30"
notion_url = "https://app.notion.com/p/DB-9d60d463a97a41b4a6af7bec5cc14f30"
external_url = "https://aileen93.tistory.com/17"
+++

## 오라클 DB 계정 생성 및 사용자 확인

**SYSDBA 접속**

```bash
su - oracle
sqlplus '/as sysdba'
```

**계정/권한 조회**

```sql
SELECT * FROM DBA_USERS;                          -- 생성된 계정 목록
SELECT * FROM ALL_USERS;
SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE = '사용자명';   -- 시스템 권한
SELECT * FROM DBA_ROLE_PRIVS WHERE GRANTEE = '사용자명';  -- 부여된 롤
SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE = '롤명';       -- 롤에 부여된 시스템 권한
SELECT * FROM DBA_TAB_PRIVS WHERE OWNER = '테이블소유자명';   -- 부여한 객체(테이블) 권한
SELECT 테이블명 FROM USER_TABLES;                  -- 소유 테이블 목록
```

**계정 생성/변경/삭제**

```sql
CREATE USER 계정명 IDENTIFIED BY 비밀번호;          -- 비밀번호는 문자로 시작해야 함
ALTER USER 계정명 IDENTIFIED BY 새비밀번호;
DROP USER 계정명 CASCADE;
```

**권한 부여/회수**

```sql
GRANT 권한명 TO 계정;
REVOKE 권한명 ON 테이블명 FROM 계정;
```

**주요 시스템 권한**

| 권한 | 내용 |
| --- | --- |
| CREATE USER | DB 유저 생성 |
| SELECT/CREATE ANY TABLE | 모든 유저 테이블 조회/생성 |
| CREATE SESSION | DB 접속 |
| CREATE TABLE/VIEW/SEQUENCE | 각각 테이블/뷰/시퀀스 생성 |
| CREATE PROCEDURE | 프로시저 생성 |
| SYSDBA / SYSOPER | DB 관리 최고 권한 / 관리 권한 |

원문: [https://aileen93.tistory.com/17](https://aileen93.tistory.com/17)
