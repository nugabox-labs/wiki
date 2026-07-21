+++
title = "Tomcat J2EE/Java EE Web modules 버전 불일치 에러 해결"
date = "2021-02-02T17:13:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["BACK-END"]
tags = ["JAVA"]
toc = true

[extra]
source = "notion"
notion_id = "cf071ecc-145b-4a8d-b6be-8f5fa12c7146"
notion_url = "https://app.notion.com/p/Tomcat-J2EE-Java-EE-Web-modules-cf071ecc145b4a8db6be8f5fa12c7146"
+++

## "Tomcat version 8.5 only supports J2EE 1.2 ~ Java EE 7 Web modules" 에러 해결

- Eclipse 프로젝트의 Dynamic Web Module 버전이 사용 중인 Tomcat이 지원하는 범위를 벗어날 때 발생 (Tomcat 8.5는 최대 Java EE 7까지 지원, 8 이상은 Tomcat 9+ 필요)
- 해결: 프로젝트 우클릭 > Properties > Project Facets 에서 Dynamic Web Module 버전을 Tomcat이 지원하는 범위(예: 3.1)로 낮추거나, Tomcat 버전을 프로젝트에 맞는 상위 버전(9 이상)으로 교체
- `.settings/org.eclipse.wst.common.project.facet.core.xml` 파일에서 직접 `<installed facet="jst.web" version="..."/>` 값을 수정하는 방법도 있음
