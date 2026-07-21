+++
title = "WebtoB SSL·URLRewrite"
date = 2019-09-18T01:21:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["WEB"]
toc = true

[extra]
source = "notion"
notion_id = "f4646d64-13c9-4e5e-9d28-fb8d76441cba"
notion_url = "https://app.notion.com/p/WebtoB-SSL-URLRewrite-f4646d6413c94e5e9d28fb8d76441cba"
+++

> 도메인·IP·경로는 플레이스홀더로 일반화.

## http.m (SSL VHOST)

```
*VHOST
v_app
    DOCROOT = "/home/app/webapps",
    HOSTNAME = www.example.com,
    PORT = "80",
    URLRewrite = Y,
    URLRewriteConfig = "/home/app/webtob/config/rewrite.cfg",
    ...
v_app_ssl
    DOCROOT = "/home/app/webapps",
    HOSTNAME = www.example.com,
    PORT = "443",
    SSLFLAG = Y,
    SSLNAME = ssl1,
    ...

*SSL
ssl1
    CertificateFile = "/home/app/webtob/ssl/newcert.pem",
    CertificateKeyFile = "/home/app/webtob/ssl/newcert.pem",
    PassPhraseDialog = "exec:/home/app/webtob/ssl/passwd"

*SVRGROUP
edug SVRTYPE = JSV, VhostName = "v_app, v_app_ssl"

*URI
u_app Uri = "/", Svrtype = JSV, GotoEXT=Y, VhostName = "v_app, v_app_ssl"
```

## rewrite.cfg (80→443)

```
RewriteCond %{HTTP_HOST} ^www\.example\.com$
RewriteCond %{SERVER_PORT} 80
RewriteRule .* https://www.example.com:443$0 [R]
```

적용: `wscfl -i http.m` 후 재기동.
