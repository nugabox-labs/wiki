+++
title = "Linux bin·sbin 디렉터리 차이"
date = 2023-10-19T07:22:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "TECH"]
tags = ["LINUX", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "6b4eed9a-afb4-480a-94fa-749bf7dc1e8d"
notion_url = "https://app.notion.com/p/Linux-bin-sbin-6b4eed9aafb4480a94fa749bf7dc1e8d"
external_url = "https://code-bee.tistory.com/4"
+++

## bin vs sbin

| 경로 | 역할 |
| --- | --- |
| `/bin` | 필수 user binaries (cat, chmod, chown, ps …) |
| `/sbin` | 필수 system binaries (halt, reboot, fdisk …) |
| `/usr/bin` | /bin 제외 user binaries (gcc, perl …) |
| `/usr/sbin` | 비필수 system binaries |
| `/usr/local/bin` | 패키지 매니저 비관리 binaries |
| `/usr/local/sbin` | 패키지 매니저 비관리 system binaries |

- `/sbin` 실행 권한은 보통 전 사용자 가능 — root 전용은 권장사항
- 일반 유저 PATH에 sbin 없음 → 절대경로로 실행
