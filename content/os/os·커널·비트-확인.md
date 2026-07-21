+++
title = "OS·커널·비트 확인"
date = 2019-09-16T04:25:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "19b1f0e9-7c68-46a8-b7ed-8cc3367dc3a8"
notion_url = "https://app.notion.com/p/OS-19b1f0e97c6846a8b7ed8cc3367dc3a8"
+++

## OS/커널 버전·아키텍처

```bash
cat /etc/*release*
cat /proc/version
uname -r
getconf LONG_BIT    # 32 / 64
arch                # x86_64 | i386
uname -m
echo $HOSTTYPE
lscpu | grep ^Arch
```
