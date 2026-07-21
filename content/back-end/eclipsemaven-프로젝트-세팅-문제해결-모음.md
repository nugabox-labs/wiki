+++
title = "Eclipse/Maven 프로젝트 세팅 문제해결 모음"
date = "2021-01-22T07:53:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["BACK-END"]
tags = ["JAVA"]
toc = true

[extra]
source = "notion"
notion_id = "1d340659-8d8f-4c02-8869-764a0ed4d68c"
notion_url = "https://app.notion.com/p/Eclipse-Maven-1d3406598d8f4c028869764a0ed4d68c"
+++

## Eclipse/Maven 프로젝트 세팅 시 자주 겪는 문제 모음

**Tomcat 8.5 Web modules 버전 에러**

- `.settings/org.eclipse.wst.common.project.facet.core.xml`에서 `<installed facet="jst.web" version="4.0"/>` → `3.1`로 변경 후 서버 추가 → 다시 원복
- 상세: [Tomcat J2EE/Java EE Web modules 버전 불일치 에러 해결](https://app.notion.com/p/cf071ecc145b4a8db6be8f5fa12c7146)

**`Handler processing failed; ... java.lang.StackOverflowError`**

- Run > Maven Install 실행으로 해결

**의존성 관련**

- `pom.xml`에서 필요한 Dependencies 주석 해제
- Project Properties > Java Build Path > Libraries에서 Tomcat, JDK 등 경로 정확히 설정
- 이후 Run > Maven Build 실행
