+++
title = "Ubuntu cron 미작동 MTA·postfix"
date = 2023-07-02T16:59:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "DEV-OPS", "TECH"]
tags = ["LINUX", "ISSUE", "BASH", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "e82ccf12-f010-47c4-bb95-85b59d1a1b93"
notion_url = "https://app.notion.com/p/Ubuntu-cron-MTA-postfix-e82ccf12f01047c4bb9585b59d1a1b93"
external_url = "https://blog.munilive.com/posts/ubuntu-cron-work-properly.html"
+++

## Ubuntu cron 미작동

- 로그: `/var/log/cron` 없음 → `/var/log/syslog`에서 cron 확인
- `No MTA installed, discarding output` → cron 출력 폐기(전체 영향 가능)

```bash
grep CRON /var/log/syslog
sudo apt-get install postfix
# 설치 시: No configuration 선택 가능
```
