+++
title = "MSSQL 운영체제 오류 5 액세스 거부"
date = 2022-01-14T01:30:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER", "TECH"]
tags = ["DB", "SQL", "WINDOWS", "ISSUE"]
toc = true

[extra]
source = "notion"
notion_id = "0999c61f-79ee-43dc-9d8a-adfc9a19a0d6"
notion_url = "https://app.notion.com/p/MSSQL-5-0999c61f79ee43dc9d8aadfc9a19a0d6"
external_url = "https://zadd.tistory.com/80"
+++

## 증상

`운영 체제 오류 5(액세스가 거부되었습니다.)` — `.mdf` 디렉터리 조회 실패.

## 해결

1. `Win+R` → `services.msc`
1. **SQL Server** 서비스 → 속성 → **로그온** → **로컬 시스템 계정**
1. SQL Server 서비스 다시 시작
1. SSMS 재실행
