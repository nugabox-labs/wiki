+++
title = "디스크 용량 확인 df du"
date = 2019-04-04T07:01:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "ae076144-ade7-42ce-b454-1fb6d761d700"
notion_url = "https://app.notion.com/p/df-du-ae076144ade742ceb4541fb6d761d700"
+++

```bash
df -P

# 전체/사용/여유 합계 (KB → GB)
df -P | grep -v ^Filesystem | awk '{sum += $2} END { print sum/1024/1024 " GB" }'  # total
df -P | grep -v ^Filesystem | awk '{sum += $3} END { print sum/1024/1024 " GB" }'  # used
df -P | grep -v ^Filesystem | awk '{sum += $4} END { print sum/1024/1024 " GB" }'  # avail

DISK_TOTAL=$(df -P | grep -v ^Filesystem | awk '{sum += $2} END { print sum }')
DISK_USED=$(df -P | grep -v ^Filesystem | awk '{sum += $3} END { print sum }')
echo "$(echo "100*$DISK_USED/$DISK_TOTAL" | bc -l) %"

du -sh *   # 현재 디렉터리 하위
```
