+++
title = "계정 간 폴더 공유 setgid"
date = 2022-10-12T10:51:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "8aca3c8e-e816-47b5-9c5f-868a04d0b3f1"
notion_url = "https://app.notion.com/p/setgid-8aca3c8ee81647b59c5f868a04d0b3f1"
external_url = "https://ellordnet.tistory.com/209"
+++

## 계정 간 폴더 공유 setgid

```bash
groupadd mygroup
usermod -a -G mygroup user1
usermod -a -G mygroup user2
chgrp -R mygroup /path/share
chmod -R 2775 /path/share          # setgid로 하위도 그룹 유지
# FTP chroot 시 bind mount
mkdir ~/share
mount --bind /path/share ~/share   # 재부팅 시 해제 → fstab 등록 필요
# SELinux + vsftpd
setsebool -P allow_ftpd_full_access 1
```
