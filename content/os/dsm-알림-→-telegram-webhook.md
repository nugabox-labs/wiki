+++
title = "DSM 알림 → Telegram Webhook"
date = 2024-03-14T00:06:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER", "TECH"]
tags = ["SYNOLOGY", "TIP", "NETWORK"]
toc = true

[extra]
source = "notion"
notion_id = "9e601453-cefb-423a-8d53-acca25e11e66"
notion_url = "https://app.notion.com/p/DSM-Telegram-Webhook-9e601453cefb423a8d53acca25e11e66"
external_url = "https://www.hlog.io/synology-nas-telegram-notification"
+++

본문에 실제 토큰 없음(플레이스홀더만). BotFather 토큰은 시크릿으로 관리.

## Webhook URL

```
https://api.telegram.org/bot<API_TOKEN>/sendMessage?chat_id=<CHAT_ID>&text=HelloWorld
```

## DSM

제어판 → 알림 → Webhook 추가

- Provider: 사용자 지정
- Rule: All / Warning / Critical
- 공급자 이름: Telegram
- Webhook URL: 위 형식 (`API_TOKEN`, `CHAT_ID` 치환)

테스트 메시지 전송으로 확인.
