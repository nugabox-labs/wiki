+++
title = "gcc RPM 수동 설치"
date = 2020-03-02T17:25:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "c7f13a68-ef37-4945-a0fc-b6e3f7878a10"
notion_url = "https://app.notion.com/p/gcc-RPM-c7f13a68ef374945a0fcb6e3f7878a10"
external_url = "https://nillk.tistory.com/33"
+++

## gcc RPM 수동 설치 (오프라인)

의존성 끝단부터 (`http://rpm.pbone.net/`):

```bash
rpm -Uvh kernel-headers*.rpm glibc-headers*.rpm glibc-devel*.rpm
rpm -Uvh libmpc*.rpm mpfr*.rpm libgomp*.rpm
rpm -Uvh cpp*.rpm gcc*.rpm gcc-c++*.rpm libstdc++-devel*.rpm
```
