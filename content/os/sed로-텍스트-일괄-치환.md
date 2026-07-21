+++
title = "sed로 텍스트 일괄 치환"
date = 2021-02-09T09:56:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "2b9f5da7-a9e7-4eb2-9b98-d3a526c8f792"
notion_url = "https://app.notion.com/p/sed-2b9f5da7a9e74eb29b98d3a526c8f792"
external_url = "https://goateedev.tistory.com/106"
+++

> 출처: [https://goateedev.tistory.com/106](https://goateedev.tistory.com/106)

```bash
sed -i 's/original/new/g' file.txt
```

| 옵션 | 의미 |
| --- | --- |
| `-i` | 원본 파일에 바로 저장 |
| `s` | substitute |
| `g` | 줄 내 전부 치환 |
