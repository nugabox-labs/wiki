+++
title = "CIFS mount error 112 Host is down"
date = 2021-01-27T15:12:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "a650b551-3487-4d8e-8a48-322a2b7ac881"
notion_url = "https://app.notion.com/p/CIFS-mount-error-112-Host-is-down-a650b55134874d8e8a48322a2b7ac881"
external_url = "https://likeabutterfly.tistory.com/41"
+++

SMB 버전 불일치 → `vers=` 지정:

```bash
mount -t cifs -o vers=2.0,username=USER,password=PASS //server/share /mnt/point

# /etc/fstab
# //server/share /mnt/point cifs vers=2.0,username=USER,password=PASS 0 0
```
