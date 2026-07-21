+++
title = "SSH 키 로그인"
date = "2022-07-10T15:28:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "28a55ea3-e577-4431-8843-3733f6a8b1f5"
notion_url = "https://app.notion.com/p/SSH-28a55ea3e577443188433733f6a8b1f5"
external_url = "https://hbase.tistory.com/9"
+++

## SSH 키 로그인

```bash
ssh-keygen -t rsa          # passphrase 비우면 자동 로그인용
# 공개키 → 서버
ssh-copy-id user@host
# 또는
scp ~/.ssh/id_rsa.pub user@host:
ssh user@host
mkdir -p ~/.ssh && chmod 700 ~/.ssh
cat id_rsa.pub >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
```

호스트별 키 (`~/.ssh/config`):

```javascript
Host myserver
  HostName example.com
  User myuser
  IdentityFile ~/.ssh/id_rsa_myserver
```

디버그: `ssh -vvv user@host`
