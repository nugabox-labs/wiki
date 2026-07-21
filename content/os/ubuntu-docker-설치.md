+++
title = "Ubuntu Docker 설치"
date = 2022-03-31T01:03:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "DEV-OPS"]
tags = ["LINUX", "MSA"]
toc = true

[extra]
source = "notion"
notion_id = "1a359a3f-e73b-45fa-9e7d-66d6fb260dcf"
notion_url = "https://app.notion.com/p/Ubuntu-Docker-1a359a3fe73b45fa9e7d66d6fb260dcf"
external_url = "https://docs.docker.com/engine/install/ubuntu/"
+++

## 오래된 버전 삭제

```bash
sudo apt-get remove docker docker-engine docker.io containerd runc
```

## Repository

```bash
sudo apt-get update
sudo apt-get -y install apt-transport-https ca-certificates curl gnupg lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
  sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
  https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

## Docker Engine

```bash
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
docker --version
sudo docker run hello-world
```

## Docker Compose (v1 binary 예시)

```bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" \
  -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
```

## 일반 사용자 권한

```bash
sudo usermod -aG docker $USER
sudo systemctl restart docker
# 재로그인 또는 newgrp docker
```
