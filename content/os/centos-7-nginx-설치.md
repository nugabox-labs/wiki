+++
title = "CentOS 7 NGINX 설치"
date = 2022-06-15T00:30:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["WAS", "LINUX", "WEB"]
toc = true

[extra]
source = "notion"
notion_id = "fe8a8b3a-73fa-4347-a8a7-2a37f7f3ce35"
notion_url = "https://app.notion.com/p/CentOS-7-NGINX-fe8a8b3a73fa4347a8a72a37f7f3ce35"
external_url = "https://holjjack.tistory.com/114"
+++

## 1. yum repo

```bash
vi /etc/yum.repos.d/nginx.repo
```

```
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/7/$basearch/
gpgcheck=0
enabled=1
```

## 2. 설치

```bash
yum install -y nginx
```

## 3. 방화벽 (listen과 동일 포트)

```bash
firewall-cmd --permanent --zone=public --add-port=8080/tcp
firewall-cmd --reload
firewall-cmd --list-ports
```

## 4. 포트 (`/etc/nginx/conf.d/default.conf`)

```
server {
    listen       8080;
    server_name  localhost;

    location / {
        root   /usr/share/nginx/html;
        index  index.html index.htm;
    }

    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }
}
```

## 5. 실행

```bash
systemctl start nginx
systemctl enable nginx
```

확인: `http://localhost:8080`
