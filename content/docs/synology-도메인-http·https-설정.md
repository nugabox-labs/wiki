+++
title = "Synology 도메인 HTTP·HTTPS 설정"
date = 2020-05-26T06:50:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["SYNOLOGY"]
toc = true

[extra]
source = "notion"
notion_id = "688473cd-fd37-4f0f-8de2-4d3b1b1e0edf"
notion_url = "https://app.notion.com/p/Synology-HTTP-HTTPS-688473cdfd374f0f8de24d3b1b1e0edf"
external_url = "https://app.notion.com/p/7bef2282c6734aa1854e233b492b8067"
+++

DSM HTTP 기본 5000 / HTTPS 기본 5001

## HTTP

1. **QuickConnect** — 제어판 → QuickConnect (비상 접속)
1. **Synology DDNS** — 외부 액세스 → DDNS
1. **DNS** — A(공인 IP) 또는 CNAME(DDNS URL)로 서브도메인 등록
1. **공유기** — 외부 80 → NAS:80
1. **DSM** — 네트워크 → DSM 설정 → 사용자 지정 도메인
1. **앱 도메인** — 응용프로그램 포털 → 각 앱 사용자 지정 도메인

접속 확인: QuickConnect / [synology.me](http://synology.me/) / DDNS:5000 / LAN:5000 / 지정 도메인

## HTTPS

1. DNS에 사용할 서브도메인 미리 등록·접속 가능해야 함
1. 공유기 443 → NAS:443
1. 제어판 → 보안 → 인증서 → Let's Encrypt에서 얻기
   - 도메인 이름 + 주제 대체 이름(서브도메인 전부)
   - 실패 시: 80/443 포워딩, SAN 접속 가능 여부, 방화벽 default
   - NAS 2대 이상: 발급 중 443 포워딩을 해당 NAS로 일시 변경
1. DSM 설정 — HTTPS 리다이렉트 / HSTS
1. 앱 포털에서도 HSTS
1. 갱신 — 인증서 우클릭 → 갱신 (80/443·방화벽 default 후)
