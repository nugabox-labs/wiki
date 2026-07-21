+++
title = "LB 뒤 클라이언트 IP (X-Forwarded-For)"
date = 2023-09-27T07:46:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "BACK-END", "TECH"]
tags = ["JAVA", "WEB", "NETWORK", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "1b6ecb79-f997-40eb-8cca-81999eeed664"
notion_url = "https://app.notion.com/p/LB-IP-X-Forwarded-For-1b6ecb79f99740eb8cca81999eeed664"
external_url = "https://djkeh.github.io/articles/Client-ip-over-load-balancer-and-its-access-log-kor/"
+++

## Header

```
X-Forwarded-For: client, proxy1, proxy2
```

첫 번째 IP = 원 클라이언트.

## Apache access log

```javascript
LogFormat "%{X-Forwarded-For}i %l %u %t \"%r\" %>s %b" common
```

## Tomcat server.xml

```xml
<Valve className="org.apache.catalina.valves.RemoteIpValve" />

<Valve className="org.apache.catalina.valves.AccessLogValve" directory="logs"
       prefix="localhost_access_log" suffix=".txt"
       pattern="%{org.apache.catalina.AccessLog.RemoteAddr}r %l %u %t &quot;%r&quot; %s %b" />
```

`RemoteIpValve` 없으면: `pattern="%{X-Forwarded-For}i ..."`

## Servlet

```java
String ip = request.getHeader("X-Forwarded-For");
if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip))
    ip = request.getRemoteAddr();
else
    ip = ip.split(",")[0].trim();
```

## Spring Boot

```javascript
server.tomcat.remote-ip-header=x-forwarded-for
server.tomcat.protocol-header=x-forwarded-proto
server.tomcat.accesslog.enabled=true
server.tomcat.accesslog.pattern=%{X-Forwarded-For}i %l %u %t "%r" %s %b
```

## Spring Security IP 제한

```java
http.authorizeRequests().antMatchers("/**").access("hasIpAddress('10.24.0.0/16')");
```
