+++
title = "Windows JDK 설치 및 환경변수 설정"
date = 2020-02-27T10:47:00Z
updated = 2026-07-21T02:37:00Z
categories = ["BACK-END"]
tags = ["JAVA"]
toc = true

[extra]
source = "notion"
notion_id = "44cfc15e-1636-49d9-bea3-0e96ae444c60"
notion_url = "https://app.notion.com/p/Windows-JDK-44cfc15e163649d9bea30e96ae444c60"
external_url = "https://prolite.tistory.com/975"
+++

## Windows JDK 설치 및 환경변수 설정

1. Oracle 홈페이지에서 JDK 다운로드/설치
1. 내 PC 우클릭 > 속성 > 고급 시스템 설정 > 환경 변수
1. 시스템 변수에 새로 만들기:

```javascript
JAVA_HOME = C:\Program Files\Java\jdk1.8.0_131   (실제 JDK 설치 경로)
```

1. `Path` 변수 편집 > 새로 만들기:

```javascript
%JAVA_HOME%\bin
```

1. `CLASSPATH` 변수 새로 만들기:

```javascript
CLASSPATH = %JAVA_HOME%\lib
```

1. cmd 실행 후 확인:

```shell
java -version
javac -version
```

- 명령어가 안 먹히면 환경변수 오타/경로를 다시 확인

원문: [https://prolite.tistory.com/975](https://prolite.tistory.com/975)
