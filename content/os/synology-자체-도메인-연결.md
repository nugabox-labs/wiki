+++
title = "Synology 자체 도메인 연결"
date = 2019-09-30T06:46:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["SYNOLOGY", "NETWORK"]
toc = true

[extra]
source = "notion"
notion_id = "6ea53be4-f2aa-4361-81dd-eb9587b56a95"
notion_url = "https://app.notion.com/p/Synology-6ea53be4f2aa436181ddeb9587b56a95"
external_url = "https://app.notion.com/p/688473cdfd374f0f8de24d3b1b1e0edf"
+++

> Synology 자체 도메인 연결 체크리스트

1. 공유기: 80/443 (+ DSM 5000/5001) 포트포워딩
1. DNS: A레코드 → 공인 IP (CNAME은 `*.synology.me` 등 DDNS 시)
1. DSM 제어판 → 외부 액세스 → 고급 → 호스트 이름에 도메인
1. **사용자 지정 도메인 활성화**: 80/443이 열린 IP에서만 — 도메인→DSM 리다이렉트, 직접 5000/5001은 막힐 수 있음
1. 응용 프로그램 포털: 앱별 도메인/서브도메인 (네임서버에 서브도메인 선행)
1. SSL: Let's Encrypt 인증서 발급 후 적용
