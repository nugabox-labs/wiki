+++
title = "OutOfMemoryError GC overhead limit exceeded"
date = 2020-06-08T10:34:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END"]
tags = ["JAVA"]
toc = true

[extra]
source = "notion"
notion_id = "5237b88b-65dd-4e5c-8fca-4dc8df4c1ad6"
notion_url = "https://app.notion.com/p/OutOfMemoryError-GC-overhead-limit-exceeded-5237b88b65dd4e5c8fca4dc8df4c1ad6"
+++

## 증상

```
java.lang.OutOfMemoryError: GC overhead limit exceeded
```

## 원인

GC가 힙을 거의 회수하지 못함 — CPU의 약 98%를 GC에 쓰는데도 회수가 2% 미만이면 JVM이 강제 발생(누수 또는 힙 부족).

## 조치

```bash
java -Xms512m -Xmx2048m -jar app.jar
```

- Tomcat: `catalina.sh` / `setenv.sh`에 `JAVA_OPTS="-Xms512m -Xmx2048m"`
- 누수 의 시:

```bash
-XX:+HeapDumpOnOutOfMemoryError
-XX:HeapDumpPath=/path/heap.hprof
```

힙 덤프로 잔류 객체 분석.
