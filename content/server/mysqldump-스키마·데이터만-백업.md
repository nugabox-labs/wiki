+++
title = "mysqldump 스키마·데이터만 백업"
date = 2021-10-02T04:22:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "DEV-OPS"]
tags = ["DB", "MySQL", "BASH"]
toc = true

[extra]
source = "notion"
notion_id = "7829444a-b4d0-4d78-a432-81cd34d98d14"
notion_url = "https://app.notion.com/p/mysqldump-7829444ab4d04d78a43281cd34d98d14"
external_url = "https://bluebreeze.co.kr/462"
+++

## 스키마만

```bash
mysqldump -u USER -p --no-data DBNAME > schema.sql
```

## 데이터만

```bash
mysqldump -u USER -p --no-create-info DBNAME > data.sql
```

## 단일 테이블

```bash
mysqldump -u USER -p --no-data DBNAME TABLE > table_schema.sql
mysqldump -u USER -p --no-create-info DBNAME TABLE > table_data.sql
```
