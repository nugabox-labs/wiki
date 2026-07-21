+++
title = "AUTO_INCREMENT 초기화"
date = 2020-06-01T18:34:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "2f9942a1-395d-4944-95b4-476d3c6c348b"
notion_url = "https://app.notion.com/p/AUTO_INCREMENT-2f9942a1395d494495b4476d3c6c348b"
+++

> 원본이 스크린샷 이미지뿐. 주제: AUTO\_INCREMENT 초기화·재인덱싱

```sql
ALTER TABLE 테이블명 AUTO_INCREMENT = 1;
-- 기존 PK를 1부터 다시 채우려면 (주의: FK 참조 시 위험)
SET @i := 0;
UPDATE 테이블명 SET id = (@i := @i + 1) ORDER BY id;
ALTER TABLE 테이블명 AUTO_INCREMENT = 1;
```
