+++
title = "KSCHAIN 세팅"
date = 2019-11-12T07:24:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END", "TECH"]
tags = ["GO", "BLOCKCHAIN"]
toc = true

[extra]
source = "notion"
notion_id = "f964742e-6089-4aab-932a-2754077080a2"
notion_url = "https://app.notion.com/p/KSCHAIN-f964742e60894aab932a2754077080a2"
+++

## 준비

- Go·환경변수·소스 다운로드
- `mkdir CENTRAL_NODE WALLET_NODE MINER_NODE`
- 각 폴더에 `unzip kschain.zip -d 디렉토리명`

## 빌드

```bash
cd WALLET_NODE && go build   # 실행파일=폴더명
```

## 환경설정 (wallet\_node 예)

```bash
./wallet_node createdefaultenvfile
./wallet_node setsubsidy -amount 10
./wallet_node settargetbits -bits 16
./wallet_node setnodeport -port 3000
./wallet_node setnodeip -ip "127.0.0.1"
./wallet_node setleadernodeaddr -address "127.0.0.1:3001"
./wallet_node showenv
```

## 지갑

```bash
./wallet_node createwallet   # 노드마다 발급·키 보관
cp wallet_3000.dat ../CENTRAL_NODE
cd ../CENTRAL_NODE && mv wallet_3000.dat wallet_3001.dat
# MINER도 동일. 충돌 시 rm
```

## 제네시스 (중앙)

```bash
cd ../CENTRAL_NODE && go build
./central_node createblockchain -address CENTRAL_WALLET_KEY
cp blockchain_3001.db blockchain_genesis.db
cp blockchain_genesis.db ../WALLET_NODE/blockchain_3000.db
# MINER도 동일
```

## 구동 (별도 터미널)

```bash
./MINER_NODE startnode -miner MINER_WALLET_KEY   # 검증 먼저
./WALLET_NODE startnode
# 중앙도 startnode
```
