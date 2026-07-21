+++
title = "MySQL pid-file 경로 변경"
date = "2020-06-25T09:08:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "1264d873-7990-4f46-aa2c-4bac30fe47ab"
notion_url = "https://app.notion.com/p/MySQL-pid-file-1264d87379904f46aa2c4bac30fe47ab"
external_url = "https://systemv.tistory.com/40"
+++

## pid-file 경로 변경

mysql.server로 기동 시 **`[mysqld]`****와 ****`[mysqld_safe]`**** 둘 다** 동일 설정:

```
[mysqld]
pid-file=/path/to/mysql.pid

[mysqld_safe]
pid-file=/path/to/mysql.pid
```

미지정 시 기본은 `datadir/hostname.pid`.

```sql
SHOW GLOBAL VARIABLES LIKE '%pid%';
```
