+++
title = "SQL Server TCP/IP 포트 확인"
date = 2022-01-14T01:30:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["WINDOWS", "DB", "SQL"]
toc = true

[extra]
source = "notion"
notion_id = "221f5dc3-2015-4139-a7bd-98d3b0bb66c8"
notion_url = "https://app.notion.com/p/SQL-Server-TCP-IP-221f5dc320154139a7bd98d3b0bb66c8"
external_url = "https://sungwookkang.com/383"
+++

## 1) 에러로그

```sql
xp_readerrorlog 0, 1, N'Server is listening on', 'any', NULL, NULL, N'asc'
```

## 2) 구성 관리자

SQL Server 네트워크 구성 → TCP/IP → 속성 → IP 탭 → **IPAll** 포트 확인

## 3) Windows 이벤트

응용 프로그램 로그 → 필터 EventID `26022`
