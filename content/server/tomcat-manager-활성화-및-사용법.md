+++
title = "Tomcat Manager 활성화 및 사용법"
date = 2020-09-18T11:28:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["WAS"]
toc = true

[extra]
source = "notion"
notion_id = "f92d7d66-5efb-4a82-bf64-a09896856357"
notion_url = "https://app.notion.com/p/Tomcat-Manager-f92d7d665efb4a82bf64a09896856357"
+++

## Tomcat Manager(HTMLManager) 활성화 및 사용법

Tomcat 설치 시 `webapps/manager` 폴더에 기본 포함된 웹 관리 도구. WAR 파일을 브라우저에서 바로 배포 가능.

**활성화**: `conf/tomcat-users.xml`에서 role/user 추가

```xml
<role rolename="manager"/>
<role rolename="standard"/>
<user username="admin" password="비밀번호" roles="standard,manager"/>
```

**접속**: `http://호스트:포트/manager/html`

**주요 기능**

- Applications 목록: 현재 배포된 webapp들과 상태 표시
- 각 앱마다 Start/Stop/Reload/Undeploy 가능
- 하단 Deploy 영역에서 WAR 파일 업로드 후 바로 배포 가능(FTP 없이)

원문: [https://blog.managr.us/entry/Apache-Tomcat](https://blog.managr.us/entry/Apache-Tomcat)
