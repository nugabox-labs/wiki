+++
title = "Java 8→11 전환 BASE64"
date = 2022-02-15T16:07:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END", "TECH"]
tags = ["JAVA", "ISSUE", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "34d45cf3-bf17-4544-8a9b-9739488a0a6b"
notion_url = "https://app.notion.com/p/Java-8-11-BASE64-34d45cf3bf1745448a9b9739488a0a6b"
external_url = "https://docs.microsoft.com/ko-kr/java/openjdk/transition-from-java-8-to-java-11"
+++

## 검사 도구

```bash
jdeprscan --release 11 --class-path log4j-api-2.13.0.jar my-application.jar
jdeps --jdk-internals --multi-release 11 --class-path log4j-core-2.13.0.jar my-application.jar
```

## BASE64

`sun.misc.BASE64Encoder` / `BASE64Decoder` → `java.util.Base64` (Java 8+)

## 실행 옵션

```bash
-XX:+UseParallelGC          # Java 8 기본 Parallel 패리티
-XX:+PrintCommandLineFlags
-illegal-access=warn        # 이후 deny
```

## 임시 우회

```bash
--add-exports=java.base/sun.nio.ch=ALL-UNNAMED
--add-opens=java.base/jdk.internal.loader=ALL-UNNAMED
--patch-module <module-name>=<path>
```

## 로캘 (Java 8 호환 필요 시)

```bash
-Djava.locale.providers=COMPAT,SPI
```

## ClassLoader

시스템 ClassLoader를 `URLClassLoader`로 캐스팅 금지. 부모 `null` 대신 `ClassLoader.getPlatformClassLoader()`.

## Java EE/CORBA (Java 11 제거)

해당 패키지 사용 시 외부 의존성 추가.
