+++
title = "ISO loop 마운트"
date = 2020-03-02T19:18:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "35ea2eff-ba18-4ee8-851c-4c4c9c7773a2"
notion_url = "https://app.notion.com/p/ISO-loop-35ea2effba184ee8851c4c4c9c7773a2"
+++

## ISO 마운트

```bash
mkdir -p /mnt/iso
mount -o loop /path/to/image.iso /mnt/iso
ls /mnt/iso
umount /mnt/iso
```
