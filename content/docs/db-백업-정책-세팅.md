+++
title = "DB 백업 정책 세팅"
date = 2023-03-11T15:36:00Z
updated = 2026-07-22T01:31:00Z
categories = ["SERVER", "TECH"]
tags = ["Oracle", "MySQL", "DB", "SQL", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "2ce5ded1-d87e-4a8e-984c-9c19337a4661"
notion_url = "https://app.notion.com/p/DB-2ce5ded1d87e4a8e984c9c19337a4661"
+++

```bash
# Oracle Data Pump
expdp system/<PASSWORD> dumpfile=FULLDMP.dmp directory=dpump_dir logfile=expdp_FULLDMP.log full=y
expdp system/<PASSWORD> dumpfile=MUNHWA.dmp directory=dpump_dir logfile=expdp_MUNHWA.log schemas=MUNHWA

# MySQL 단일 DB
mysqldump \
  --user=root --password \
  --compact --extended-insert --quick --hex-blob \
  --single-transaction \
  --events --routines --triggers \
  --databases jnagrinetdb > 20200921_jnagrinetdb.sql

# MySQL 전체
mysqldump \
  --user=root --password \
  --compact --extended-insert --quick --hex-blob \
  --single-transaction \
  --events --routines --triggers \
  --all-databases > 20200921_all.sql
```
