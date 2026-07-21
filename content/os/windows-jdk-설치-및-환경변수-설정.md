+++
title = "Windows JDK 설치 및 환경변수 설정"
date = 2020-02-27T10:47:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "BACK-END"]
tags = ["JAVA", "WINDOWS"]
toc = true

[extra]
source = "notion"
notion_id = "44cfc15e-1636-49d9-bea3-0e96ae444c60"
notion_url = "https://app.notion.com/p/Windows-JDK-44cfc15e163649d9bea30e96ae444c60"
external_url = "https://prolite.tistory.com/975"
+++

## Windows JDK 설치 및 환경변수

1. Oracle에서 JDK 다운로드/설치
1. 내 PC 우클릭 > 속성 > 고급 시스템 설정 > 환경 변수
1. 시스템 변수 새로 만들기: `JAVA_HOME = C:\Program Files\Java\jdk1.8.0_131`
1. `Path`에 추가: `%JAVA_HOME%\bin`
1. `CLASSPATH` 새로 만들기: `%JAVA_HOME%\lib`
1. 확인: `java -version` / `javac -version`
