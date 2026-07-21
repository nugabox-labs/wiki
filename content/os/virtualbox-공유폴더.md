+++
title = "VirtualBox 공유폴더"
date = 2019-03-19T02:42:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "1eb80cb4-e9e3-4394-af1a-451296802b0c"
notion_url = "https://app.notion.com/p/VirtualBox-1eb80cb4e9e34394af1a451296802b0c"
external_url = "https://yujoonote.tistory.com/14"
+++

## VirtualBox 공유폴더

1. Guest Additions 설치 (실패 시: `yum install gcc dkms make kernel-devel kernel-headers` + Development Tools)
1. VM 설정 → 공유 폴더 추가 (예: 이름 `share`)

```bash
mkdir -p /mnt/share
mount -t vboxsf share /mnt/share
# 영구: /etc/fstab 또는 /etc/profile
# share  /mnt/share  vboxsf  defaults  0 0
usermod -aG vboxsf $USER
```
