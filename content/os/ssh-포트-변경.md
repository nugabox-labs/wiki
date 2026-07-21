+++
title = "SSH 포트 변경"
date = 2020-03-09T17:32:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "20b3767c-7661-4552-b977-6787d0af1b32"
notion_url = "https://app.notion.com/p/SSH-20b3767c76614552b9776787d0af1b32"
external_url = "https://www.lesstif.com/pages/viewpage.action?pageId=20776114"
+++

## SSH 포트 변경

```javascript
# /etc/ssh/sshd_config
# Port 22
Port 10022
```

```bash
systemctl restart sshd   # 또는 service sshd restart
# 방화벽도 새 포트 오픈 (firewalld/iptables)

# SELinux (RHEL/CentOS)
semanage port -a -t ssh_port_t -p tcp 10022

# 클라이언트
ssh -p 10022 user@host
# ~/.ssh/config
# Host myserver
#   HostName example.com
#   Port 10022
```
