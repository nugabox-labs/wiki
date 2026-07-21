+++
title = "SELinux on/off"
date = 2019-04-11T08:25:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "9e989cc0-be19-40e2-9517-12dd5a8ca08d"
notion_url = "https://app.notion.com/p/SELinux-on-off-9e989cc0be1940e2951712dd5a8ca08d"
+++

## SELinux

설정: `/etc/sysconfig/selinux` (또는 `/etc/selinux/config`)

```
SELINUX=enforcing   # / permissive / disabled
```

`disabled` ↔ `enforcing` 전환은 재라벨링으로 오래 걸리거나 접속 불가할 수 있음. 부팅 전 모드를 정하고 시작할 것.

임시: `setenforce 0` (permissive). 영구는 설정 파일 + 재부팅.
