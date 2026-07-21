+++
title = "MySQL 8→5.7 dump collation 오류"
date = 2020-09-07T15:21:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "d6512a99-01f7-4ed1-b935-3d4a7831d354"
notion_url = "https://app.notion.com/p/MySQL-8-5-7-dump-collation-d6512a9901f74ed1b9353d4a7831d354"
external_url = "https://developmoments.tistory.com/55"
+++

## 증상

```
ERROR 1273 (HY000): Unknown collation: 'utf8mb4_0900_ai_ci'
```

MySQL 8 기본 collation을 5.7이 모름.

## 해결

1. dump SQL에서 `utf8mb4_0900_ai_ci` → `utf8mb4_general_ci` (또는 `utf8mb4_unicode_ci`) 일괄 치환
1. 대상 DB 생성 시 charset 명시:

```sql
CREATE DATABASE cloud_db DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
```

## dump / restore

```bash
mysqldump -u root -p cloud_db > backup.sql
mysql -u root -p cloud_db < backup.sql
```
