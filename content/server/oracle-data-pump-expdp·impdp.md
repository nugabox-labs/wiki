+++
title = "Oracle Data Pump expdp·impdp"
date = 2020-02-18T23:24:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["DB", "Oracle"]
toc = true

[extra]
source = "notion"
notion_id = "0128fa61-0be8-4830-8e9b-db3bd8ec7e14"
notion_url = "https://app.notion.com/p/Oracle-Data-Pump-expdp-impdp-0128fa610be848308e9bdb3bd8ec7e14"
external_url = "https://zzanggoo.tistory.com/97"
+++

# Oracle Data Pump (expdp/impdp)

Oracle 10g+ 제공. exp/imp 후속. 더 빠르고 일시정지·재개·원격 DB 가능. exp 덤프는 impdp 불가 — exp↔imp, expdp↔impdp 짝을 맞춤.

## 사전 준비 (디렉토리 오브젝트)

서버 OS 경로에 파일을 쓰므로 디렉토리 오브젝트·권한이 필요.

```sql
CREATE OR REPLACE DIRECTORY dpump_dir AS '/backup/dpump';
GRANT READ, WRITE ON DIRECTORY dpump_dir TO 사용자;  -- 또는 TO public
GRANT EXP_FULL_DATABASE, IMP_FULL_DATABASE TO 사용자;

SELECT * FROM dba_directories;
-- 기본: SYS.DATA_PUMP_DIR
```

OS에 실제 디렉토리(`mkdir`)·소유권(`chown oracle:dba …`)도 맞출 것.

## expdp 모드

- **full**: DB 전체
- **schema**: `schemas=`
- **tablespace**: `transport_tablespace` 시 OS/blocksize/characterset 동일 필요
- **table**: 특정 테이블

## 공통 파라미터

| 파라미터 | 의미 |
| --- | --- |
| directory | 덤프/로그 디렉토리 오브젝트 |
| dumpfile | 덤프명 (`%U`=병렬 번호) |
| filesize | 파일 최대 크기 |
| parfile | 파라미터 파일 |
| logfile / nologfile | 로그(기본 export.log) |
| content | ALL / DATA\_ONLY / METADATA\_ONLY |
| exclude / include | 오브젝트 제외/포함 |
| query | 조건 데이터만 |
| sample | 일부(0.000001~100%) |
| network\_link | 원격 export(DB Link) |
| job\_name | 작업명 |
| parallel | 병렬 수(`%U` 필요) |
| attach | 중단 작업 재접속 |
| encryption / encryption\_password | 암호화 |

**impdp 전용**

- `table_exists_action`: SKIP(기본) / APPEND / TRUNCATE / DROP
- `remap_schema=원:새`
- `remap_tablespace='원TS':'대상TS'`
- `remap_datafile='원경로':'새경로'`

## 예제

```bash
# 스키마
expdp system/비밀번호 directory=dpump_dir schemas=MESS_ADM dumpfile=MESS_ADM.dmp logfile=MESS_ADM.log

# full
expdp system/비밀번호 full=y directory=dpump_dir dumpfile=full_%U.dmp logfile=full.log job_name=expdp_full

# 테이블 DATA_ONLY
expdp system/비밀번호 directory=dpump_dir tables=MESS_ADM.TB_ABC110 dumpfile=tb.dmp logfile=tb.log content=DATA_ONLY

# 병렬
expdp system/비밀번호 full=y directory=dpump_dir dumpfile=full_%U.dmp parallel=4

# exclude (demo: scott)
expdp scott/암호 directory=dpump_dir dumpfile=scott.dmp schemas=scott exclude=table:"IN ('EMP','DEPT')"

# remap import
impdp system/비밀번호 directory=dpump_dir dumpfile=scott.dmp schemas=scott remap_schema=scott:hr
impdp system/비밀번호 dumpfile=tb.dmp directory=dpump_dir tables=MESS_ADM.TB_ABC110 table_exists_action=APPEND

# network_link
CREATE DATABASE LINK expdp_net01 CONNECT TO system IDENTIFIED BY 비밀번호 USING 'REMOTE_DB_SID';
expdp system/비밀번호 network_link=expdp_net01 directory=dpump_dir dumpfile=remote_%U.dmp job_name=net_expdp full=y
```

## Interactive / 작업 제어

진행 중 `Ctrl+C` → `Export>` (작업은 계속).

```
Export> status
Export> stop_job
Export> continue_client
```

```bash
expdp system/비밀번호 attach=job_name
# Export> start_job
```

```sql
SELECT owner_name, job_name, operation, job_mode, state FROM dba_datapump_jobs;
-- 잔여 job: DROP TABLE 소유자.job명;
```

## 자주 겪는 에러

**ORA-39002 / ORA-39070 / ORA-29283 / ORA-06512 (SYS.UTL\_FILE)**

경로·DIRECTORY GRANT·OS mkdir·`chown oracle:dba` 점검.

**Shell exclude/include 따옴표**

`include=SCHEMA:"='HR'"` → 셸에 따라 `LRM-00116` → 이스케이프 또는 parfile.
