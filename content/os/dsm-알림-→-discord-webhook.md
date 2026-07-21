+++
title = "DSM 알림 → Discord Webhook"
date = 2024-03-14T00:06:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER", "TECH"]
tags = ["SYNOLOGY", "TIP", "NETWORK"]
toc = true

[extra]
source = "notion"
notion_id = "cf23236a-d6a2-4f30-b332-c0115f7d669d"
notion_url = "https://app.notion.com/p/DSM-Discord-Webhook-cf23236ad6a24f30b332c0115f7d669d"
external_url = "https://svrforum.com/nas/1028916"
+++

DSM 7.2+ 기준. 웹훅 URL은 유출 금지.

## Discord

1. 채널 설정 → Integrations → Webhooks → New Webhook → Copy URL
1. 형식: `https://discord.com/api/webhooks/<id>/<token>`

## DSM

제어판 → 알림 → Webhook → Add

- Provider: **Custom**
- Rule: All / Warning / Critical / Custom
- Webhook URL: 복사한 URL
- HTTP Method: **POST**
- Content-Type: **application/json**
- Body 키: `"text"` → **`"content"`** 로 변경
- Subject에 `%HOSTNAME%`, `%DATE%`, `%TIME%` 등 변수 사용 가능

테스트: Send Test Message
