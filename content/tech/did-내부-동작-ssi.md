+++
title = "DID 내부 동작 / SSI"
date = 2021-05-12T05:32:00Z
updated = 2026-07-21T06:47:00Z
categories = ["TECH"]
tags = ["DID", "BLOCKCHAIN"]
toc = true

[extra]
source = "notion"
notion_id = "4d0d5a8b-4b7e-4a83-9a3d-69b651c416f9"
notion_url = "https://app.notion.com/p/DID-SSI-4d0d5a8b4b7e4a839a3d69b651c416f9"
external_url = "https://luniverse.io/did-ssi/?lang=ko"
+++

## DID 내부 동작 / SSI

### 신원 모델 진화

1. **서비스 직접 보유** (ID/PW) — SSL/TLS. 서비스가 PII 전부 보유.
1. **IDP 연합** (SAML, OAuth2, OIDC) — Google/Facebook 등. 편의↑, 중앙 추적·유출 위험.
1. **SSI + DID** — DLT·DID·DKMS·DID Auth·VC. 개인이 자격증명 통제.

### VC 생태계

- **Issuer** 발급 → **Holder** 보관(Edge/Cloud Wallet) → **Verifier**에 **VP** 제출
- Verifier 신뢰의 핵심 = Issuer 신뢰 수준

### DID Document (핵심 속성)

- `id`, `publicKey`, `authentication`, `service`
- DLT = DID → Document 글로벌 KV 저장소
- DID Resolver / Universal Resolver로 method별 resolution

### Pairwise DID

관계마다 별도 DID (`did@A:B`, `did@A:C`)로 추적·상관성 최소화.
