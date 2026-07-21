+++
title = "Spring 개발환경 셋팅 (Eclipse EE+STS+Tomcat)"
date = "2019-09-26T18:09:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["BACK-END"]
tags = ["JAVA"]
toc = true

[extra]
source = "notion"
notion_id = "e58d7927-dccf-4bdb-97ad-2b94d7c1ad10"
notion_url = "https://app.notion.com/p/Spring-Eclipse-EE-STS-Tomcat-e58d7927dccf4bdb97ad2b94d7c1ad10"
external_url = "https://boxfoxs.tistory.com/334"
+++

## Spring 개발환경 셋팅 (Eclipse EE + STS + Tomcat)

1. **Eclipse EE** 설치 (Java EE 개발용): [https://eclipse.org/downloads/packages/](https://eclipse.org/downloads/packages/)
1. **STS(Spring Tool Suite)** 설치: Help > Eclipse Marketplace 에서 "sts" 검색 후 설치 (Maven 내장돼 있어 별도 설치 불필요)
1. **Tomcat 설치**: [tomcat.apache.org](http://tomcat.apache.org/) 에서 원하는 버전(zip/installer) 다운로드
1. **Eclipse에 Tomcat 연동**: Window > Preferences > Server > Runtime Environment > Add → Tomcat 버전 선택, 경로/JRE 지정 후 Finish
1. **Spring 프로젝트 생성**: File > New > Other > Spring > Legacy Project → 프로젝트명 입력 → Spring MVC Project 선택 → 패키지명 입력 → Finish
1. **서버 구동**: 프로젝트 우클릭 > Run As > Run on Server → 등록한 Tomcat 서버 선택

**⚠️ servlet-context.xml 오류 시**: pom.xml에 아래 dependency 추가

```xml
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-context</artifactId>
    <version>3.1.0.RELEASE</version>
</dependency>
```

원문: [https://boxfoxs.tistory.com/334](https://boxfoxs.tistory.com/334)
