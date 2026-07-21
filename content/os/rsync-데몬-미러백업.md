+++
title = "rsync 데몬 미러/백업"
date = 2019-03-26T07:11:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "d45fff06-9275-4131-911b-2568a632e016"
notion_url = "https://app.notion.com/p/rsync-d45fff0692754131911b2568a632e016"
external_url = "http://theeye.pe.kr/archives/585"
+++

## rsync 데몬 미러/백업

### 파일서버 (`/etc/xinetd.d/rsync`)

`disable = no` → `service xinetd restart` (포트 873)

### `/etc/rsyncd.conf`

```
[file]
path = /home/file
comment = File server
uid = nobody
gid = nobody
use chroot = yes
read only = yes
hosts allow = 192.168.0.3
max connections = 1
timeout = 300
```

### 백업서버에서 pull

```bash
rsync -avz 192.168.0.1::file /home/backup/file1
```

증분: 재실행 시 변경분만. SSH 방식: `rsync -avz -e ssh user@host:/path/ /dest/`
