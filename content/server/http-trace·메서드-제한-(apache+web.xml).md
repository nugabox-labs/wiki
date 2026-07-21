+++
title = "HTTP TRACE·메서드 제한 (Apache+web.xml)"
date = "2019-12-31T09:54:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["SERVER"]
tags = ["WEB", "WAS"]
toc = true

[extra]
source = "notion"
notion_id = "de818451-1ca2-4d3d-896c-09f2ef1c735c"
notion_url = "https://app.notion.com/p/HTTP-TRACE-Apache-web-xml-de8184511ca24d3d896c09f2ef1c735c"
external_url = "https://wlsufld.tistory.com/80"
+++

## Apache

```javascript
TraceEnable Off

<Directory />
    <LimitExcept GET POST>
        Order allow,deny
        deny from all
    </LimitExcept>
</Directory>
```

상세: [Apache HTTP 메서드 제한](https://app.notion.com/p/6b5a855806a2436287708826a47b562c)

## 앱 web.xml

```xml
<security-constraint>
  <web-resource-collection>
    <web-resource-name>Protected Context</web-resource-name>
    <url-pattern>/*</url-pattern>
    <http-method>PUT</http-method>
    <http-method>DELETE</http-method>
    <http-method>TRACE</http-method>
    <http-method>COPY</http-method>
    <http-method>MOVE</http-method>
    <http-method>OPTIONS</http-method>
  </web-resource-collection>
  <auth-constraint>
    <role-name></role-name>
  </auth-constraint>
</security-constraint>
```
