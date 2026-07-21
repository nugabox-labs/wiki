+++
title = "Linux USB 마운트"
date = 2019-09-26T07:51:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "a377d120-68ae-45d0-a9af-14b5ec418d1d"
notion_url = "https://app.notion.com/p/Linux-USB-a377d12068ae45d0a9af14b5ec418d1d"
+++

```bash
fdisk -l                 # USB 장치 확인 (예: /dev/sdb1)
mkdir -p /mnt/usb
mount /dev/sdb1 /mnt/usb
umount /mnt/usb          # 또는 umount /dev/sdb1
```
