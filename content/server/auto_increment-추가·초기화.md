+++
title = "AUTO_INCREMENT 추가·초기화"
date = 2019-10-14T11:04:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "f8bc6210-4482-4699-b0c7-7541a6c9270e"
notion_url = "https://app.notion.com/p/AUTO_INCREMENT-f8bc621044824699b0c77541a6c9270e"
external_url = "https://hammer.tistory.com/entry/MYSQL-%EC%BB%AC%EB%9F%BC-%EC%9E%90%EB%8F%99%EC%A6%9D%EA%B0%80-%EC%86%8D%EC%84%B1-%EB%B3%80%EA%B2%BD-%EB%B0%8F-%EC%B6%94%EA%B0%80-%EC%B4%88%EA%B8%B0%ED%99%94-%EC%BF%BC%EB%A6%AC"
+++

## AUTO\_INCREMENT 추가·초기화

초기화만 → AUTO\_INCREMENT 초기화

```sql
-- 기존 컬럼에 AI + PK
ALTER TABLE t MODIFY id INT NOT NULL AUTO_INCREMENT PRIMARY KEY;
-- AI만
ALTER TABLE t MODIFY id INT NOT NULL AUTO_INCREMENT;
-- 카운터 리셋
ALTER TABLE t AUTO_INCREMENT = 1;
-- 신규 컬럼 (맨 앞, PK)
ALTER TABLE t ADD COLUMN id INT NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;
-- 신규 컬럼 (AI만; PK/UNIQUE 필요 시 함께)
ALTER TABLE t ADD COLUMN id INT NOT NULL AUTO_INCREMENT;
```
