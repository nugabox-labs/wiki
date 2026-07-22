+++
title = "iptables INPUT IP 차단·허용"
date = 2021-05-10T02:50:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["LINUX", "NETWORK"]
toc = true

[extra]
source = "notion"
notion_id = "072edfcc-6363-48f8-a0ca-84601f613fa8"
notion_url = "https://app.notion.com/p/iptables-INPUT-IP-072edfcc636348f8a0ca84601f613fa8"
external_url = "https://sata.kr/entry/IPTables-2%ED%8A%B9%EC%A0%95-%EC%95%84%EC%9D%B4%ED%94%BC%EC%9D%98-%EC%B0%A8%EB%8B%A8%EA%B3%BC-%ED%97%88%EC%9A%A9-INPUT"
+++

## 구조

```bash
iptables -[A|I|D] CHAIN -s SRC -d DST -j ACCEPT|DROP
iptables -nL
iptables-save > /etc/sysconfig/iptables
```

## INPUT 예 (전체 차단 + 허용 IP)

```bash
iptables -A INPUT -s 1.1.1.1 -j ACCEPT
iptables -A INPUT -s 2.2.2.2 -j ACCEPT
iptables -A INPUT -s 3.3.3.3 -j ACCEPT
iptables -A INPUT -j DROP
iptables-save > /etc/sysconfig/iptables
```

## 설정 파일 (`/etc/sysconfig/iptables`)

```
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A INPUT -s 1.1.1.1 -j ACCEPT
-A INPUT -s 2.2.2.2 -j ACCEPT
-A INPUT -s 3.3.3.3 -j ACCEPT
-A INPUT -j DROP
```

```bash
systemctl restart iptables
```

- 위쪽 룰이 우선. 서비스 중 서버에 무턱대고 적용 금지.
