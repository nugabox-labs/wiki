+++
title = "Ubuntu 설치·네트워크·SSH"
date = 2021-06-17T00:37:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["LINUX", "NETWORK"]
toc = true

[extra]
source = "notion"
notion_id = "385ce940-c2b7-448b-a7f7-e570bda90642"
notion_url = "https://app.notion.com/p/Ubuntu-SSH-385ce940c2b7448ba7f7e570bda90642"
+++

## root 비밀번호

```bash
sudo passwd root
```

## 네트워크 (`/etc/network/interfaces`)

```bash
ifconfig
sudo vi /etc/network/interfaces
```

```
auto eth0
iface eth0 inet static
address 192.168.0.20
netmask 255.255.255.0
gateway 192.168.1.254
dns-nameservers 168.126.63.1 168.126.63.2 8.8.8.8
```

## apt 미러 (kr → us)

```bash
sudo vi /etc/apt/sources.list
# vim: :%s/kr\./us./g
sudo apt update
```

## 필수 유틸·SSH

```bash
sudo apt install net-tools vim
dpkg -l | grep openssh-server
sudo apt-get install openssh-server
sudo service ssh start
```

## root SSH 허용

```bash
sudo vi /etc/ssh/sshd_config
# PermitRootLogin yes
sudo service ssh restart
```
