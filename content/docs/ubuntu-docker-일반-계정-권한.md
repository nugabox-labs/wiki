+++
title = "Ubuntu Docker 일반 계정 권한"
date = 2022-05-14T18:25:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "DEV-OPS", "TECH"]
tags = ["LINUX", "BASH", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "6e8d4d38-678c-4857-9571-3fb50568a75f"
notion_url = "https://app.notion.com/p/Ubuntu-Docker-6e8d4d38678c485795713fb50568a75f"
external_url = "https://eventhorizon.tistory.com/149"
+++

## Ubuntu Docker 일반 계정 권한

```bash
sudo groupadd docker
sudo usermod -aG docker $USER

# 권장: 로그아웃·재로그인 또는 newgrp docker
# 임시(비권장): sudo chmod 666 /var/run/docker.sock

sudo systemctl restart docker
docker ps
docker run --rm hello-world
```
