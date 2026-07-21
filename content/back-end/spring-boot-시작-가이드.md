+++
title = "Spring Boot 시작 가이드"
date = 2023-11-10T04:51:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END"]
tags = ["JAVA"]
toc = true

[extra]
source = "notion"
notion_id = "8cb78c8f-bd8d-4b07-a5cd-70ef8deb63da"
notion_url = "https://app.notion.com/p/Spring-Boot-8cb78c8fbd8d4b07a5cd70ef8deb63da"
+++

## Spring Boot 요약

- Spring: Java 엔터프라이즈 경량 프레임워크
- Spring Boot: 자동 설정 + 내장 웹서버 + executable JAR

## 프로젝트 생성 ([start.spring.io](http://start.spring.io/))

1. Gradle/Maven, Java/Kotlin 선택
1. Spring Boot 버전 (JDK 8 → 2.x 권장)
1. Group/Artifact/Package 입력
1. Dependencies 선택 (Web, JPA 등)
1. GENERATE → 압축 해제 → IDE Open
1. `DemoApplication.main()` 실행

## Gradle vs Maven

- Gradle: 스크립트 가독성·빌드 속도 우수 (현재 추세)

## 실행

```bash
./gradlew bootRun
# 또는 JAR
./gradlew build && java -jar build/libs/*.jar
```
