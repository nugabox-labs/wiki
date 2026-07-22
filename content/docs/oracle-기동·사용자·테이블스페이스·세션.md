+++
title = "Oracle 기동·사용자·테이블스페이스·세션"
date = 2020-11-03T08:17:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["DB", "Oracle", "SQL"]
toc = true

[extra]
source = "notion"
notion_id = "603aca23-81c7-4784-8a8e-3648e5f1e7e2"
notion_url = "https://app.notion.com/p/Oracle-603aca2381c747848a8e3648e5f1e7e2"
external_url = "https://sysinfo.tistory.com/16"
+++

관련: Oracle Character Set 변경 · Oracle 세션·락

## 기동/종료

```bash
# 종료
lsnrctl stop
sqlplus '/as sysdba'
SQL> shutdown immediate;

# 기동
sqlplus '/as sysdba'
SQL> startup;
lsnrctl start
```

### 기동 오류

- `ORA-01033`: `shutdown abort` 또는 `startup nomount` → `alter database mount;` → `alter database open;`
- 복구: mount 후 `recover database;` / `recover database using backup controlfile until cancel;`
- 필요 시 `alter database open resetlogs;`

## 사용자

```sql
SELECT * FROM all_users ORDER BY user_id;
SELECT * FROM v$pwfile_users;
```

## 테이블스페이스

```sql
SELECT * FROM dba_tablespaces;
SELECT * FROM dba_data_files;
SELECT * FROM dba_temp_files;
SELECT * FROM user_users;  -- default tablespace

ALTER USER <user> DEFAULT TABLESPACE <ts>;
ALTER TABLE <table> MOVE TABLESPACE <ts>;
ALTER TABLESPACE <ts> ONLINE;  -- / OFFLINE
ALTER DATABASE DATAFILE '<path>' RESIZE 10M;
ALTER TABLESPACE <ts> ADD DATAFILE '<path>' SIZE 10M AUTOEXTEND ON NEXT 10M MAXSIZE 100M;
DROP TABLESPACE <ts> INCLUDING CONTENTS AND DATAFILES;

CREATE TABLESPACE <ts> DATAFILE '<path>' SIZE 10M AUTOEXTEND ON NEXT 10M MAXSIZE 100M;
CREATE TEMPORARY TABLESPACE <ts> TEMPFILE '<path>' SIZE 10M EXTENT MANAGEMENT LOCAL UNIFORM SIZE 512K;
CREATE UNDO TABLESPACE <ts> DATAFILE '<path>' SIZE 10M AUTOEXTEND ON NEXT 10M MAXSIZE 100M;
ALTER DATABASE DEFAULT TEMPORARY TABLESPACE <ts>;
```

### 사용량

```sql
SELECT A.TABLESPACE_NAME, A.FILE_ID,
       ROUND(A.BYTES/1024/1024/1024,2)||'G' USABLE,
       ROUND(B.BYTES/1024/1024/1024,2)||'G' FREE,
       TRUNC(100-(B.BYTES/A.BYTES*100),2)||'%' USED_RATE
  FROM (SELECT TABLESPACE_NAME, FILE_ID, SUM(BYTES) BYTES FROM DBA_DATA_FILES GROUP BY TABLESPACE_NAME, FILE_ID) A,
       (SELECT TABLESPACE_NAME, FILE_ID, SUM(BYTES) BYTES FROM DBA_FREE_SPACE GROUP BY TABLESPACE_NAME, FILE_ID) B
 WHERE A.TABLESPACE_NAME = B.TABLESPACE_NAME AND A.FILE_ID = B.FILE_ID(+)
 ORDER BY USED_RATE DESC;
```

## 세션

```sql
SELECT * FROM V$SESSION;
SELECT USERNAME, PROGRAM FROM V$SESSION;
ALTER SYSTEM KILL SESSION '<sid>,<serial#>';
SELECT A.SID, A.SERIAL#, A.USERNAME,
       'ALTER SYSTEM KILL SESSION '''||A.SID||','||A.SERIAL#||''';' AS KILLSCRIPT
  FROM V$SESSION A ORDER BY A.LOGON_TIME;
```

## 객체 삭제

```sql
DROP TABLE TABLE_NAME CASCADE CONSTRAINTS;
SELECT 'DROP TABLE '||object_name||' CASCADE CONSTRAINTS;' FROM user_objects WHERE object_type='TABLE';
```

## NLS / 캐릭터셋

```bash
# ~/.bash_profile
export LANG="ko_KR.UTF-8"
export NLS_LANG=KOREAN_KOREA.AL32UTF8
```

```sql
SELECT name, value$ FROM sys.props$ WHERE name IN ('NLS_CHARACTERSET','NLS_NCHAR_CHARACTERSET','NLS_LANGUAGE');
SELECT parameter, value FROM nls_database_parameters WHERE parameter='NLS_CHARACTERSET';
```

> 캐릭터셋 강제 변경은 위험. 백업 후 공식 절차 따를 것.
