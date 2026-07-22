+++
title = "macOS Ventura SSH ssh-rsa 호스트키 오류"
date = 2023-01-26T08:53:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER", "DEV-OPS", "TECH"]
tags = ["MACOS", "ISSUE", "NETWORK", "BASH"]
toc = true

[extra]
source = "notion"
notion_id = "4867a314-010d-4fbc-8cc2-1789b55198b7"
notion_url = "https://app.notion.com/p/macOS-Ventura-SSH-ssh-rsa-4867a314010d4fbc8cc21789b55198b7"
external_url = "https://ngela.tistory.com/84"
+++

## 증상

`Unable to negotiate ... no matching host key type found. Their offer: ssh-rsa,ssh-dss`

## 조치

`/etc/ssh/ssh_config`에서 구형 Cipher/MAC 줄 제거 후 추가:

```bash
HostkeyAlgorithms ssh-dss,ssh-rsa
KexAlgorithms +diffie-hellman-group1-sha1
```

```bash
rm ~/.ssh/known_hosts
ssh user@remote.server.com
```
