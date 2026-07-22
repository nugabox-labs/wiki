+++
title = "Hyperledger Indy SDK 탐색"
date = 2022-09-18T10:17:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END", "TECH"]
tags = ["DID", "BLOCKCHAIN", "JAVA", "ETC"]
toc = true

[extra]
source = "notion"
notion_id = "a75ff492-15f5-4c93-8c25-e046c07d0357"
notion_url = "https://app.notion.com/p/Hyperledger-Indy-SDK-a75ff49215f54c938c25e046c07d0357"
external_url = "https://gr0uch0dev.github.io/2019-12-25-indy-exploration/"
+++

Hyperledger Indy SDK 실습 요약 (nym, authcrypt, credential).

## 핵심 개념

- **NYM**: Ledger에 DID 등록 트랜잭션
- **authcrypt / anoncrypt**: 당사자 간 암호화 메시지
- **Credential Schema / Cred Def / Credential**: 발급·검증 흐름

## 로컬 Pool

```bash
# docker indy pool (환경에 맞게)
docker run -itd -p 9701-9708:9701-9708 indy-pool
```

## SDK (개념 흐름)

1. Wallet 생성·열기
1. Pool에 연결
1. Steward/Trust Anchor로 NYM 전송 → DID 생성
1. pairwise DID + authcrypt 교환
1. Schema → Cred Def → Credential offer/request/issue → Proof
