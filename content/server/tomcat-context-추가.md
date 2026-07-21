+++
title = "Tomcat Context 추가"
date = 2021-10-05T02:04:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "BACK-END"]
tags = ["WAS", "JAVA"]
toc = true

[extra]
source = "notion"
notion_id = "d423c1a0-77f9-4d3f-a7d9-ec8645a8c0df"
notion_url = "https://app.notion.com/p/Tomcat-Context-d423c1a077f94d3fa7d9ec8645a8c0df"
external_url = "https://fliedcat.tistory.com/4"
+++

## 추가 방법

1. `$CATALINA_HOME/conf/Catalina/localhost/myapp.xml` (권장, 재시작 없이 반영)
1. `server.xml` `<Host>` 안 `<Context>` (재시작 필요)

파일명 `myapp.xml` → path `/myapp`. 경로 `/`는 `#`: `/my/app` → `my#app.xml`

## Exploded

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Context path="/myapp" docBase="/webpage/myapp/" reloadable="true"/>
```

## WAR

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Context path="/myapp" docBase="/webpage/myapp.war" reloadable="false"/>
```

- `docBase`: 물리 경로
- `reloadable`: 개발 true / 운영 false

## server.xml

```xml
<Host name="localhost" ...>
  <Context path="/myapp" docBase="webpage/myapp/" reloadable="false"/>
</Host>
```

접속: `http://localhost:8080/myapp`
