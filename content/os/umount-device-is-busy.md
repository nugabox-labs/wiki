+++
title = "umount device is busy"
date = 2020-03-02T19:00:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "368fbc86-a975-4209-9f6f-0e13636826db"
notion_url = "https://app.notion.com/p/umount-device-is-busy-368fbc86a97542099f6f0e13636826db"
+++

## umount: device is busy

```bash
lsof +f -- /mnt/point
fuser -vm /mnt/point
fuser -km /mnt/point          # 사용 프로세스 kill
umount /mnt/point
# 안 되면 lazy
umount -l /mnt/point
```
