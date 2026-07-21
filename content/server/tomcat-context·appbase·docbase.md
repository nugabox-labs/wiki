+++
title = "Tomcat Context·appBase·docBase"
date = 2020-09-18T11:21:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["WAS"]
toc = true

[extra]
source = "notion"
notion_id = "77fd8e53-ae21-4dad-809a-effe7a519ccb"
notion_url = "https://app.notion.com/p/Tomcat-Context-appBase-docBase-77fd8e53ae214dad809aeffe7a519ccb"
external_url = "https://sambalim.tistory.com/76"
+++

`conf/server.xml`의 `<Host appBase>`가 웹앱 기준 경로(`$CATALINA_HOME` 상대). 기본 `webapps` → 루트는 `webapps/ROOT`.

## Context 매핑

```xml
<Host name="localhost" appBase="webapps" unpackWARs="true" autoDeploy="true">
    <Context docBase="firstDoc" path="/" reloadable="true" />
    <Context docBase="secondDoc" path="/hello" reloadable="true" />
</Host>
```

- `path="/"` → `http://host/hello.jsp` → `webapps/firstDoc/hello.jsp`
- `path="/hello"` → `http://host/hello/hello.jsp` → `webapps/secondDoc/hello.jsp`

## 웹앱을 루트로

```xml
<Context path="" docBase="." reloadable="true"/>
```

## appBase를 다른 경로로

```xml
<Host name="localhost" appBase="d:/env/home/my" ...>
    <Context path="" docBase="." reloadable="true"/>
</Host>
```

Context 생략 시 ROOT가 웹루트.

## 권장 (5.0+)

`server.xml` 직접 삽입보다 `META-INF/context.xml` 또는 `conf/Catalina/localhost/앱이름.xml`:

```xml
<!-- conf/Catalina/localhost/Happy.xml -->
<Context path="/Happy" docBase="C:\Happy"
    privileged="true" antiResourceLocking="false" antiJARLocking="false" />
```

재시작 후 `http://host:포트/Happy/...` 확인.

> webapps 전체를 웹루트로 쓰는 구성은 보안상 지양.
