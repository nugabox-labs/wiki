+++
title = "JVM 메모리 튜닝 Heap·PermGen"
date = 2020-09-18T11:55:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "BACK-END"]
tags = ["JAVA", "WAS"]
toc = true

[extra]
source = "notion"
notion_id = "ac4abce0-8af0-4e45-822b-e0a274424d32"
notion_url = "https://app.notion.com/p/JVM-Heap-PermGen-ac4abce08af04e45822be0a274424d32"
external_url = "https://epthffh.tistory.com/entry/JVM-%EB%A9%94%EB%AA%A8%EB%A6%AC-%EA%B4%80%EB%A0%A8-%EC%84%A4%EC%A0%95"
+++

## PermGen OOM

`java.lang.OutOfMemoryError: PermGen space` — Class/Method 메타 공간 부족(Spring·MyBatis 등 동적 클래스 다수 로드 시).

- Java 8+: PermGen 폐지 → Metaspace (`-XX:MetaspaceSize`, `-XX:MaxMetaspaceSize`)

## 옵션 예 (Java 7 이하)

```bash
JAVA_OPTS="-Djava.awt.headless=true -Dfile.encoding=UTF-8 -server \
  -Xms1024m -Xmx1024m -XX:NewSize=512m -XX:MaxNewSize=512m \
  -XX:PermSize=512m -XX:MaxPermSize=512m -XX:+DisableExplicitGC"
```

## 주요 옵션

- `-Xms` / `-Xmx`: 힙 초기·최대 — 운영은 동일값 권장(확장 시 GC·할당 정지 완화)
- `-XX:PermSize` / `-XX:MaxPermSize`: PermGen (MaxPermSize는 `-Xmx`와 별도 할당)
- `-XX:NewSize`: Young(Eden+Survivor) 초기 크기

## 가이드

- Heap 요구 없으면 ~1G, New:Old ≈ 1:2
- PermSize 보통 128m, 256m 초과 시 배포·패키징 점검
- Xms=Xmx: committed 도달 시 순간 정지 방지

## 대용량 예

```bash
JAVA_OPTS="-Djava.awt.headless=true -Dfile.encoding=UTF-8 -server \
  -Xms3072m -Xmx3072m -XX:NewSize=384m -XX:MaxNewSize=384m \
  -XX:PermSize=256m -XX:MaxPermSize=256m -XX:+DisableExplicitGC"
```

## JVM 구조(참고)

Class Loader → Runtime Data Areas(Heap·Stack·PermGen/Metaspace) → Execution Engine(Interpreter·JIT)
