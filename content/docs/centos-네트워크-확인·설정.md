+++
title = "CentOS 네트워크 확인·설정"
date = 2022-03-14T04:57:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["LINUX", "NETWORK"]
toc = true

[extra]
source = "notion"
notion_id = "8390ad80-7c2b-467c-81fc-db86465a6acc"
notion_url = "https://app.notion.com/p/CentOS-8390ad807c2b467c81fcdb86465a6acc"
+++

## 현재 정보 확인

```bash
ifconfig
cat /etc/sysconfig/network-scripts/ifcfg-eth0   # 장치명: eth0/enp3s0 등 ifconfig로 확인
```

## 임시 IP 변경 (재부팅 시 소실)

```bash
ifconfig eth0 101.102.103.75 netmask 255.255.255.128 broadcast 101.102.103.127 up
```

## 영구 설정

- `/etc/sysconfig/network` — `NETWORKING` / `HOSTNAME` / `GATEWAY`
- `/etc/resolv.conf` — nameserver (KT 168.126.63.1 · Google 8.8.8.8 · Cloudflare 1.1.1.1 등)
- `/etc/sysconfig/network-scripts/ifcfg-eth0` — `DEVICE` `BOOTPROTO=static|dhcp` `IPADDR` `NETMASK`/`PREFIX` `GATEWAY` `ONBOOT=yes`

```bash
# 적용
service network restart
# 또는 systemctl restart network
```
