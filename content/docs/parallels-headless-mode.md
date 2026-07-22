+++
title = "Parallels Headless mode"
date = 2022-08-06T06:48:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "TECH"]
tags = ["MACOS", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "06f1bb4d-a6bf-4e1a-8755-33168dfdcbbb"
notion_url = "https://app.notion.com/p/Parallels-Headless-mode-06f1bb4da6bf4e1a875533168dfdcbbb"
external_url = "https://kb.parallels.com/en/123298"
+++

## Parallels Desktop Headless mode (Pro)

GUI 없이 VM을 백그라운드 서비스로 실행. RDP/SSH로 접속.

### 설정 (VM Configuration)

1. **Options → Startup and Shutdown**
1. **Start Automatically** = When Mac starts
1. **Startup delay** = 초 단위 (동시 기동 부하·의존 VM 순서)
1. **On Mac Shutdown** = Suspend
1. **On Windows Close** = Keep running in background

창/앱을 닫아도 서비스·VM은 계속 동작.

### 권한

macOS **System Preferences → Security & Privacy → Privacy → Full Disk Access**에 Parallels Desktop 추가 필요.
