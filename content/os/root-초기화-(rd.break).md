+++
title = "root 초기화 (rd.break)"
date = 2020-12-18T09:51:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "ea078ddf-7381-4ee2-a32b-49a22a04f04d"
notion_url = "https://app.notion.com/p/root-rd-break-ea078ddf73814ee2a32b49a22a04f04d"
external_url = "https://bono915.tistory.com/entry/Linux-%EB%A6%AC%EB%88%85%EC%8A%A4-root-%ED%8C%A8%EC%8A%A4%EC%9B%8C%EB%93%9C-%EB%B6%84%EC%8B%A4%EC%8B%9C-%EC%9E%AC%EC%84%A4%EC%A0%95-root-%ED%8C%A8%EC%8A%A4%EC%9B%8C%EB%93%9C-%EC%B4%88%EA%B8%B0%ED%99%94-%EB%B0%A9%EB%B2%95"
+++

> 요약본 → [root 비밀번호 초기화](https://app.notion.com/p/217c7cd5c8b74e688248299c0f126dd7)

## CentOS 7 rd.break

재부팅 → GRUB에서 `e` → `linux16` 줄 끝 `rd.break` → Ctrl+X

```bash
mount -o rw,remount /sysroot
chroot /sysroot
passwd
touch /.autorelabel
exit
exit
```
