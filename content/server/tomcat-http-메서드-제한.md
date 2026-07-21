+++
title = "Tomcat HTTP 메서드 제한"
date = 2019-05-17T00:36:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["WEB", "WAS"]
toc = true

[extra]
source = "notion"
notion_id = "be366916-3994-4618-8ddf-ea917a94f098"
notion_url = "https://app.notion.com/p/Tomcat-HTTP-be366916399446188ddfea917a94f098"
+++

Tomcat `CATALINA_HOME/conf/web.xml` — GET/POST 외 메서드 차단.

```xml
<security-constraint>
  <web-resource-collection>
    <web-resource-name>MethodLimit</web-resource-name>
    <url-pattern>/*</url-pattern>
    <http-method>HEAD</http-method>
    <http-method>PUT</http-method>
    <http-method>MOVE</http-method>
    <http-method>DELETE</http-method>
    <http-method>OPTIONS</http-method>
    <http-method>TRACE</http-method>
  </web-resource-collection>
  <auth-constraint>
    <role-name></role-name>
  </auth-constraint>
</security-constraint>
```
