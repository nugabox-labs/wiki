+++
title = "yum mirrorlist 실패 네트워크·DNS"
date = 2020-08-25T07:00:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "6f4c2993-7dad-4169-a951-1827bf2111f8"
notion_url = "https://app.notion.com/p/yum-mirrorlist-DNS-6f4c29937dad4169a9511827bf2111f8"
+++

## yum mirrorlist 조회 실패

```javascript
Could not retrieve mirrorlist http://mirrorlist.centos.org/...
```

대개 **인터넷/게이트웨이/DNS** 문제.

```bash
ip addr; route -n; cat /etc/resolv.conf
# DNS 예: nameserver 8.8.8.8
ping -c1 8.8.8.8
```

→ yum/wget DNS / CentOS6 EOL → vault mirror
