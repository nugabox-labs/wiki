+++
title = "Linux cron 작업 예약"
date = 2022-04-24T09:17:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "DEV-OPS", "TECH"]
tags = ["LINUX", "BASH", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "3b71515b-3c7c-4192-bd26-d78b98e860ca"
notion_url = "https://app.notion.com/p/Linux-cron-3b71515b3c7c4192bd26d78b98e860ca"
external_url = "https://webdir.tistory.com/174"
+++

## crontab 위치

- `/var/spool/cron` — 사용자별 (`crontab -e`)
- `/etc/crontab`, `/etc/cron.d` — 시스템 (user-name 필드 필요)

## 명령

```bash
crontab -l          # 목록
crontab -e          # 편집
crontab -r          # 삭제
crontab -u user -e  # root가 타 사용자 편집
```

## 형식 (분 시 일 월 요일 \[user\] 명령)

```
# /etc/crontab 예: 매일 05:00 시각 동기화
0 5 * * * root /usr/bin/rdate -s time.bora.net && /sbin/hwclock -w

# 월~금 10:05, 10:45
5,45 10 * * 1-5 root /usr/bin/rdate -s time.bora.net && clock -w
```

## 접근 제어

- `/etc/cron.allow` 있으면 목록 사용자만
- 없으면 `/etc/cron.deny` 제외 나머지 허용

> 예제 중심: crontab 예제·로깅
