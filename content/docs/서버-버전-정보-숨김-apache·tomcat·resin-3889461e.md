+++
title = "서버 버전 정보 숨김 Apache·Tomcat·Resin"
date = 2019-11-21T17:32:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["WAS", "WEB"]
toc = true

[extra]
source = "notion"
notion_id = "3889461e-d95d-48b7-81bb-09a3056f4e2b"
notion_url = "https://app.notion.com/p/Apache-Tomcat-Resin-3889461ed95d48b781bb09a3056f4e2b"
external_url = "https://4lugin.tistory.com/132"
+++

## 서버 버전 정보 숨기기 (Apache, Tomcat, Resin)

**1) Apache** — `httpd.conf`

```
ServerSignature Off      # 404 등 에러페이지에 서버 정보 표시 안 함
ServerTokens Prod        # 응답 헤더를 "Server: Apache"만 표기
```

**2) Tomcat**

- 방법1 — `server.xml`의 Connector에 `server` 속성 추가:

```xml
<Connector port="8080" protocol="HTTP/1.1" server="Apache" ... />
```

- 방법2 — `web.xml`에 에러페이지 설정으로 기본 에러화면(버전정보 노출) 대체:

```xml
<error-page>
    <error-code>404</error-code>
    <location>/에러페이지.html</location>
</error-page>
```

**3) Resin** — `resin.conf`

```xml
<server-header>임의값/1.0</server-header>
```
