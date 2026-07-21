+++
title = "CentOS 포트·방화벽 확인"
date = 2019-11-18T18:18:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["LINUX", "NETWORK"]
toc = true

[extra]
source = "notion"
notion_id = "ec8fdf49-181d-4231-b896-702713954675"
notion_url = "https://app.notion.com/p/CentOS-ec8fdf49181d4231b896702713954675"
+++

## 포트 리스닝 확인

```bash
netstat -tunlp | grep <port>
ss -tunlp | grep <port>
lsof -i :<port>
```

## 원격 포트 접속 테스트

```bash
telnet <host> <port>
nc -zv <host> <port>
```

## firewalld

```bash
sudo firewall-cmd --list-all
sudo firewall-cmd --add-port=<port>/tcp --permanent
sudo firewall-cmd --reload
```

## iptables (구형)

```bash
sudo iptables -L -n
sudo iptables -I INPUT -p tcp --dport <port> -j ACCEPT
sudo service iptables save
```
