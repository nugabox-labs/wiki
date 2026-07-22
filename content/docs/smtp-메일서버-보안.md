+++
title = "SMTP 메일서버 보안"
date = 2023-03-11T14:18:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["SYNOLOGY", "NETWORK"]
toc = true

[extra]
source = "notion"
notion_id = "66489975-83e3-4101-94d4-2de77ef9cd4d"
notion_url = "https://app.notion.com/p/SMTP-6648997583e3410194d42de77ef9cd4d"
external_url = "https://www.kkoc.org/?p=488"
+++

## Synology MailPlus / 계정 보호

- 제어판 → 보안 → 계정: 자동 차단 (예: 실패 10회 / 3분)

## SMTP 보안 조치

- SMTP `25` → 다른 포트로 변경
- 비암호화 IMAP/POP3 비활성화
- **암호화되지 않은 연결의 일반 텍스트 인증 금지** 활성화

## 모니터링

- 위젯에 최근 로그 추가
- 다수 IP·다수 계정 브루트포스 패턴 주의
