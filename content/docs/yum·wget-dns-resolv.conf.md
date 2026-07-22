+++
title = "yum·wget DNS resolv.conf"
date = 2019-05-14T07:10:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "d70b42b2-b66d-4067-af84-9b443081d24b"
notion_url = "https://app.notion.com/p/yum-wget-DNS-resolv-conf-d70b42b2b66d4067af849b443081d24b"
+++

## yum/wget DNS 실패

네임서버가 미러를 못 찾는 경우가 많음.

```bash
vi /etc/resolv.conf
# nameserver 8.8.8.8
# nameserver 1.1.1.1
```
