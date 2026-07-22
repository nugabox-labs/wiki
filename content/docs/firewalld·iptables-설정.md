+++
title = "Firewalld·iptables 설정"
date = 2021-07-28T02:12:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["LINUX", "NETWORK"]
toc = true

[extra]
source = "notion"
notion_id = "adb57d7c-03c6-411e-b83f-9469486a272d"
notion_url = "https://app.notion.com/p/Firewalld-iptables-adb57d7c03c6411eb83f9469486a272d"
+++

## Firewalld

```bash
yum install -y firewalld
systemctl enable --now firewalld
firewall-cmd --state
```

### 서비스·포트·소스

```bash
firewall-cmd --permanent --add-service=http
firewall-cmd --permanent --add-service=https
firewall-cmd --permanent --add-port=80/tcp
firewall-cmd --permanent --add-port=443/tcp
firewall-cmd --permanent --add-port=6000-9000/tcp
firewall-cmd --permanent --add-source=192.168.0.100
firewall-cmd --permanent --add-source=192.168.0.0/24
# remove 시 add → remove
```

### rich rule

```bash
# reject=피드백 / drop=무응답
firewall-cmd --permanent --add-rich-rule='rule family="ipv4" source address=192.168.0.100 reject'
firewall-cmd --permanent --add-rich-rule='rule family="ipv4" source address=192.168.0.100 drop'
firewall-cmd --permanent --add-rich-rule='rule family="ipv4" source address=192.168.0.0/24 port port="8000" protocol="tcp" accept'

firewall-cmd --reload
firewall-cmd --list-all
```

## iptables (CentOS 7: firewalld 중지 후)

```bash
systemctl stop firewalld && systemctl disable firewalld && systemctl mask firewalld
yum install -y iptables-services
systemctl enable --now iptables

iptables -A INPUT -p tcp --dport <port> -j ACCEPT
systemctl restart iptables   # 또는 service iptables restart
iptables -nL
```

설정도 `/etc/sysconfig/iptables`에 기록 가능.
