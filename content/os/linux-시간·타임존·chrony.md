+++
title = "Linux 시간·타임존·chrony"
date = 2020-05-29T09:36:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "0eae6051-63a5-4f46-9025-22f0ba88dcc9"
notion_url = "https://app.notion.com/p/Linux-chrony-0eae605163a54f46902522f0ba88dcc9"
external_url = "https://itspecialist.tistory.com/5"
+++

## CentOS 시간·타임존

```bash
clock          # H/W
date           # System
date MMDDhhmmYYYY.ss
clock -w       # System → H/W
rdate -s time.bora.net
echo 'rdate -s time.bora.net' >> /etc/rc.d/rc.local
ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime
# CentOS 7+
timedatectl set-timezone Asia/Seoul
chronyc tracking   # chrony
```
