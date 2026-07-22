+++
title = "Synology 서브도메인·역방향 프록시"
date = 2020-05-26T07:10:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["SYNOLOGY", "NETWORK"]
toc = true

[extra]
source = "notion"
notion_id = "b5249616-28cf-40d3-a0cd-e29ac11bdb9a"
notion_url = "https://app.notion.com/p/Synology-b524961628cf40d3a0cde29ac11bdb9a"
external_url = "https://app.notion.com/p/f95b91bd5faa46848c667b95b800e03b"
+++

## 1. DNS — CNAME 서브도메인

DNS Server → 영역(예: [example.com](http://example.com/)) → 리소스 레코드 → 생성 → CNAME

- 이름: 서브도메인
- TTL: 86400
- 정식 이름: [example.com](http://example.com/)

## 2. 역방향 프록시 매칭

제어판 → 응용 프로그램 포털 → 역방향 프록시 → 생성

- 프로토콜: HTTPS / 호스트: `sub.example.com` / 포트: 443
- HSTS·HTTP/2 선택
- 대상: HTTP + 내부 서버 IP:Port

## 3. HTTP→HTTPS 리다이렉트

```bash
ssh -p 1022 admin@NAS_IP
sudo -i
vi /usr/local/etc/nginx/sites-enabled/user.conf.server
```

```javascript
server {
  server_name sub.example.com;
  if ($server_port = "80") {
    return 301 https://$server_name$request_uri;
  }
}
```

```bash
synoservice --restart nginx
```
