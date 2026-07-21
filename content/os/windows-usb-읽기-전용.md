+++
title = "Windows USB 읽기 전용"
date = 2026-03-09T08:30:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "TECH"]
tags = ["WINDOWS", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "756a1e9d-0037-4650-8aba-82b9c81a2e44"
notion_url = "https://app.notion.com/p/Windows-USB-756a1e9d003746508aba82b9c81a2e44"
external_url = "https://servermon.tistory.com/179"
+++

## 읽기 전용 설정

```shell
diskpart
list vol
select volume <N>
attributes volume set readonly
```

## 해제

```shell
diskpart
list vol
select volume <N>
attributes volume clear readonly
```

쓰기 시 "디스크가 쓰기 금지"면 설정 확인.
