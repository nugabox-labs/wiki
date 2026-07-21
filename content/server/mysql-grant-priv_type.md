+++
title = "MySQL GRANT priv_type"
date = 2021-05-10T01:34:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "8503e72f-d8ae-4381-975f-093b599212b3"
notion_url = "https://app.notion.com/p/MySQL-GRANT-priv_type-8503e72fd8ae4381975f093b599212b3"
external_url = "https://newstars.cloud/181"
+++

## GRANT priv\_type 요약

`SHOW GRANTS FOR 'user'@'host';`

| 권한 | 의미 |
| --- | --- |
| SELECT/INSERT/UPDATE/DELETE | DML |
| CREATE/DROP/ALTER/INDEX | DDL |
| CREATE/ALTER/EXECUTE ROUTINE | 스토어드 루틴 |
| CREATE USER | 계정 관리 |
| FILE | OUTFILE / LOAD DATA |
| PROCESS / RELOAD / SUPER / SHUTDOWN | 서버 관리 |
| REPLICATION CLIENT/SLAVE | 복제 |
| TRIGGER / EVENT | 트리거·이벤트 |
| LOCK TABLES | 락 |
| SHOW DATABASES / SHOW VIEW | 메타 조회 |
| USAGE | 권한 없음(계정만) |
| GRANT OPTION | 권한 위임 |
| ALL PRIVILEGES | 전부 |
