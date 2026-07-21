+++
title = "CentOS 방화벽 (iptables/firewalld)"
date = "2019-04-03T01:02:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "b8ca9b5f-541a-46e3-9693-6e7e4d393a60"
notion_url = "https://app.notion.com/p/CentOS-iptables-firewalld-b8ca9b5f541a46e396936e7e4d393a60"
external_url = "https://www.lesstif.com/pages/viewpage.action?pageId=22053128"
+++

## CentOS 방화벽 요약

### CentOS 6 — iptables

```bash
iptables -L
# 영구: /etc/sysconfig/iptables
# -A INPUT -p tcp --dport 80 -j ACCEPT
# -A INPUT -s 192.168.0.10 -j DROP
service iptables save
service iptables stop && chkconfig iptables off
iptables -F && service iptables save
```

상세 → [iptables 포트](https://app.notion.com/p/4ba8bf0ff1314f9ca55928d397ca5499)

### CentOS 7+ — firewalld

→ [firewalld 포트 오픈](https://app.notion.com/p/f8c6e7eb7da048f8b571ca35ac0c4a4d)
