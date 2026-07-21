+++
title = "MariaDB/MySQL 설정 파일 경로"
date = 2021-04-28T02:46:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["DB", "MySQL", "SYNOLOGY"]
toc = true

[extra]
source = "notion"
notion_id = "25c032ef-73b8-4ae7-b392-62de324ff34e"
notion_url = "https://app.notion.com/p/MariaDB-MySQL-25c032ef73b84ae7b39262de324ff34e"
external_url = "https://app.notion.com/p/768ff7f8a3a742609c14b9a8c035c8f4"
+++

## 설정 파일 경로

- `/etc/my.cnf` — 메인 (보통 `!includedir /etc/my.cnf.d/`)
- `/etc/my.cnf.d/` — 조각 설정
  - `server.cnf` — 서버·charset
  - `mysql-clients.cnf` — mysql/mysqldump 클라이언트
- 컴파일·커스텀: `basedir/my.cnf` 또는 `--defaults-file=`
