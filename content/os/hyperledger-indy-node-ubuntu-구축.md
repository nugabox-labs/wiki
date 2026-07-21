+++
title = "Hyperledger Indy Node Ubuntu 구축"
date = 2022-04-21T01:09:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "TECH"]
tags = ["DID", "BLOCKCHAIN", "LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "01631e05-a3fe-45b6-9978-f1d5b8db2bb7"
notion_url = "https://app.notion.com/p/Hyperledger-Indy-Node-Ubuntu-01631e05a3fe45b69978f1d5b8db2bb7"
+++

> Ubuntu 16.04 기준 Indy Node 개발 환경 구축 메모.

## 1. Docker 설치

```bash
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce
sudo systemctl status docker
```

## 2. 소스 clone

```bash
git clone https://github.com/hyperledger/indy-node.git
```

## 3. Python / 의존성

```bash
cd indy-node/dev-setup/ubuntu
sh setup-dev-python.sh
sh setup-dev-depend-ubuntu16.sh
```

### SSL 검증 오류 시 (임시)

```bash
sudo vim /etc/apt/apt.conf.d/80ssl-exceptions
# Acquire::https::Verify-Peer "false";
# Acquire::https::Verify-Host "false";
sudo apt-get update
# 해결 후 해당 파일 삭제
```

### apt repo 미러 치환

```bash
vim setup-dev-depend-ubuntu16.sh
# :%s/us.archive.ubuntu.com/ftp.daumkakao.com/g 후 재실행
```

### 의존성 수동 설치

```bash
sudo apt-get install -y apt-transport-https ca-certificates
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CE7709D068DB5E88
sudo apt-get install -y libsodium18
sudo apt-get install -y libbz2-dev zlib1g-dev liblz4-dev libsnappy-dev rocksdb=5.8.8
sudo apt-get install -y ursa libindy
```
