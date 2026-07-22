+++
title = "macOS Docker 디스크 용량"
date = 2022-09-29T00:38:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "DEV-OPS", "TECH"]
tags = ["MACOS", "BASH", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "bc9cc5d4-d1bf-4ef2-9e44-02783f64f682"
notion_url = "https://app.notion.com/p/macOS-Docker-bc9cc5d4d1bf4ef29e4402783f64f682"
external_url = "http://egloos.zum.com/mcchae/v/11271008"
+++

## Docker.qcow2 비대화 시

```bash
docker container rm -f $(docker container ls -qa)
docker image rm -f $(docker image ls -qa)
docker volume rm $(docker volume ls | awk '{print $2}')
rm -rf ~/Library/Containers/com.docker.docker/Data/*
# Docker Desktop 재시작
```
