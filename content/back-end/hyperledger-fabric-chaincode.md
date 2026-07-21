+++
title = "Hyperledger Fabric Chaincode"
date = 2024-01-29T01:38:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END", "TECH"]
tags = ["BLOCKCHAIN", "GO"]
toc = true

[extra]
source = "notion"
notion_id = "6c22513d-aa27-4998-b2c7-414439ff6b1d"
notion_url = "https://app.notion.com/p/Hyperledger-Fabric-Chaincode-6c22513daa274998b2c7414439ff6b1d"
external_url = "https://fabric-kor.readthedocs.io/ko/latest/chaincode4ade.html"
+++

## 참고

- [fabric-kor chaincode](https://fabric-kor.readthedocs.io/ko/latest/chaincode4ade.html)
- 강의(영): [youtu.be/azBTd3OYST0](https://youtu.be/azBTd3OYST0)
- 강의(한): [youtu.be/UEFHsOLeLME](https://youtu.be/UEFHsOLeLME)

## VSCode + IBM Blockchain Platform

- Create New Project → Package Open Project (V2 tar.gz)

### `go mod vendor` 실패

```bash
go get golang.org/x/sys/unix
go mod tidy
go mod vendor
```

## 동작

1. Install → Instantiate
1. Instantiate: `main` Register → `init`
1. query/invoke → 컨테이너 `invoke`

### Method

- `main` 등록 / `init` 초기화·업그레이드 / `invoke` 호출
