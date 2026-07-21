+++
title = "Tomcat Spring @Schedule 중복 실행"
date = 2023-03-28T08:18:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "BACK-END", "TECH"]
tags = ["JAVA", "WAS", "ISSUE"]
toc = true

[extra]
source = "notion"
notion_id = "cacee67c-7971-4903-b05c-4c317b67eae5"
notion_url = "https://app.notion.com/p/Tomcat-Spring-Schedule-cacee67c79714903b05c4c317b67eae5"
external_url = "http://apieceofspace.blogspot.com/2018/09/spring-schedule.html"
+++

## 증상

Tomcat에 Spring 배포 시 `@Scheduled`가 이중 실행.

## 원인

`Host appBase` 아래 war/디렉터리 + `<Context>`로 동일 앱이 **이중 로딩**.

```xml
<!-- 문제 예: appBase 자동배포 + Context 중복 -->
<Host name="localhost" appBase="/home/user/tomcat/webapps"
      unpackWARs="true" autoDeploy="false">
  <Context path="/appTest" docBase="app1" reloadable="true" />
</Host>
```

## 해결

`deployOnStartup="false"` 추가하거나, 앱을 `appBase` 밖 `docBase`로만 배치.

```xml
<Host name="localhost" appBase="/home/user/tomcat/webapps"
      unpackWARs="true" autoDeploy="false" deployOnStartup="false">
  <Context path="/appTest" docBase="app1" reloadable="true" />
</Host>
```
