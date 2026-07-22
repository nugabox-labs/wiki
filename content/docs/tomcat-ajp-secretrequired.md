+++
title = "Tomcat AJP secretRequired"
date = 2020-03-31T19:54:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["WAS", "WEB"]
toc = true

[extra]
source = "notion"
notion_id = "db00b902-f98c-47cf-924f-e5097bb6c473"
notion_url = "https://app.notion.com/p/Tomcat-AJP-secretRequired-db00b902f98c47cf924fe5097bb6c473"
external_url = "https://tomcat.apache.org/security-9.html"
+++

## 증상

Tomcat 7.0.100 / 8.5.51 / 9.0.31+ 에서 Apache↔AJP 연동 시 무한로딩·403·503.

## 원인

Ghostcat(CVE-2020-1938) 대응으로 AJP `secret` 검증 강제. mod\_jk/mod\_proxy\_ajp에 인증 정보 없으면 실패.

## 해결

`server.xml` AJP Connector에 `secretRequired`/`address` 추가. 외부 AJP 불필요하면 `127.0.0.1` 바인딩:

```xml
<Connector protocol="AJP/1.3" address="127.0.0.1" port="8009"
    secretRequired="false" redirectPort="8443" />
```

운영은 `secretRequired="true"` + `secret="…"`를 Apache(mod\_jk/mod\_proxy\_ajp)와 맞추는 편이 안전.
