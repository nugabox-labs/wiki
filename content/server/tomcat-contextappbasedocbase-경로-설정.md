+++
title = "Tomcat Context/appBase/docBase 경로 설정"
date = 2020-09-18T11:21:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["WAS"]
toc = true

[extra]
source = "notion"
notion_id = "77fd8e53-ae21-4dad-809a-effe7a519ccb"
notion_url = "https://app.notion.com/p/Tomcat-Context-appBase-docBase-77fd8e53ae214dad809aeffe7a519ccb"
+++

## Tomcat Context/appBase/docBase 경로 설정

`conf/server.xml`의 `<Host>` 태그 안 `appBase`가 웹앱들의 기준 상대경로(`${catalina.home}` 기준), 기본은 `webapps` → 기본 웹루트는 `webapps/ROOT`

**Context로 경로 매핑**

```xml
<Host name="localhost" appBase="webapps" unpackWARs="true" autoDeploy="true">
    <Context docBase="firstDoc" path="/" reloadable="true" />
    <Context docBase="secondDoc" path="/hello" reloadable="true" />
</Host>
```

- `path="/"`: `http://localhost/hello.jsp` 요청 → `webapps/firstDoc/hello.jsp` 응답
- `path="/hello"`: `http://localhost/hello/hello.jsp` 요청 → `webapps/secondDoc/hello.jsp` 응답

**webapp 자체를 웹루트로 만들기**

```xml
<Context path="" docBase="." reloadable="true"/>
```

**appBase를 아예 다른 경로로 변경**

```xml
<Host name="localhost" appBase="d:/env/home/my" ...>
    <Context path="" docBase="." reloadable="true"/>
</Host>
```

※ Context 생략 시 ROOT가 자동으로 웹루트가 됨

**Tomcat 5.0+ 권장 방식**: server.xml에 직접 Context 추가 대신 각 웹앱 `META-INF/context.xml`에 설정, 또는 `conf/Catalina/localhost/앱이름.xml` 파일로 개별 등록

```xml
<!-- conf/Catalina/localhost/Happy.xml -->
<Context path="/Happy" docBase="C:\Happy"
    privileged="true" antiResourceLocking="false" antiJARLocking="false" />
```

등록 후 Tomcat 재시작 → `http://localhost:포트/Happy/파일명.html`로 접근 확인

⚠️ webapps를 통째로 웹루트로 쓰는 건 보안상 지양 권장, 필요하면 Apache redirect 등으로 우회

원문: [https://sambalim.tistory.com/76](https://sambalim.tistory.com/76) , [https://yongblog.tistory.com/entry/appbase를-이용한-tomcat-설정](https://yongblog.tistory.com/entry/appbase를-이용한-tomcat-설정)
