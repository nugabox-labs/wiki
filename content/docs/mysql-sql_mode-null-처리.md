+++
title = "MySQL sql_mode NULL 처리"
date = 2021-05-07T05:32:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["MySQL", "SQL"]
toc = true

[extra]
source = "notion"
notion_id = "e694d449-6079-44e3-ba8e-3671e7220df3"
notion_url = "https://app.notion.com/p/MySQL-sql_mode-NULL-e694d449607944e3ba8e3671e7220df3"
external_url = "https://sungwookkang.com/1326"
+++

## 증상

```
Error Code: 1366. Incorrect decimal value …
```

(LOAD DATA INFILE 시 NULL → Decimal)

## 확인

```sql
SELECT @@GLOBAL.sql_mode;
SELECT @@SESSION.sql_mode;
```

## 세션 완화

```sql
SET SESSION sql_mode = '';
```

## MySQL 5.7 기본 모드 참고

```
ONLY_FULL_GROUP_BY, STRICT_TRANS_TABLES, NO_ZERO_IN_DATE, NO_ZERO_DATE,
ERROR_FOR_DIVISION_BY_ZERO, NO_AUTO_CREATE_USER, NO_ENGINE_SUBSTITUTION
```

- 문서: [https://dev.mysql.com/doc/refman/5.7/en/sql-mode.html](https://dev.mysql.com/doc/refman/5.7/en/sql-mode.html)
