+++
title = "VMware Workstation VM 실습"
date = 2025-02-24T01:34:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER", "TECH"]
tags = ["WINDOWS", "LINUX", "NETWORK", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "626736e9-7dae-4b71-94d9-23932791f682"
notion_url = "https://app.notion.com/p/VMware-Workstation-VM-626736e97dae4b7194d923932791f682"
external_url = "https://velog.io/@num_of_techbytes/VMware-workstation-%EC%8B%A4%EC%8A%B5"
+++

## VMware Workstation VM 실습 요약

### 새 VM (Custom)

1. Create a New Virtual Machine → Custom
1. Hardware compatibility: 협업 시 팀 최저 버전
1. Install OS later → Guest: Linux / CentOS 7 64-bit (또는 Rocky)
1. CPU/코어·메모리·Network·I/O·Disk 타입·용량 지정
1. CD/DVD → Use ISO image file
1. 불필요 device 제거 후 Finish → Power on → OS 설치(root/유저)

### Clone

- Full Clone: 완전 독립 복사
- Linked Clone: 공유 디스크(공간 절약)

### CentOS 네트워크

```bash
vi /etc/sysconfig/network-scripts/ifcfg-ens33
# TYPE=Ethernet
# BOOTPROTO=static   # DHCP면 dhcp
# NAME=ens33 / DEVICE=ens33 / ONBOOT=yes
# IPADDR= / PREFIX=24 또는 NETMASK=
# GATEWAY= / DNS1= / DNS2=
systemctl restart network

# SELinux 영구 off
vi /etc/selinux/config   # SELINUX=disabled
```

### Rocky 9 (nmcli)

```bash
nmcli con show
nmcli con mod ens160 ipv4.method manual \
  ipv4.address 10.0.0.11/24 \
  ipv4.gateway 10.0.0.254 \
  ipv4.dns "8.8.8.8" \
  connection.autoconnect yes
systemctl restart NetworkManager
# 필요 시 reboot
ping google.com
```
