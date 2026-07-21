+++
title = "firewalld firewall-cmd 설정"
date = 2021-07-08T09:26:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["LINUX", "NETWORK"]
toc = true

[extra]
source = "notion"
notion_id = "032fd1a8-c76d-46ab-9416-f1d743128918"
notion_url = "https://app.notion.com/p/firewalld-firewall-cmd-032fd1a8c76d46ab9416f1d743128918"
external_url = "https://www.lesstif.com/system-admin/rhel-centos-firewall-22053128.html"
+++

RHEL7+: `firewalld` / `firewall-cmd`. 설정 `/etc/firewalld/`, 기본존 `/usr/lib/firewalld/`.

```bash
# 설치·기동
sudo yum install firewalld
sudo systemctl enable --now firewalld
firewall-cmd --state

# 조회
firewall-cmd --get-zones
firewall-cmd --get-default-zone
firewall-cmd --get-active-zones
firewall-cmd --get-services
firewall-cmd --list-all
firewall-cmd --list-ports

# 서비스·포트 (영구 → reload)
firewall-cmd --permanent --zone=public --add-service=http
firewall-cmd --permanent --zone=public --add-service=https
firewall-cmd --permanent --zone=public --add-port=8080/tcp
firewall-cmd --permanent --zone=public --add-port=6000-9000/tcp
firewall-cmd --permanent --zone=public --remove-port=3306/tcp
firewall-cmd --reload

# 임시(재부팅·reload 시 소멸) — --permanent 없이
firewall-cmd --zone=public --add-port=8080/tcp

# 소스 IP / rich rule
firewall-cmd --permanent --add-source=192.168.0.0/24
firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="192.168.10.0/24" port protocol="tcp" port="9000" accept'
firewall-cmd --permanent --add-rich-rule='rule family="ipv4" source address=192.168.0.100 reject'

# 중지
# systemctl stop firewalld && systemctl disable firewalld
```
