+++
title = "log4j:WARN No appenders could be found 해결"
date = 2021-08-12T15:50:00Z
updated = 2026-07-21T02:37:00Z
categories = ["BACK-END"]
tags = ["JAVA"]
toc = true

[extra]
source = "notion"
notion_id = "103453b9-4f78-4b07-817e-8cb04f783dbf"
notion_url = "https://app.notion.com/p/log4j-WARN-No-appenders-could-be-found-103453b94f784b07817e8cb04f783dbf"
external_url = "https://blog.naver.com/kkson50/120158043864"
+++

## log4j:WARN No appenders could be found... 해결

**현상**

```javascript
log4j:WARN No appenders could be found for logger (...)
log4j:WARN Please initialize the log4j system properly.
```

**원인**: log4j가 CLASSPATH에서 `log4j.properties` 또는 `log4j.xml`을 찾지 못함

**해결**: `WEB-INF/classes/`에 `log4j.properties` 생성

```javascript
# Set root logger level to DEBUG and its only appender to A1.
log4j.rootLogger=DEBUG, A1
# A1 is set to be a ConsoleAppender.
log4j.appender.A1=org.apache.log4j.ConsoleAppender
# A1 uses PatternLayout.
log4j.appender.A1.layout=org.apache.log4j.PatternLayout
```

- CLASSPATH 안이면 위치 무관
- `web.xml`에 명시적으로 지정도 가능:

```xml
<context-param>
    <param-name>log4jConfigLocation</param-name>
    <param-value>/WEB-INF/log4j.properties</param-value>
</context-param>
```

원문: [https://blog.naver.com/kkson50/120158043864](https://blog.naver.com/kkson50/120158043864)
