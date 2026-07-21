+++
title = "INT overflow → 2147483647"
date = 2019-10-17T16:27:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "bde4cf24-364d-42b7-8ecb-2be820eef516"
notion_url = "https://app.notion.com/p/INT-overflow-2147483647-bde4cf24364d42b78ecb2be820eef516"
external_url = "https://zetawiki.com/wiki/MySQL%EC%97%90_2147483647_%EB%93%A4%EC%96%B4%EA%B0%80%EB%8A%94_%ED%98%84%EC%83%81"
+++

## INT 최대값 2147483647 클리핑

`INT`에 범위 초과 값을 넣으면 `2147483647`(signed INT max)로 잘림. `INT(n)` display width는 범위와 무관.

```sql
ALTER TABLE `t` CHANGE `col` `col` BIGINT NOT NULL;
```
