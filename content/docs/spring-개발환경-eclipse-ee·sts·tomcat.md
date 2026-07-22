+++
title = "Spring 개발환경 Eclipse EE·STS·Tomcat"
date = 2019-09-26T18:09:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END"]
tags = ["JAVA"]
toc = true

[extra]
source = "notion"
notion_id = "e58d7927-dccf-4bdb-97ad-2b94d7c1ad10"
notion_url = "https://app.notion.com/p/Spring-Eclipse-EE-STS-Tomcat-e58d7927dccf4bdb97ad2b94d7c1ad10"
external_url = "https://boxfoxs.tistory.com/334"
+++

## 구성

1. **Eclipse EE** — [eclipse.org/downloads/packages](https://eclipse.org/downloads/packages/)
1. **STS** — Help → Eclipse Marketplace → "sts" 검색·설치 (Maven 내장)
1. **Tomcat** — [tomcat.apache.org](https://tomcat.apache.org/) zip/installer
1. **연동** — Window → Preferences → Server → Runtime Environment → Add → Tomcat 경로·JRE
1. **프로젝트** — File → New → Other → Spring → Legacy Project → Spring MVC Project
1. **실행** — 프로젝트 우클릭 → Run As → Run on Server

## servlet-context.xml 오류 시

`pom.xml`에 추가:

```xml
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-context</artifactId>
    <version>3.1.0.RELEASE</version>
</dependency>
```
