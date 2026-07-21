+++
title = "VM 고정 IP (ifcfg-eth0)"
date = 2019-03-13T02:42:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "a890687e-f6fe-4a1f-abae-565ca11f1d90"
notion_url = "https://app.notion.com/p/VM-IP-ifcfg-eth0-a890687ef6fe4a1fabae565ca11f1d90"
+++

VirtualBox 등: 어댑터 **브릿지**.

```bash
service network stop
vi /etc/sysconfig/network-scripts/ifcfg-eth0
```

```
BOOTPROTO=static
ONBOOT=yes
IPADDR=192.168.1.39
NETMASK=255.255.255.0
GATEWAY=192.168.1.254
DNS1=8.8.8.8
```

```bash
service network restart
ping -c 2 8.8.8.8
ip a
```
