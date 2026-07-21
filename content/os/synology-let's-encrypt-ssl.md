+++
title = "Synology Let's Encrypt SSL"
date = 2019-09-26T08:54:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER", "TECH"]
tags = ["SYNOLOGY", "NETWORK", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "7bef2282-c673-4aa1-854e-233b492b8067"
notion_url = "https://app.notion.com/p/Synology-Let-s-Encrypt-SSL-7bef2282c6734aa1854e233b492b8067"
external_url = "https://app.notion.com/p/8531888f42f94650b04b085d9967e9dd"
+++

Synology DSM + DDNS + Let's Encrypt.

## 사전

1. DSM **외부 액세스 → DDNS** 등록 (`username.synology.me`)
1. 도메인 **CNAME**: `dsm`/`audio`/`video`/`file` → DDNS
1. 공유기 **443**(필요 시 80) 포트포워딩

## 인증서

제어판 → 보안 → 인증서 → Let's Encrypt에서 얻기

- 도메인: `dsm.example.com`
- SAN: `audio.example.com;video.example.com;...`
- 기본 인증서 지정 → **구성**에서 서비스별 인증서 연결

## DSM / 앱 포털

- DSM 설정: HTTPS 리디렉션, 사용자 지정 도메인, HSTS
- 응용 프로그램 포털: 별칭/커스텀 포트 OFF → 사용자 지정 도메인 ON (`audio.example.com` 등)

접속: `https://dsm.example.com` 등.

와일드카드([acme.sh](http://acme.sh/)): [Synology Let's Encrypt 와일드카드 acme.sh](https://app.notion.com/p/8531888f42f94650b04b085d9967e9dd)
