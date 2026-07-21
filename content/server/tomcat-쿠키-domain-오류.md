+++
title = "Tomcat 쿠키 domain 오류"
date = 2021-05-26T10:02:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "BACK-END", "TECH"]
tags = ["WAS", "JAVA", "ISSUE"]
toc = true

[extra]
source = "notion"
notion_id = "eefb68ac-47d4-4520-934e-ee9ba4eb0aa1"
notion_url = "https://app.notion.com/p/Tomcat-domain-eefb68ac47d44520934eee9ba4eb0aa1"
external_url = "https://danawalab.github.io/common/2020/02/11/Common-Tomcat-cookieProcessor.html"
+++

## 증상

```
java.lang.IllegalArgumentException: An invalid domain [.danawa.com] was specified for this cookie
```

Tomcat 8.5+ 기본 CookieProcessor = `Rfc6265CookieProcessor` → 도메인 앞 `.` 거부.

## 레거시 vs RFC6265

## Tomcat 버전별

## 해결 — context.xml

```xml
<CookieProcessor className="org.apache.tomcat.util.http.LegacyCookieProcessor"/>
```

## Spring Boot (Embedded Tomcat)

```java
@Bean
public EmbeddedServletContainerCustomizer tomcatCustomizer() {
    return container -> {
        if (container instanceof TomcatEmbeddedServletContainerFactory) {
            TomcatEmbeddedServletContainerFactory tomcat = (TomcatEmbeddedServletContainerFactory) container;
            tomcat.addContextCustomizers(context -> context.setCookieProcessor(new LegacyCookieProcessor()));
        }
    };
}
```
