+++
title = "Windows mysqldump 백업 배치"
date = 2021-06-18T02:22:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS", "SERVER"]
tags = ["DB", "MySQL", "WINDOWS"]
toc = true

[extra]
source = "notion"
notion_id = "cda83206-f384-4fb4-8173-9ba56d1a72dd"
notion_url = "https://app.notion.com/p/Windows-mysqldump-cda83206f3844fb481739ba56d1a72dd"
external_url = "https://offbyone.tistory.com/258"
+++

## Windows mysqldump 백업 배치

```shell
@ECHO OFF
FOR /F "tokens=1-3 delims=- " %%a IN ('DATE /T') DO (SET dt=%%a-%%b-%%c)
FOR /F "tokens=1-4 delims=:." %%a IN ('ECHO %TIME%') DO (SET tm=%%a%%b%%c%%d)
SET backupfilename=_%dt%_%tm%.sql

mysqldump --routines -uUSERNAME -pPASSWORD DBNAME > E:\data\backup\DBNAME%backupfilename%

REM 3일 지난 .sql 삭제
FORFILES /P E:\data\backup /S /M *.sql /D -3 /C "cmd /c del @file"
```

작업 스케줄러에 등록. 계정/비밀번호는 환경변수·자격증명 관리자로 분리 권장.
