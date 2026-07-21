+++
title = "Oracle Data Pump (expdp/impdp) 종합 가이드"
date = "2020-02-18T23:24:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["SERVER"]
tags = ["DB", "Oracle"]
toc = true

[extra]
source = "notion"
notion_id = "0128fa61-0be8-4830-8e9b-db3bd8ec7e14"
notion_url = "https://app.notion.com/p/Oracle-Data-Pump-expdp-impdp-0128fa610be848308e9bdb3bd8ec7e14"
+++

# Oracle Data Pump (expdp/impdp)

Oracle 10g+ 부터 제공되는 exp/imp 후속 유틸리티. exp 대비 훨씬 빠르고, 일시정지/재개가 가능하며 원격 DB에도 사용 가능. 단, exp로 백업한 파일은 impdp로 못 열고 반드시 imp/expdp 짝을 맞춰야 함.

## 사전 준비 (디렉토리 오브젝트)

Data Pump는 DB 서버의 OS 디렉토리에 직접 파일을 써야 하므로, 미리 디렉토리 오브젝트를 만들고 권한을 부여해야 함:

```sql
CREATE OR REPLACE DIRECTORY dpump_dir AS '/backup/dpump';
GRANT READ, WRITE ON DIRECTORY dpump_dir TO 사용자;   -- 또는 TO public;
GRANT EXP_FULL_DATABASE, IMP_FULL_DATABASE TO 사용자;

-- 디렉토리 목록 확인
SELECT * FROM dba_directories;
-- 기본 제공: SYS.DATA_PUMP_DIR
```

OS에도 실제 디렉토리가 존재해야 함(`mkdir`), 권한(소유자/그룹) 문제로 안 될 때는 `chown oracle:dba 폴더명`

## expdp 실행 모드

- **full**: DB 전체
- **schema**: 특정 스키마(`schemas=` 파라미터)
- **tablespace**: 특정 테이블스페이스(`transport_tablespace` 사용 시 양쪽 OS/blocksize/characterset 동일해야 함)
- **table**: 특정 테이블만

## 주요 expdp/impdp 공통 파라미터

| 파라미터 | 의미 |
| --- | --- |
| directory | 덤프/로그 파일 위치(디렉토리 오브젝트명) |
| dumpfile | 덤프파일명 (`%U`로 병렬 작업 시 자동 번호 부여) |
| filesize | 파일 하나의 최대 크기 |
| parfile | 파라미터 파일 참조 |
| logfile/nologfile | 로그파일명 (기본 export.log) |
| content | ALL / DATA\_ONLY / METADATA\_ONLY |
| exclude/include | 특정 오브젝트만 제외/포함 |
| query | 조건에 맞는 데이터만 추출 |
| sample | 데이터 일부만(0.000001~100%) 추출 |
| network\_link | 원격 DB에서 직접 export(DB Link 필요) |
| job\_name | 작업 이름 수동 지정 |
| parallel | 병렬 프로세스 수 (dumpfile에 `%U` 필요) |
| attach | 중단된 작업에 재접속 |
| encryption/encryption\_password | 덤프 암호화(ALL/DATA\_ONLY/ENCRYPTED\_COLUMNS\_ONLY/METADATA\_ONLY/NONE) |

**impdp 전용**

- `table_exists_action`: SKIP(기본) / APPEND / TRUNCATE / DROP
- `remap_schema=원래스키마:새스키마`: 다른 계정으로 import
- `remap_tablespace='원본TS':'대상TS'`: 다른 테이블스페이스로 import
- `remap_datafile='원본경로':'새경로'`: 데이터파일 경로 재매핑

## 실전 예제

```bash
# 스키마 전체 백업
expdp system/비밀번호 directory=dpump_dir schemas=MESS_ADM dumpfile=MESS_ADM.dmp logfile=MESS_ADM.log

# DB 전체 백업
expdp system/비밀번호 full=y directory=dpump_dir dumpfile=full_%U.dmp logfile=full.log job_name=expdp_full

# 특정 테이블만 (데이터만)
expdp system/비밀번호 directory=dpump_dir tables=MESS_ADM.TB_ABC110 dumpfile=tb.dmp logfile=tb.log content=DATA_ONLY

# 병렬 처리
expdp system/비밀번호 full=y directory=dpump_dir dumpfile=full_%U.dmp parallel=4

# 특정 테이블 제외
expdp scott/암호 directory=dpump_dir dumpfile=scott.dmp schemas=scott exclude=table:"IN ('EMP','DEPT')"

# 스키마 이관하며 import (scott → hr)
impdp system/비밀번호 directory=dpump_dir dumpfile=scott.dmp schemas=scott remap_schema=scott:hr

# 같은 테이블 있으면 append
impdp system/비밀번호 dumpfile=tb.dmp directory=dpump_dir tables=MESS_ADM.TB_ABC110 table_exists_action=APPEND

# 원격 DB에서 직접 export (DB Link 활용)
CREATE DATABASE LINK expdp_net01 CONNECT TO system IDENTIFIED BY 비밀번호 USING 'REMOTE_DB_SID';
expdp system/비밀번호 network_link=expdp_net01 directory=dpump_dir dumpfile=remote_%U.dmp job_name=net_expdp full=y
```

## 작업 제어 (Interactive Mode)

expdp/impdp 진행 중 `Ctrl+C` → Interactive 모드(`Export>` 프롬프트) 진입, 작업은 계속 진행됨

```javascript
Export> status          -- 진행상태 확인
Export> stop_job        -- 일시 중단
Export> continue_client -- 다시 진행상황 출력 모드로
```

중단된 작업 재접속/재개:

```bash
expdp system/비밀번호 attach=job_name
Export> start_job
```

현재 작업 목록 확인:

```sql
SELECT owner_name, job_name, operation, job_mode, state FROM dba_datapump_jobs;
```

비정상 종료로 작업이 안 지워질 때: 위 조회로 확인 후 해당 job과 이름이 같은 마스터 테이블을 `DROP TABLE 소유자.job명;`으로 직접 삭제

## 자주 겪는 에러

**ORA-39002 / ORA-39070 / ORA-29283 / ORA-06512 at "SYS.UTL\_FILE"**

- 원인 다양: 경로 오타, 디렉토리 권한 미부여, OS 디렉토리 미생성, 디렉토리 소유권 문제
- 체크리스트: ① 경로 오타 확인 ② `GRANT READ, WRITE ON DIRECTORY ... TO 사용자` 확인 ③ OS에 실제 디렉토리 존재 확인(`mkdir`) ④ 디렉토리 소유권/그룹 확인 (`chown oracle:dba 폴더명`)

**Shell에서 exclude/include 조건에 따옴표 이스케이프 문제**

- `include=SCHEMA:"='HR'"` 형태는 셸에 따라 `LRM-00116: syntax error` 발생 가능 → 이스케이프(`\"`, `\'`)를 정확히 맞추거나 parfile 사용 권장

원문: [https://zzanggoo.tistory.com/97](https://zzanggoo.tistory.com/97) , [https://cofs.tistory.com/72](https://cofs.tistory.com/72) , [https://cofs.tistory.com/337](https://cofs.tistory.com/337) , [https://dinggur.tistory.com/167](https://dinggur.tistory.com/167) , [https://gyh214.tistory.com/110](https://gyh214.tistory.com/110)
