+++
title = "drop_caches 캐시 비우기"
date = "2019-10-18T08:58:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "fdc1e95e-ae3e-4591-9191-6b28166192fe"
notion_url = "https://app.notion.com/p/drop_caches-fdc1e95eae3e459191916b28166192fe"
external_url = "http://cloudsemina.com/index.php?mid=linux&document_srl=158"
+++

## drop\_caches (캐시 비우기)

```bash
sync
echo 1 > /proc/sys/vm/drop_caches   # pagecache
echo 2 > /proc/sys/vm/drop_caches   # dentries+inodes
echo 3 > /proc/sys/vm/drop_caches   # 전부
free -m
```

운영 중 상시 사용은 비권장(필요 시 일시).
