+++
title = "MSSQL OLE DB ConnectionOpen 액세스 오류"
date = 2021-12-10T13:06:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER", "TECH"]
tags = ["DB", "SQL", "WINDOWS", "ISSUE"]
toc = true

[extra]
source = "notion"
notion_id = "a400e102-418d-40f1-9dcb-95c2cdbe023d"
notion_url = "https://app.notion.com/p/MSSQL-OLE-DB-ConnectionOpen-a400e102418d40f19dcb95c2cdbe023d"
external_url = "https://sehoonkim.tistory.com/177"
+++

## 증상

OLE DB `80004005` / DBNETLIB `ConnectionOpen` — SQL Server 없음 또는 액세스 불가.

## 원인

TCP 포트 미설정(또는 비활성).

## 해결 (SQL Server 구성 관리자)

1. **SQL Server 네트워크 구성** → `{인스턴스}`에 대한 프로토콜 → **TCP/IP**
1. **IP 주소** 탭 → **IPALL** → TCP 포트 = `1433`
1. 적용/확인
1. **SQL Server 서비스** → SQL Server(`{인스턴스}`) → 다시 시작
