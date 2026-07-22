+++
title = "Linux Windows 공유폴더 CIFS"
date = 2021-02-01T01:58:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "10cd90d0-36c0-4b47-a989-55eae41fc960"
notion_url = "https://app.notion.com/p/Linux-Windows-CIFS-10cd90d036c04b47a98955eae41fc960"
+++

## Linux에서 Windows 공유폴더(CIFS) 마운트

관련: CIFS mount error 112

### 즉시 마운트

```bash
mount -t cifs -o vers=2.0,username=USER,password=PASS //HOST/SHARE /backup
df -h
```

### fstab (재부팅 자동 — 지연 가능·비권장)

```bash
# /etc/fstab
# //HOST/SHARE  /backup  cifs  vers=2.0,username=USER,password=PASS  0  0
mount /backup
df -h
```

### 해제

```bash
umount /backup
# Target is busy → fuser -ck /backup 또는 umount -l /backup
```
