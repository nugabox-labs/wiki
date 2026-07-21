+++
title = "Synology NAS rsync 백업 (Ubuntu)"
date = 2022-08-20T14:47:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["SYNOLOGY", "LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "22af8a54-a2a5-4633-8f69-9e7929749038"
notion_url = "https://app.notion.com/p/Synology-NAS-rsync-Ubuntu-22af8a54a2a546338f699e7929749038"
external_url = "https://asylumsgate.wordpress.com/2014/09/06/backing-up-a-synology-nas-via-rsync-to-ubuntu/"
+++

## Ubuntu rsyncd — `/etc/rsyncd.conf`

```
max connections = 2
log file = /var/log/rsync.log
timeout = 300

[share]
comment = Public Share
path = <Full Path to Share>
read only = no
list = yes
uid = nobody
gid = nogroup
auth users = <user>
secrets file = /etc/rsyncd.secrets
```

권한: `-rw-r--r-- root root`

## `/etc/rsyncd.secrets`

```
<user>:<password>
```

권한: `-rw------- root root`

## 디렉터리 / 데몬

```bash
mkdir -p <Full Path to Share>
chmod 777 <Full Path to Share>

# /etc/xinetd.d/rsync
# disable = yes  →  disable = no
```

## 테스트

```bash
rsync rsync://<user>@<hostname>/
# share  Public Share
```

## Synology

Backup Destination / Backup Task에서 rsync 대상 지정.
