+++
title = "Hyperledger Fabric Tutorial"
date = 2023-11-10T04:49:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END", "TECH"]
tags = ["BLOCKCHAIN", "GO"]
toc = true

[extra]
source = "notion"
notion_id = "74c8fbcc-ccba-4578-ae11-165964b117be"
notion_url = "https://app.notion.com/p/Hyperledger-Fabric-Tutorial-74c8fbccccba4578ae11165964b117be"
+++

## Vagrant

```bash
vagrant box add <box_image_name> <imageURL>
vagrant init <box_image_name>
# Vagrantfile: memory 4096 등
vagrant up && vagrant ssh
sudo passwd vagrant
```

## 도구

```bash
# Docker
sudo usermod -aG docker $USER   # 재로그인 후
docker version

# Go
echo 'export GOPATH=$HOME/go' >> ~/.profile
echo 'export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin' >> ~/.profile
source ~/.profile

jq --version
```

## Fabric samples

```bash
mkdir -p $HOME/go/src/github.com/<user>
cd $HOME/go/src/github.com/<user>
chmod +x install-fabric.sh && ./install-fabric.sh
```

## test-network

```bash
cd $HOME/go/src/github.com/<user>/fabric-samples/test-network
./network.sh up
./network.sh createChannel -c mychannel
./network.sh deployCC -ccn basic -ccp ../asset-transfer-basic/chaincode-go -ccl go
./network.sh down
```

- `deployCC`: `-ccn` 이름, `-ccp` 경로, `-ccl` 언어(go|java|javascript|typescript)

## Peer 환경변수 (Org1 예)

```bash
export PATH=${PWD}/../bin:$PATH
export FABRIC_CFG_PATH=$PWD/../config/
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID=Org1MSP
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
export CORE_PEER_ADDRESS=localhost:7051
```

## invoke / query

```bash
peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com \
  --tls --cafile ${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem \
  -C mychannel -n basic \
  --peerAddresses localhost:7051 --tlsRootCertFiles ${CORE_PEER_TLS_ROOTCERT_FILE} \
  -c '{"function":"InitLedger","Args":[]}'

peer chaincode query -C mychannel -n basic -c '{"Args":["GetAllAssets"]}'
```
