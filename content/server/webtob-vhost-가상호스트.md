+++
title = "WebtoB VHOST 가상호스트"
date = 2019-09-17T07:07:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["WEB"]
toc = true

[extra]
source = "notion"
notion_id = "fd4c96bf-1ff1-4056-a224-26181cabaddb"
notion_url = "https://app.notion.com/p/WebtoB-VHOST-fd4c96bf1ff14056a22426181cabaddb"
+++

> 도메인·IP 플레이스홀더로 일반화.

## VHOST 절 예 (`http.m`)

```javascript
*VHOST
v_app
    DOCROOT = "/home/app/webapps",
    HOSTNAME = www.example.com,
    HostAlias = "192.168.0.10",
    PORT = "80",
    ServiceOrder = "uri,ext",
    LOGGING = "log1",
    ERRORLOG = "log2"

*SVRGROUP
htmlg SVRTYPE = HTML
edug  SVRTYPE = JSV, VhostName = "v_app"

*SERVER
html    SVGNAME = htmlg, MinProc = 10, MaxProc = 10
MyGroup SVGNAME = edug,  MinProc = 20, MaxProc = 20

*URI
# 구체 패턴을 위, "/"는 아래
u_app Uri = "/", Svrtype = JSV, GotoEXT=Y, VhostName = "v_app"
```

## 적용 (80 포트 시 root 권한)

```bash
wscfl -i http.m
wsdown
# root:
chown root $WEBTOBDIR/bin/htl && chmod +s $WEBTOBDIR/bin/htl
# 앱 계정:
wscfl -i http.m && wsboot
```

hosts에 `192.168.0.10 www.example.com` 추가 후 접속 확인.
