+++
title = "Linux Socket·open files 개수 조정"
date = 2021-03-04T07:40:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "afe8b35a-7d68-48b0-9a58-5675c993d629"
notion_url = "https://app.notion.com/p/Linux-Socket-open-files-afe8b35a7d6848b09a585675c993d629"
external_url = "https://nyangkune.tistory.com/107"
+++

> 리눅스는 소켓도 파일(FD)로 취급. open files 한계를 올려 동시 소켓을 늘린다.

## 현재 한도

```bash
ulimit -Sa    # soft
ulimit -Ha    # hard
```

## `/etc/security/limits.conf`

```
* soft nproc unlimited
* hard nproc unlimited
* soft nofile 4096
* hard nofile 8192
```

## FD\_SETSIZE (선택, 소스 재빌드 시)

`/usr/include/x86_64-linux-gnu/bits/typesizes.h` (배포판별 경로 상이):

```c
#define __FD_SETSIZE 4096
```

재로그인·서비스 재시작 후 `ulimit -n`으로 확인. 헤더 수정은 재컴파일 영향 큼 — 보통은 limits.conf + systemd `LimitNOFILE`로 충분.

> 관련: 리눅스 ulimit 확인·설정
