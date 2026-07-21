+++
title = "iptables 포트 열기·닫기"
date = 2019-11-18T11:03:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["LINUX", "NETWORK"]
toc = true

[extra]
source = "notion"
notion_id = "4ba8bf0f-f131-4f9c-a559-28d397ca5499"
notion_url = "https://app.notion.com/p/iptables-4ba8bf0ff1314f9ca55928d397ca5499"
external_url = "http://blog.naver.com/PostView.nhn?blogId=djawlgo0906&logNo=220765170977"
+++

## iptables (CentOS 6 등)

```bash
nmap -p PORT HOST

iptables -A INPUT -p tcp --dport 22 -j ACCEPT    # ssh
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -A INPUT -p tcp --dport 20 -j ACCEPT    # ftp
iptables -A INPUT -p tcp --dport 21 -j ACCEPT
iptables -A INPUT -p tcp --dport PORT -j DROP

service iptables save
service iptables restart
```

CentOS 7+ → firewalld firewall-cmd 설정
