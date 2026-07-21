+++
title = "Tomcat Dynamic Web Module 버전"
date = 2021-02-02T17:13:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "BACK-END"]
tags = ["WAS", "JAVA"]
toc = true

[extra]
source = "notion"
notion_id = "cf071ecc-145b-4a8d-b6be-8f5fa12c7146"
notion_url = "https://app.notion.com/p/Tomcat-Dynamic-Web-Module-cf071ecc145b4a8db6be8f5fa12c7146"
+++

## 증상

```
Tomcat version 8.5 only supports J2EE 1.2 ~ Java EE 7 Web modules
```

Eclipse Dynamic Web Module 버전이 Tomcat 지원 범위를 초과할 때 발생. Tomcat 8.5는 최대 Java EE 7(Servlet 3.1), Servlet 4.0+는 Tomcat 9+.

## 해결

1. 프로젝트 Properties → Project Facets → Dynamic Web Module을 지원 범위(예: 3.1)로 낮춤
1. 또는 Tomcat을 프로젝트에 맞는 상위 버전(9+)으로 교체
1. `.settings/org.eclipse.wst.common.project.facet.core.xml`에서 `<installed facet="jst.web" version="..."/>` 직접 수정
