+++
title = "CentOS 7 Docker 설치·컨테이너"
date = 2022-04-20T00:39:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "DEV-OPS"]
tags = ["LINUX", "MSA"]
toc = true

[extra]
source = "notion"
notion_id = "ab74d45e-6861-4525-8b76-851130ffeaf3"
notion_url = "https://app.notion.com/p/CentOS-7-Docker-ab74d45e686145258b76851130ffeaf3"
external_url = "https://link2me.tistory.com/2088"
+++

## CentOS 7 Docker 설치

```bash
sudo yum remove docker docker-client docker-client-latest docker-common \
  docker-latest docker-latest-logrotate docker-logrotate docker-engine

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io
sudo systemctl enable --now docker
docker --version
```

공식: [docs.docker.com/engine/install/centos](https://docs.docker.com/engine/install/centos/)

## 컨테이너 기본

```bash
docker pull centos:7
docker run -itd --name centos7 -p 8022:22 centos:7 /bin/bash
docker exec -it centos7 /bin/bash
docker ps -a
docker stop centos7 && docker start centos7
```

## 컨테이너 SSH (호스트)

```bash
ssh -p 8022 root@<host-ip>
```

## 이미지 백업·삭제

```bash
docker commit centos7 centos_python
docker save -o centos_python.tar centos_python
docker load -i centos_python.tar

docker stop centos7 && docker rm centos7
docker rmi centos_python
```
