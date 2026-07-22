+++
title = "SSH 접속 오류·Host key"
date = 2022-05-16T04:55:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER", "TECH"]
tags = ["LINUX", "NETWORK", "ISSUE"]
toc = true

[extra]
source = "notion"
notion_id = "25956cdb-d6af-4247-a0b2-aadcf8a97854"
notion_url = "https://app.notion.com/p/SSH-Host-key-25956cdbd6af4247a0b2aadcf8a97854"
+++

## 접속 실패 메시지별 원인

| 메시지 | 원인 |
| --- | --- |
| `No route to host` | 서버 down / IP 오타 / iptables 차단 (웹은 되는데 SSH만 안 되면 후자) |
| `Connection refused` | sshd 미기동 또는 포트 불일치 |
| `ssh_exchange_identification: Connection closed` | tcp\_wrappers (`/etc/hosts.deny`) 차단 |

1·2번은 로그가 같아 ping·다른 포트로 구분.

## Host key verification failed

```bash
ssh-keygen -R [접속IP]
```
