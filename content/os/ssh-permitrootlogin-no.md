+++
title = "SSH PermitRootLogin no"
date = 2020-03-12T09:32:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "7b4ed06d-a3a8-4142-a1eb-f06c3bdbc925"
notion_url = "https://app.notion.com/p/SSH-PermitRootLogin-no-7b4ed06da3a84142a1ebf06c3bdbc925"
external_url = "https://jhok.kr/2016/06/25/centos-7-root-%EC%A7%81%EC%A0%91-%EC%A0%91%EC%86%8D-%EB%A7%89%EA%B8%B0/"
+++

## SSH root 직접 로그인 금지

일반 계정 먼저 생성 후:

```bash
useradd admin && passwd admin
vi /etc/ssh/sshd_config
# PermitRootLogin no
systemctl restart sshd   # 또는 service sshd restart
# 접속: ssh admin@host → su -
```
