+++
title = "iptables 개념·명령어 요약"
date = 2021-05-10T02:49:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["LINUX", "NETWORK"]
toc = true

[extra]
source = "notion"
notion_id = "903d8c15-6481-4611-a787-bc615ee83190"
notion_url = "https://app.notion.com/p/iptables-903d8c1564814611a787bc615ee83190"
external_url = "https://linuxstory1.tistory.com/entry/iptables-기본-명령어-및-옵션-명령어"
+++

실무 포트 조작 → iptables 포트 열기/닫기 · CentOS 방화벽

## Chain

- `INPUT` 수신 / `OUTPUT` 송신 / `FORWARD` 경유(NAT)

## 기본

```bash
iptables -P INPUT ACCEPT
iptables -L -n -v
iptables -F                 # 규칙 전부
service iptables save       # → /etc/sysconfig/iptables
```

## 규칙 형식

```bash
iptables -A INPUT -s SRC [--sport N] -d DST [--dport N] -p PROTO -j ACCEPT|DROP
iptables -D INPUT 1         # 번호로 삭제
iptables -I INPUT -p tcp --dport 80 -j ACCEPT   # 맨 앞 삽입
```

## 예

```bash
iptables -A INPUT -s 192.168.0.111 -j DROP
iptables -A INPUT -p icmp -s 127.0.0.1 -j DROP
iptables -A INPUT -p tcp --dport 23 -j DROP
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j ACCEPT   # 허용을 DROP보다 앞에
```

규칙은 위에서 아래로 매칭 — 허용을 거부보다 먼저.
