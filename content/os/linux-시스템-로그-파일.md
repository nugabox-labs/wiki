+++
title = "Linux 시스템 로그 파일"
date = 2022-03-16T07:58:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "148501b7-9bb2-4ae2-8e56-2525f0990c7f"
notion_url = "https://app.notion.com/p/Linux-148501b79bb24ae28e562525f0990c7f"
external_url = "https://harryp.tistory.com/880"
+++

주요 로그는 `/var/log`. systemd 환경은 `journalctl -u <unit> -e`도 함께 사용.

| 경로 | 내용 |
| --- | --- |
| `/var/log/messages` | 일반 시스템 (grep과 함께) |
| `/var/log/secure` | SSH/로그인 |
| `/var/log/maillog` | 메일 |
| `/var/log/cron` | cron |
| `/var/log/boot.log` | 데몬 기동/종료 |
| `/var/log/dmesg` | 커널 부팅 (`dmesg`) |
| `/var/log/wtmp` | 접속 이력 (`last`) |
| `/var/log/lastlog` | 사용자별 마지막 로그인 (`lastlog`) |
| `/var/log/httpd/access_log` · `error_log` | Apache |
