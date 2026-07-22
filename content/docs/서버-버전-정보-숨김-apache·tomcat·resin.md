+++
title = "서버 버전 정보 숨김 Apache·Tomcat·Resin"
date = 2019-11-21T17:32:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["LINUX", "WEB", "WAS"]
toc = true

[extra]
source = "notion"
notion_id = "2072488b-e4cf-464a-a95a-8b1ea292295d"
notion_url = "https://app.notion.com/p/Apache-Tomcat-Resin-2072488be4cf464aa95a8b1ea292295d"
external_url = "https://4lugin.tistory.com/132"
+++

## Apache (`httpd.conf`)

```javascript
ServerSignature Off
ServerTokens Prod
```

## Tomcat

`server.xml` Connector에 `server="Apache"`(또는 임의 문자열).

`web.xml` custom error-page로 404 등 감춤.

## Resin (`resin.conf`)

```xml
<server-header>TEST/1.0</server-header>
```
