+++
title = "Docker Nginx 설치"
date = 2022-05-15T16:27:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER", "DEV-OPS"]
tags = ["WEB", "MSA"]
toc = true

[extra]
source = "notion"
notion_id = "0d7e0652-f591-41f1-bce4-46f8745a4dc6"
notion_url = "https://app.notion.com/p/Docker-Nginx-0d7e0652f59141f1bce446f8745a4dc6"
external_url = "https://velog.io/@latte_h/Docker%EC%97%90%EC%84%9C-NginX-%EC%84%A4%EC%B9%98"
+++

## 이미지 pull·실행

```bash
docker pull nginx
docker run --name webserver -d -p 8080:80 nginx
docker ps
# http://localhost:8080
```

- `-d` 백그라운드
- `-p 호스트:컨테이너` (예: 8080→80)

## 중지/시작

```bash
docker stop webserver
docker start webserver
docker ps -a
```

## 볼륨 마운트 (html)

```bash
docker run -v /home/ubuntu/html:/usr/share/nginx/html --name webserver -d -p 8080:80 nginx
```

## 커스텀 nginx.conf + Dockerfile

```
nginx/
  Dockerfile
  conf/nginx.conf
```

`conf/nginx.conf` 예시 (핵심):

```
user  nginx;
worker_processes  1;
error_log  /var/log/nginx/error.log warn;
pid        /var/run/nginx.pid;

events { worker_connections 1024; }

http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;
    access_log    /var/log/nginx/access.log  main;
    sendfile      on;
    keepalive_timeout 65;
    include /etc/nginx/conf.d/*.conf;
    server_tokens off;
}
```

```docker
FROM nginx:latest
COPY conf/nginx.conf /etc/nginx/nginx.conf
CMD ["nginx", "-g", "daemon off;"]
EXPOSE 80
```

```bash
docker build --tag nginx-test:1.0 .
docker run -d -p 8080:80 nginx-test:1.0
```
