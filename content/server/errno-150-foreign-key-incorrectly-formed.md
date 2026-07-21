+++
title = "errno 150 foreign key incorrectly formed"
date = "2020-09-24T00:18:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "646f0fb2-6805-4e4c-a796-72c7bf657799"
notion_url = "https://app.notion.com/p/errno-150-foreign-key-incorrectly-formed-646f0fb268054e4ca79672c7bf657799"
+++

## errno 150: foreign key incorrectly formed

이관(restore) 시 FK가 대상 테이블 charset/collation·엔진과 안 맞을 때.

```sql
-- DB를 명시 charset으로 재생성 후 다시 import
CREATE DATABASE db_name DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
mysql -u root -p db_name < dump.sql
```

부모 행 삭제 FK 이슈는 [FK 제약으로 부모 행 삭제 실패](https://app.notion.com/p/584a0f94fb794b13b0348fa137dea358) 참고.
