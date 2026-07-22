+++
title = "log4j WARN No appenders"
date = 2021-08-12T15:50:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END"]
tags = ["JAVA"]
toc = true

[extra]
source = "notion"
notion_id = "103453b9-4f78-4b07-817e-8cb04f783dbf"
notion_url = "https://app.notion.com/p/log4j-WARN-No-appenders-103453b94f784b07817e8cb04f783dbf"
external_url = "https://blog.naver.com/kkson50/120158043864"
+++

## log4j:WARN No appenders could be found

**원인**: CLASSPATH에서 `log4j.properties`/`log4j.xml` 미발견

**해결**: `WEB-INF/classes/log4j.properties` 생성

```javascript
log4j.rootLogger=DEBUG, A1
log4j.appender.A1=org.apache.log4j.ConsoleAppender
log4j.appender.A1.layout=org.apache.log4j.PatternLayout
```

또는 `web.xml`:

```xml
<context-param>
  <param-name>log4jConfigLocation</param-name>
  <param-value>/WEB-INF/log4j.properties</param-value>
</context-param>
```
