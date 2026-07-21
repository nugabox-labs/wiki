+++
title = "Tomcat Context 설정 위치"
date = 2021-10-05T02:05:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "BACK-END", "TECH"]
tags = ["WAS", "JAVA", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "df42ad32-8358-4aca-98bc-f90f1540b0de"
notion_url = "https://app.notion.com/p/Tomcat-Context-df42ad3283584aca98bcf90f1540b0de"
external_url = "https://parkcheolu.tistory.com/130"
+++

## 요청 흐름

HTTP → Catalina → **Context** → Servlet → 응답

## 설정 위치

| 경로 | 범위 |
| --- | --- |
| `server.xml` `<Host>` 하위 `<Context>` | 전역 (재시작 필요, **비권장**) |
| `$CATALINA_HOME/conf/context.xml` | 전역 권장 |
| `conf/[engine]/[host]/context.xml.default` | 호스트 기본 |
| `conf/[engine]/[host]/ROOT.xml` | ROOT 컨텍스트 |
| `conf/[engine]/[host]/[contextpath].xml` | 앱별 |
| 앱 `/META-INF/context.xml` | 앱별 (`copyXML=true`면 conf로 복사) |

## 우선순위 (높음→낮음)

1. `server.xml`
1. `conf/context.xml`
1. `/META-INF/context.xml`
1. `context.xml.default`

`override="true"`면 META-INF Context가 최우선.

```xml
<!-- 예: conf/Catalina/localhost/myapp.xml -->
<Context path="/myapp" docBase="/path/to/app" reloadable="true" />
```
