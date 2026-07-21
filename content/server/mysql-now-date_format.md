+++
title = "MySQL NOW / DATE_FORMAT"
date = 2020-03-26T13:25:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "de267d86-cb3f-487e-b704-063da85ec7ff"
notion_url = "https://app.notion.com/p/MySQL-NOW-DATE_FORMAT-de267d86cb3f487eb704063da85ec7ff"
+++

> 원본이 스크린샷 이미지뿐. 주제: NOW / DATE\_FORMAT

```sql
SELECT NOW();
SELECT CURDATE(), CURTIME();
SELECT DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s');
SELECT DATE_FORMAT(NOW(), '%Y년 %m월 %d일');
-- 간격
SELECT DATE_ADD(NOW(), INTERVAL 1 DAY);
SELECT DATE_SUB(NOW(), INTERVAL 1 HOUR);
```
