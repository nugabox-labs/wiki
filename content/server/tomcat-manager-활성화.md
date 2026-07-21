+++
title = "Tomcat Manager 활성화"
date = 2020-09-18T11:28:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["WAS"]
toc = true

[extra]
source = "notion"
notion_id = "f92d7d66-5efb-4a82-bf64-a09896856357"
notion_url = "https://app.notion.com/p/Tomcat-Manager-f92d7d665efb4a82bf64a09896856357"
external_url = "https://blog.managr.us/entry/Apache-Tomcat"
+++

`webapps/manager`에 포함된 웹 관리 도구. 브라우저에서 WAR 배포·기동/중지 가능.

## 활성화 (`conf/tomcat-users.xml`)

```xml
<role rolename="manager"/>
<role rolename="standard"/>
<user username="admin" password="CHANGE_ME" roles="standard,manager"/>
```

접속: `http://호스트:포트/manager/html`

## 주요 기능

- Applications: 배포 앱 목록·상태
- Start / Stop / Reload / Undeploy
- Deploy: WAR 업로드 배포

> 운영에서는 Manager 노출·약한 비밀번호를 피하고, RemoteAddrValve 등으로 접근을 제한할 것.
