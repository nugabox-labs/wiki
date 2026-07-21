+++
title = "SSH 방화벽 포트 22 허용"
date = 2019-03-26T07:16:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["NETWORK"]
toc = true

[extra]
source = "notion"
notion_id = "d4b31ddc-9713-4a72-93bb-b9cfbd7fc3be"
notion_url = "https://app.notion.com/p/SSH-22-d4b31ddc97134a7293bbb9cfbd7fc3be"
external_url = "https://blog.inidog.com/p/201808031462"
+++

방화벽 종류에 맞는 명령을 root로 실행.

```bash
# iptables
iptables -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT

# firewalld (CentOS 7+)
firewall-cmd --zone=public --add-port=22/tcp --permanent
firewall-cmd --reload

# ufw (Ubuntu)
ufw allow 22/tcp
```
