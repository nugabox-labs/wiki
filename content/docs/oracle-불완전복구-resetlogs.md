+++
title = "Oracle 불완전복구 RESETLOGS"
date = 2021-11-09T01:52:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "TECH"]
tags = ["Oracle", "DB", "SQL", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "bf14a214-c2f2-48bf-a09b-26d84a7c85fd"
notion_url = "https://app.notion.com/p/Oracle-RESETLOGS-bf14a214c2f248bfa09b26d84a7c85fd"
external_url = "https://gyh214.tistory.com/90"
+++

## 요점

- 과거 시점까지 DB 전체 복구 → open 시 **반드시** `RESETLOGS`
- RESETLOGS 후 이전 archive/redo는 무효 → **임시 경로에서 시도** 권장
- SCN 통일 목적: control/redo를 datafile 기준으로 맞춤

## 복구 명령

```sql
-- 시간 기반
RECOVER DATABASE UNTIL TIME 'YYYY-MM-DD:HH24:MI:SS';
-- 또는
ALTER DATABASE RECOVER UNTIL TIME 'YYYY-MM-DD:HH24:MI:SS';

-- CANCEL 기반 (backup controlfile과 자주 사용)
RECOVER DATABASE UNTIL CANCEL;

ALTER DATABASE OPEN RESETLOGS;
```

## 시나리오 요약 (잘못된 DELETE 복구)

```bash
# 1) 핫백업 확보 후
# 2) 데이터 입력·시각 기록 → DELETE 발생
shutdown immediate
mkdir ~/temp
cp -av /backup/.../{system,sysaux,undo,users}*.dbf ~/temp/
cp -av $ORACLE_BASE/oradata/.../control* ~/temp/
cp -av $ORACLE_BASE/oradata/.../*.log ~/temp/
```

```sql
-- init*.ora control_files를 ~/temp 로 변경
STARTUP MOUNT;
ALTER DATABASE RENAME FILE '.../system01.dbf' TO '/home/oracle/temp/system01.dbf';
-- sysaux/undo/users/redo 도 동일
ALTER DATABASE DATAFILE '.../example01.dbf' OFFLINE DROP;  -- 미복사 파일

RECOVER DATABASE UNTIL TIME '2012-02-06:16:46:59';
-- Specify log: AUTO
ALTER DATABASE OPEN RESETLOGS;
-- 확인 후 exp/imp 로 원본 DB에 테이블만 반영
```
