+++
title = "Spring Boot jar 구성·실행"
date = 2023-11-20T02:46:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END", "TECH"]
tags = ["JAVA", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "825b15fb-2592-44fe-8fae-11029f3ff915"
notion_url = "https://app.notion.com/p/Spring-Boot-jar-825b15fb259244fe8fae11029f3ff915"
external_url = "https://elsboo.tistory.com/27"
+++

## 빌드·실행

```bash
./gradlew bootJar          # build/libs/*.jar
java -jar app.jar
jar tf app.jar | head
unzip -p app.jar META-INF/MANIFEST.MF
```

## jar 구조

```
app.jar
├── BOOT-INF/
│   ├── classes/       # 앱 클래스
│   ├── lib/           # 의존 jar
│   ├── classpath.idx
│   └── layers.idx     # Docker layer
├── META-INF/MANIFEST.MF
│     Main-Class: org.springframework.boot.loader.JarLauncher
│     Start-Class: com.example.App
└── org/springframework/boot/loader/
```

## 실행 흐름

1. `java -jar` → `JarLauncher.main`
1. nested jar 클래스패스 구성
1. reflection으로 `Start-Class`의 `main` 호출

문서: [Spring Boot executable jar](https://docs.spring.io/spring-boot/docs/current/reference/html/executable-jar.html)
