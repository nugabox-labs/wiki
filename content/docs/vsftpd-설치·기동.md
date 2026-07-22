+++
title = "vsftpd 설치·기동"
date = 2019-04-03T00:38:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["LINUX", "NETWORK"]
toc = true

[extra]
source = "notion"
notion_id = "66f371e2-099f-459b-aee1-6be534f600e6"
notion_url = "https://app.notion.com/p/vsftpd-66f371e2099f459baee16be534f600e6"
+++

## vsftpd (CentOS)

```bash
yum install vsftpd
/etc/rc.d/init.d/vsftpd start   # 또는 systemctl start vsftpd
netstat -atunp | grep vsftpd
```
