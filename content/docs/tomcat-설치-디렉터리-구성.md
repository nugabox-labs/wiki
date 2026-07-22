+++
title = "Tomcat 설치 디렉터리 구성"
date = 2023-03-16T05:44:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "BACK-END"]
tags = ["WAS", "JAVA"]
toc = true

[extra]
source = "notion"
notion_id = "6c6c616b-c5f3-44af-af16-4069c54246a1"
notion_url = "https://app.notion.com/p/Tomcat-6c6c616bc5f344afaf164069c54246a1"
external_url = "https://linux.systemv.pe.kr/tomcat-%EC%84%A4%EC%B9%98-%EB%94%94%EB%A0%89%ED%86%A0%EB%A6%AC-%EA%B5%AC%EC%84%B1/"
+++

## 주요 디렉터리

| 경로 | 역할 |
| --- | --- |
| `bin/` | 기동/종료 (`startup.sh`, `catalina.sh`) |
| `conf/` | `server.xml`, `web.xml`, `context.xml`, `tomcat-users.xml` |
| `lib/` | 공통 JAR |
| `logs/` | catalina / [localhost](http://localhost/) 로그 |
| `webapps/` | 배포 WAR·앱 |
| `work/` | JSP 컴파일 결과 |
| `temp/` | 임시 파일 |
