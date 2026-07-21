+++
title = "WebtoB IP 허용·차단"
date = 2021-09-17T07:49:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "TECH"]
tags = ["WAS", "WEB", "NETWORK", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "b87789ab-de80-435f-8897-ac483d3f1714"
notion_url = "https://app.notion.com/p/WebtoB-IP-b87789abde80435f8897ac483d3f1714"
external_url = "https://gkflqkfl.tistory.com/157"
+++

## WebtoB 특정 IP/대역 허용·차단

`ACCESS` 절 정의 후 `NODE` / `URI` / `EXT`에 연결.

```
*NODE
...
JsvAccessName = access_name

*URI
uri1 Uri = "/", Svrtype = JSV, ACCESSNAME = access_name

*EXT
jsp MimeType = "application/jsp", SVRTYPE = JSV, ACCESSNAME = access_name

*ACCESS
access_name Order = "allow,deny", Allow = "1.1.1.1"
# 대역 예: Allow = "192.168.1.0/24"
# Deny = "..."
```
