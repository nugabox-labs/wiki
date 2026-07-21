+++
title = "MariaDB/MySQL 설정 파일 경로"
date = "2021-04-28T02:46:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["OS", "SERVER"]
tags = ["DB", "MySQL", "SYNOLOGY"]
toc = true

[extra]
source = "notion"
notion_id = "25c032ef-73b8-4ae7-b392-62de324ff34e"
notion_url = "https://app.notion.com/p/MariaDB-MySQL-25c032ef73b84ae7b39262de324ff34e"
+++

## MariaDB 설정 파일 경로

- `/etc/my.cnf` — 메인 (보통 `my.cnf.d/*.cnf` include)
- `/etc/my.cnf.d/` — 실제 설정 조각
- `server.cnf` — 서버·charset 등
- `mysql-clients.cnf` — mysql/mysqldump 클라이언트

대소문자: [lower\_case\_table\_names](https://app.notion.com/p/14433acc28b74f12ab7c6c02e3938b30)
