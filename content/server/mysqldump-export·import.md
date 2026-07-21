+++
title = "mysqldump Export·Import"
date = 2020-09-21T11:54:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "f5415070-160a-4161-bce8-d66a6a75c5a4"
notion_url = "https://app.notion.com/p/mysqldump-Export-Import-f5415070160a4161bce8d66a6a75c5a4"
external_url = "https://musma.github.io/2019/02/12/mysql-dump-and-import.html"
+++

## Export → Import

```bash
mysqldump \
  --host=${SOURCE_DB_HOST} \
  --user=${SOURCE_DB_USER} --password \
  --default-character-set=utf8mb4 --set-charset \
  --compact --extended-insert --quick --hex-blob \
  --single-transaction \
  --events --routines --triggers \
  --databases ${SOURCE_DB_NAME} > dump.sql

mysql \
  --host=${TARGET_DB_HOST} \
  --user=${TARGET_DB_USER} --password \
  ${TARGET_DB_NAME} < dump.sql
```

## SSH 경유

```bash
ssh -i key user@host "mysqldump --user=... --password --databases dbname" > dump.sql
ssh -i key user@host "mysql --host=... --user=... --password dbname" < dump.sql
```

클라이언트: `brew install mysql-client` / `apt install mysql-client`
