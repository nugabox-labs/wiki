+++
title = "Portainer Docker Web GUI 설치"
date = 2022-05-19T02:06:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "DEV-OPS"]
tags = ["NETWORK", "MSA"]
toc = true

[extra]
source = "notion"
notion_id = "6404e631-8799-4a5b-826a-90b32f0b924e"
notion_url = "https://app.notion.com/p/Portainer-Docker-Web-GUI-6404e63187994a5b826a90b32f0b924e"
+++

## Portainer CE

```bash
docker pull portainer/portainer-ce
docker volume create portainer_data
docker run -d -p 9000:9000 --name portainer --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data portainer/portainer-ce:latest
```

브라우저: `http://host:9000`
