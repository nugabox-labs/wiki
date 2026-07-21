+++
title = "Docker 컨테이너 이미지 백업·복원"
date = 2022-09-15T10:50:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "TECH"]
tags = ["LINUX", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "9cf2f585-b77b-4e71-a898-353fdd398e02"
notion_url = "https://app.notion.com/p/Docker-9cf2f585b77b4e71a898353fdd398e02"
external_url = "https://app.notion.com/p/e860da48fcf741ee859a9012d7d3468e"
+++

## 실행 중 컨테이너 → 이미지 백업

```bash
docker ps
docker commit <container_id> myapp:backup
docker save -o myapp_backup.tar myapp:backup
# 또는 gzip
docker save myapp:backup | gzip > myapp_backup.tar.gz
```

## 복원

```bash
docker load -i myapp_backup.tar
# gzip이면
gunzip -c myapp_backup.tar.gz | docker load
docker images
docker run -d --name myapp myapp:backup
```

참고: 볼륨 데이터는 이미지에 포함되지 않음 → 필요 시 `docker volume` / bind mount 별도 백업.
