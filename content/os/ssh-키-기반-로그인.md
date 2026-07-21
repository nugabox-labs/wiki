+++
title = "SSH 키 기반 로그인"
date = 2023-03-16T01:29:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER", "DEV-OPS", "TECH"]
tags = ["LINUX", "BASH", "NETWORK", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "9076246f-493f-41c0-a794-5ed81abfe650"
notion_url = "https://app.notion.com/p/SSH-9076246f493f41c0a7945ed81abfe650"
external_url = "https://myinfrabox.tistory.com/31"
+++

## 키 생성·배포

```bash
ssh-keygen -t rsa          # passphrase 비우면 자동 로그인용
ssh-copy-id user@host
# 또는 수동
scp ~/.ssh/id_rsa.pub user@host:
ssh user@host
mkdir -p ~/.ssh && chmod 700 ~/.ssh
cat id_rsa.pub >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
```

## 서버 설정

```bash
# /etc/ssh/sshd_config
PubkeyAuthentication yes
AuthorizedKeysFile .ssh/authorized_keys
systemctl restart sshd   # 또는 service sshd restart
```

## 호스트별 키 (`~/.ssh/config`)

```
Host myserver
  HostName example.com
  User myuser
  IdentityFile ~/.ssh/id_rsa_myserver
```

## 다수 호스트 (hosts + copy-id)

```bash
# /etc/hosts
# 192.168.0.100 server_1
ssh-copy-id -i ~/.ssh/id_rsa.pub user1@server_2
```

디버그: `ssh -vvv user@host`
