+++
title = "yum/wget DNS (resolv.conf)"
date = "2019-05-14T07:10:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "d70b42b2-b66d-4067-af84-9b443081d24b"
notion_url = "https://app.notion.com/p/yum-wget-DNS-resolv-conf-d70b42b2b66d4067af849b443081d24b"
+++

## yum/wget 접속 안 될 때

네임서버가 미러를 못 찾는 경우 많음.

```bash
vi /etc/resolv.conf
# nameserver 8.8.8.8
```
