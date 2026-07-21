+++
title = "Oracle Character Set 변경"
date = 2020-02-27T11:12:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["DB", "Oracle"]
toc = true

[extra]
source = "notion"
notion_id = "c4427768-0306-48c7-861b-639b4b216cd6"
notion_url = "https://app.notion.com/p/Oracle-Character-Set-c4427768030648c7861b639b4b216cd6"
external_url = "https://keichee.tistory.com/23"
+++

## Oracle Character Set 변경

⚠️ 캐릭터셋 변경은 DB가 깨질 수 있으니 **반드시 사전 백업** 후 진행

### 확인

```sql
SELECT * FROM nls_database_parameters WHERE parameter LIKE '%CHARACTERSET%';
-- 또는
SELECT * FROM sys.props$ WHERE name='NLS_CHARACTERSET';
```

### 클라이언트 NLS\_LANG 설정 (필요시)

```bash
export NLS_LANG=KOREAN_KOREA.UTF-8
# 또는
export NLS_LANG=KOREAN_KOREA.KO16MSWIN949
```

### DB 캐릭터셋 변경

**Import 시 캐릭터셋 불일치로 에러날 때** (`ORA-01461`, `IMP-00038` 등) — import 원본과 같은 캐릭터셋으로 임시 변경:

```sql
CONN / AS SYSDBA;
UPDATE sys.props$ SET value$='KO16KSC5601' WHERE name='NLS_CHARACTERSET';
UPDATE sys.props$ SET value$='KO16KSC5601' WHERE name='NLS_NCHAR_CHARACTERSET';
COMMIT;
```

```javascript
SHUTDOWN IMMEDIATE;
STARTUP;
```

**AL32UTF8(UTF-8)로 변경**

```sql
UPDATE sys.props$ SET value$='AL32UTF8' WHERE name='NLS_CHARACTERSET';
UPDATE sys.props$ SET value$='AL32UTF8' WHERE name='NLS_NCHAR_CHARACTERSET';
UPDATE sys.props$ SET value$='KOREAN_KOREA.AL32UTF8' WHERE name='NLS_LANGUAGE';
COMMIT;
```

**KO16MSWIN949(한글 확장)로 변경**

```sql
UPDATE sys.props$ SET value$='KO16MSWIN949' WHERE name='NLS_CHARACTERSET';
UPDATE sys.props$ SET value$='KO16MSWIN949' WHERE name='NLS_NCHAR_CHARACTERSET';
UPDATE sys.props$ SET value$='KOREAN_KOREA.KO16MSWIN949' WHERE name='NLS_LANGUAGE';
COMMIT;
```

**변경 후 재시작 및 DB 캐릭터셋 명시적 적용**

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

원문: [https://keichee.tistory.com/23](https://keichee.tistory.com/23) (참고: [algina.tistory.com/41](http://algina.tistory.com/41))
