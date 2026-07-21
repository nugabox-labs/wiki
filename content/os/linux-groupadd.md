+++
title = "Linux groupadd"
date = 2021-05-10T02:48:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "DEV-OPS", "TECH"]
tags = ["LINUX", "BASH", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "291886b2-b9e0-48eb-9041-563e95450637"
notion_url = "https://app.notion.com/p/Linux-groupadd-291886b2b9e048eb9041563e95450637"
external_url = "https://webdir.tistory.com/134"
+++

> 원본 스크린샷뿐 → 표준 명령으로 재구성.

## groupadd

```bash
groupadd groupname
groupadd -g 1001 groupname      # GID 지정
groupdel groupname

cat /etc/group
getent group groupname
id <user>

usermod -aG groupname <user>
gpasswd -a <user> groupname
```
