+++
title = "CentOS Docker 설치"
date = 2022-05-16T04:56:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "DEV-OPS"]
tags = ["LINUX", "MSA"]
toc = true

[extra]
source = "notion"
notion_id = "b6fe1a56-0af2-4272-a39a-b6ec1bc15e59"
notion_url = "https://app.notion.com/p/CentOS-Docker-b6fe1a560af24272a39ab6ec1bc15e59"
+++

## Docker 설치

```bash
curl -fsSL https://get.docker.com/ | sh
sudo systemctl enable --now docker
sudo usermod -aG docker <user>   # 재로그인 필요
docker -v
docker run hello-world
```

## 특정 버전 (yum)

```bash
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum list docker-ce --showduplicates | sort -r
yum install docker-ce-<version>   # 예: docker-ce-20.10.15-3.el7
```

## Docker Compose

```bash
sudo curl -L "https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-$(uname -s)-$(uname -m)" \
  -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose -v
```

## Troubleshoot: docker.sock permission denied

```bash
# 권장: docker 그룹 소속 (재로그인)
sudo usermod -aG docker <user>
# 임시: 소켓 그룹
sudo chown root:docker /var/run/docker.sock
# 비권장: chmod 666
```
