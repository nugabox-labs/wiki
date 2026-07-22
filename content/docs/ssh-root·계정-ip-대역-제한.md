+++
title = "SSH root·계정 IP 대역 제한"
date = 2020-09-08T10:09:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["LINUX", "NETWORK"]
toc = true

[extra]
source = "notion"
notion_id = "a4e58d76-df5c-47fd-b566-1e868caa2fdb"
notion_url = "https://app.notion.com/p/SSH-root-IP-a4e58d76df5c47fdb5661e868caa2fdb"
+++

`/etc/ssh/sshd_config` — root(또는 특정 계정)를 지정 IP/대역에서만 허용.

## Match Address

```bash
# 전역: root 금지
PermitRootLogin no

# 파일 맨 아래 — 조건 만족 시만 허용
Match Address 192.168.0.0/24,10.0.0.5
    PermitRootLogin yes
```

## AllowUsers (간단)

```bash
AllowUsers admin root@192.168.0.* root@10.0.0.5
```

```bash
sshd -t
systemctl restart sshd   # 또는 service sshd restart
```

> Match 블록은 설정 파일 **끝**에 둔다. 적용 전 다른 세션을 열어 잠김 방지.
