+++
title = "Socket·open files 한도 (ulimit/limits.conf)"
date = 2021-03-04T14:13:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "5d58449c-b4ee-4b1d-8d26-7bc041e4aafb"
notion_url = "https://app.notion.com/p/Socket-open-files-ulimit-limits-conf-5d58449cb4ee4b1d8d267bc041e4aafb"
external_url = "https://nyangkune.tistory.com/107"
+++

> 출처: [https://nyangkune.tistory.com/107](https://nyangkune.tistory.com/107) — 소켓도 FD이므로 open files 한도 조정.

## 확인

```bash
ulimit -Sa   # soft
ulimit -Ha   # hard
```

## `/etc/security/limits.conf`

```javascript
* soft nproc unlimited
* hard nproc unlimited
* soft nofile 4096
* hard nofile 8192
```

## (선택) FD\_SETSIZE — Ubuntu glibc 헤더

```c
// /usr/include/x86_64-linux-gnu/bits/typesizes.h
#define __FD_SETSIZE 4096   // 기본 1024
```

> 헤더 수정은 재컴파일·배포 영향 큼. 보통은 limits.conf + systemd `LimitNOFILE`로 충분.
