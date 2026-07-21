+++
title = "MySQL time_zone (Asia/Seoul)"
date = "2020-02-17T01:11:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "83de46cb-3f9c-4e81-993f-545d74cddc9c"
notion_url = "https://app.notion.com/p/MySQL-time_zone-Asia-Seoul-83de46cb3f9c4e81993f545d74cddc9c"
external_url = "https://dev.mysql.com/downloads/timezones.html"
+++

## MySQL time\_zone

```sql
SELECT @@global.time_zone, @@session.time_zone;
SET GLOBAL time_zone = 'Asia/Seoul';
SET time_zone = 'Asia/Seoul';

SELECT b.name, a.time_zone_id
FROM mysql.time_zone a
JOIN mysql.time_zone_name b ON a.time_zone_id = b.time_zone_id
WHERE b.name LIKE '%Seoul%';
```

없으면 timezone 테이블 로드: [https://dev.mysql.com/downloads/timezones.html](https://dev.mysql.com/downloads/timezones.html)

```
[mysqld]
default-time-zone = Asia/Seoul
```
