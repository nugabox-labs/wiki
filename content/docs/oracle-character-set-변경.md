+++
title = "Oracle Character Set 변경"
date = 2020-02-27T11:12:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["DB", "Oracle"]
toc = true

[extra]
source = "notion"
notion_id = "c4427768-0306-48c7-861b-639b4b216cd6"
notion_url = "https://app.notion.com/p/Oracle-Character-Set-c4427768030648c7861b639b4b216cd6"
external_url = "https://keichee.tistory.com/23"
+++

⚠️ 캐릭터셋 변경은 DB가 깨질 수 있음 — **사전 백업 필수**.

## 확인

```sql
SELECT * FROM nls_database_parameters WHERE parameter LIKE '%CHARACTERSET%';
SELECT * FROM sys.props$ WHERE name='NLS_CHARACTERSET';
```

## 클라이언트 NLS\_LANG

```bash
export NLS_LANG=KOREAN_KOREA.UTF-8
# 또는
export NLS_LANG=KOREAN_KOREA.KO16MSWIN949
```

## DB 캐릭터셋 변경

Import 시 불일치(`ORA-01461`, `IMP-00038` 등)면 원본과 같은 셋으로 임시 맞출 때:

```sql
CONN / AS SYSDBA;
UPDATE sys.props$ SET value$='KO16KSC5601' WHERE name='NLS_CHARACTERSET';
UPDATE sys.props$ SET value$='KO16KSC5601' WHERE name='NLS_NCHAR_CHARACTERSET';
COMMIT;
SHUTDOWN IMMEDIATE;
STARTUP;
```

**AL32UTF8**

```sql
UPDATE sys.props$ SET value$='AL32UTF8' WHERE name='NLS_CHARACTERSET';
UPDATE sys.props$ SET value$='AL32UTF8' WHERE name='NLS_NCHAR_CHARACTERSET';
UPDATE sys.props$ SET value$='KOREAN_KOREA.AL32UTF8' WHERE name='NLS_LANGUAGE';
COMMIT;
```

**KO16MSWIN949**

```sql
UPDATE sys.props$ SET value$='KO16MSWIN949' WHERE name='NLS_CHARACTERSET';
UPDATE sys.props$ SET value$='KO16MSWIN949' WHERE name='NLS_NCHAR_CHARACTERSET';
UPDATE sys.props$ SET value$='KOREAN_KOREA.KO16MSWIN949' WHERE name='NLS_LANGUAGE';
COMMIT;
```

## 재시작 후 명시 적용

```sql
SHUTDOWN IMMEDIATE;
STARTUP MOUNT;
ALTER SYSTEM ENABLE RESTRICTED SESSION;
ALTER SYSTEM SET job_queue_processes=0;
ALTER SYSTEM SET aq_tm_processes=0;
ALTER DATABASE OPEN;
ALTER DATABASE CHARACTER SET AL32UTF8;   -- 또는 KO16MSWIN949
SHUTDOWN IMMEDIATE;
STARTUP;
```
