+++
title = "MySQL 전화번호 문자열 분리 (SUBSTRING_INDEX)"
date = 2019-10-18T15:36:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "d5f7844a-dde0-4bb7-b631-5d4b995580a4"
notion_url = "https://app.notion.com/p/MySQL-SUBSTRING_INDEX-d5f7844adde04bb7b6315d4b995580a4"
external_url = "https://pafy.tistory.com/25"
+++

```sql
SELECT
  SUBSTRING_INDEX('010-1234-5678','-',1) AS tel1,
  SUBSTRING_INDEX(SUBSTRING_INDEX('010-1234-5678','-',-2),'-',1) AS tel2,
  SUBSTRING_INDEX('010-1234-5678','-',-1) AS tel3;
-- → 010 / 1234 / 5678
```
