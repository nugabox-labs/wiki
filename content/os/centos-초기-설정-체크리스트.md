+++
title = "CentOS 초기 설정 체크리스트"
date = 2023-03-11T15:39:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "a587f7cc-dc58-4f61-b464-8ff6399aec02"
notion_url = "https://app.notion.com/p/CentOS-a587f7ccdc584f61b4648ff6399aec02"
+++

## CentOS 초기 시스템 설정 체크리스트

### 네트워크 (`ifcfg-eth0`)

```bash
DEVICE=eth0
BOOTPROTO=none
ONBOOT=yes
IPADDR=...
NETMASK=...
GATEWAY=...
DNS1=...
systemctl restart network   # 또는 service network restart
```

### SELinux / firewalld

```bash
# /etc/selinux/config → SELINUX=disabled
systemctl stop firewalld && systemctl disable firewalld
```

### SSH / hostname

```bash
# /etc/ssh/sshd_config → Port NNNN
systemctl restart sshd
hostnamectl set-hostname NAME   # CentOS7+
```

### 로컬 yum ISO / virbr0 / iptables / 시간동기화

→ 개별 페이지: ISO local yum, virbr0 삭제, iptables, 시간·타임존
