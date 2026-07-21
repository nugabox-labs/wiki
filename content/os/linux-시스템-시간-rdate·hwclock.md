+++
title = "Linux 시스템 시간 rdate·hwclock"
date = 2020-03-26T13:25:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "081da492-d3e5-4566-be48-bc219d1668c1"
notion_url = "https://app.notion.com/p/Linux-rdate-hwclock-081da492d3e54566be48bc219d1668c1"
external_url = "http://faq.hostway.co.kr/?mid=Linux_ETC&page=10&document_srl=1354"
+++

## 시각 확인

```bash
date
hwclock --show   # 또는 -r
```

## 타임서버 동기화

```bash
# rdate
rdate -s time.bora.net
# 수동
date -s '2008-04-10 18:47:30'

# 시스템 시각 → H/W clock
hwclock --systohc   # 또는 -w / clock -w

# 한 줄
rdate -s time.bora.net && hwclock --systohc
```

타임서버 예: `time.bora.net`, `time.nuri.net`, `time.kriss.re.kr`

## crontab (매일 00:01)

```bash
01 00 * * * rdate -s time.kriss.re.kr && /sbin/clock -w
```

## 부팅 시 H/W → 시스템

`/etc/rc.d/rc.sysinit`에서:

```bash
#/sbin/hwclock $CLOCKFLAGS
/sbin/hwclock --hctosys
```

안 되면 `/etc/rc.d/rc.local` 상단에 `/sbin/hwclock --hctosys` 추가.
