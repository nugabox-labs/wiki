+++
title = "KSCHAIN 세팅"
date = "2019-11-12T07:24:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["BACK-END", "TECH"]
tags = ["GO", "BLOCKCHAIN"]
toc = true

[extra]
source = "notion"
notion_id = "f964742e-6089-4aab-932a-2754077080a2"
notion_url = "https://app.notion.com/p/KSCHAIN-f964742e60894aab932a2754077080a2"
+++

## 사전 준비

- Go 설치 및 환경변수 설정, 소스 다운로드
- 노드별 디렉토리 생성: `mkdir CENTRAL_NODE`, `mkdir WALLET_NODE`, `mkdir MINER_NODE`
- 각 폴더에 소스 동일하게 복사: `unzip kschain.zip -d 디렉토리명`

## 빌드

```bash
cd WALLET_NODE
go build   # 실행파일(폴더명과 동일) 생성 → ./실행파일명 명령 파라미터
```

## 환경설정

```bash
./wallet_node createdefaultenvfile          # Env.cfg 생성 및 초기화
./wallet_node setsubsidy -amount 10          # PoW 보상량 설정
./wallet_node settargetbits -bits 16         # TargetBits 설정
./wallet_node setnodeport -port 3000         # 노드 포트(=Node ID)
./wallet_node setnodeip -ip "127.0.0.1"      # 노드 IP
./wallet_node setleadernodeaddr -address "127.0.0.1:3001"   # 리더(보통 Central) 노드 주소
./wallet_node showenv                        # 환경설정 확인
```

## 지갑 노드에서 지갑 생성

```bash
./wallet_node createwallet   # 노드마다 필요 (3개 발급, 노드별로 매칭해서 키 보관)
```

지갑DB를 다른 노드 위치로 복사 후 포트에 맞게 파일명 변경:

```bash
cp wallet_3000.dat ../CENTRAL_NODE
cd ../CENTRAL_NODE && mv wallet_3000.dat wallet_3001.dat
# MINER 노드도 동일하게 실행
# 기존 wallet_포트.dat 충돌 시 rm으로 삭제 가능
```

## 중앙 노드에서 블록체인 생성

```bash
cd ../CENTRAL_NODE && go build
# (환경설정은 위 항목과 동일하게 진행)
./central_node createblockchain -address CENTRAL_WALLET_KEY
```

제네시스 DB 생성 및 배포:

```bash
cp blockchain_3001.db blockchain_genesis.db
cp blockchain_genesis.db ../WALLET_NODE
cd ../WALLET_NODE
cp blockchain_genesis.db blockchain_3000.db
# MINER 노드도 동일하게 실행, 기존 파일 충돌 시 삭제 가능
```

## 노드 구동 (각각 별도 터미널)

```bash
./MINER_NODE startnode -miner MINER_WALLET_KEY   # 검증 노드부터 먼저 구동
./WALLET_NODE startnode                           # 지갑 노드
# 중앙 노드도 동일하게 startnode
```

새 터미널을 열어 지갑 노드에서 추가 명령 전달 (TAPI 서버 주소 설정 등 추가 항목 있음)
