+++
title = "root 비밀번호 초기화"
date = 2019-03-18T01:12:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "217c7cd5-c8b7-4e68-8248-299c0f126dd7"
notion_url = "https://app.notion.com/p/root-217c7cd5c8b74e688248299c0f126dd7"
+++

## root 비밀번호 초기화 (재부팅 필요)

서비스 중단·백업 후 진행.

### CentOS 6 — single

부팅 메뉴 `e` → kernel 줄 끝에 `single` → `b` → `passwd`

### CentOS 7 — rd.break (권장)

```bash
# GRUB e → linux16 줄 끝에
rd.break
# Ctrl+X
mount -o rw,remount /sysroot
chroot /sysroot
passwd
touch /.autorelabel
exit; exit
```

### CentOS 7 — init=/bin/bash

`ro`→`rw`, `rhgb quiet`→`init=/bin/bash` → Ctrl+X → `passwd` → `touch /.autorelabel` → `exec /sbin/init`

### Ubuntu

Shift → Advanced → recovery → root shell

```bash
mount -o remount,rw /
passwd root
```

상세 스크린샷 클리핑 → rd.break 상세(중복)
