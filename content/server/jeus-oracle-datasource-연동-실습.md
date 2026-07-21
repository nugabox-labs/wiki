+++
title = "Jeus-Oracle DataSource 연동 실습"
date = "2019-09-17T01:33:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["SERVER"]
tags = ["WAS"]
toc = true

[extra]
source = "notion"
notion_id = "4a3c8b3f-c1a8-4d36-aab5-c7d90d8efb0d"
notion_url = "https://app.notion.com/p/Jeus-Oracle-DataSource-4a3c8b3fc1a84d36aab5c7d90d8efb0d"
+++

## Jeus-Oracle DataSource 연동 실습

**Oracle 인스턴스/리스너 기동**

```bash
su - oracle
sqlplus sys/oracle as sysdba
SQL> startup
SQL> quit
lsnrctl start
```

중지: `SQL> shutdown` / `lsnrctl stop`

**계정 언락/비밀번호 변경 (예: scott/tiger)**

```sql
alter user scott account unlock;
-- SQL*Plus에서 password 명령으로 변경 가능
```

## Jeus 웹관리자에서 DataSource 등록

1. 웹관리자 > Resource > DataSource > Database ADD
1. 입력값: Data Source Id, Export Name, Vendor(Oracle), Source Type(ConnectionPoolDataSource), Server Name, Port(1521), Database Name(SID), User, Password(DES 방식 입력), Property(`driverType:java.lang.String=thin`)
1. Test로 연동 확인
1. Servers > 대상 서버 > Data Sources에서 체크
1. Applications에 배포할 앱 추가(Deploy) 후 target 서버 지정
1. 서버 재기동 후 `IP:포트/session.jsp` 등으로 접속 테스트
