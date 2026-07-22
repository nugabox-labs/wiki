+++
title = "DID 기술적 이해"
date = 2021-07-20T00:16:00Z
updated = 2026-07-21T06:47:00Z
categories = ["TECH"]
tags = ["DID", "BLOCKCHAIN"]
toc = true

[extra]
source = "notion"
notion_id = "57c3629e-f7c9-44a2-8dba-86d473704c99"
notion_url = "https://app.notion.com/p/DID-57c3629ef7c944a28dba86d473704c99"
external_url = "https://medium.com/coinplug-tech/decentralized-identifier%EC%97%90-%EB%8C%80%ED%95%9C-%EA%B8%B0%EC%88%A0%EC%A0%81-%EC%9D%B4%ED%95%B4-a2657206201f"
+++

## DID (Decentralized Identifier) 기술 이해

### 요약

- **DID**: 중앙 기관 없이 주체가 스스로 생성·통제하는 분산 식별자.
- **DID Document**: DID와 1:1. publicKey·authentication·service endpoint 포함. DLT에 저장.
- **DID Method**: DLT별 CRUD 규격 (`did:sov:…`, `did:ethr:…`).
- **VC**: Issuer→Holder 발급, Holder가 Verifier에 VP로 제출·검증.
- **SSI**: 개인이 신원·공유 범위를 통제. DID는 SSI 기술 스택의 하나.

### 표기

```
did:<method>:<method-specific-id>
예) did:sov:3k9dg356wdcj5gf2k9bw8kfg7a
```

Private Key → 단말/월렛, Public Key → DID Document.
