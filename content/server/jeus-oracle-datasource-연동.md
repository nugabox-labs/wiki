+++
title = "Jeus Oracle DataSource 연동"
date = 2019-09-17T01:33:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["WAS", "Oracle", "DB"]
toc = true

[extra]
source = "notion"
notion_id = "4a3c8b3f-c1a8-4d36-aab5-c7d90d8efb0d"
notion_url = "https://app.notion.com/p/Jeus-Oracle-DataSource-4a3c8b3fc1a84d36aab5c7d90d8efb0d"
+++

> lab 예: `sys/oracle`, `scott`/`tiger` — 실서비스 비밀번호 아님.

## Oracle 기동

```bash
su - oracle
sqlplus sys/PASS as sysdba
SQL> startup
SQL> quit
lsnrctl start
```

중지: `SQL> shutdown` / `lsnrctl stop`

## 계정 언락 (샘플 scott)

```sql
alter user scott account unlock;
-- SQL*Plus password 명령으로 변경 가능
```

## Jeus DataSource 등록

1. 웹관리자 > Resource > DataSource > Database ADD
1. 입력: Data Source Id, Export Name, Vendor(Oracle), Source Type(ConnectionPoolDataSource), Server Name, Port(1521), Database Name(SID), User, Password(DES), Property(`driverType:java.lang.String=thin`)
1. Test로 연동 확인
1. Servers > 대상 서버 > Data Sources 체크
1. Applications Deploy 후 target 지정
1. 서버 재기동 후 `IP:포트/session.jsp` 등으로 확인
