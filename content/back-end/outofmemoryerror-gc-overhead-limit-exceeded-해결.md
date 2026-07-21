+++
title = "OutOfMemoryError: GC overhead limit exceeded 해결"
date = "2020-06-08T10:34:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["BACK-END"]
tags = ["JAVA"]
toc = true

[extra]
source = "notion"
notion_id = "5237b88b-65dd-4e5c-8fca-4dc8df4c1ad6"
notion_url = "https://app.notion.com/p/OutOfMemoryError-GC-overhead-limit-exceeded-5237b88b65dd4e5c8fca4dc8df4c1ad6"
+++

## java.lang.OutOfMemoryError: GC overhead limit exceeded

- 원인: GC(가비지 컬렉션)가 힙 메모리를 거의 회수하지 못하면서 CPU 시간의 98% 이상을 GC에 쓰는데도 회수되는 메모리가 2% 미만일 때 JVM이 강제로 발생시키는 에러 (메모리 누수 또는 힙 부족)
- 해결
  - JVM 힙 크기 늘리기: `-Xms`(초기 힙), `-Xmx`(최대 힙) 옵션 조정

```bash
java -Xms512m -Xmx2048m -jar app.jar
```

- Tomcat이면 `catalina.sh`/`setenv.sh`에 `JAVA_OPTS="-Xms512m -Xmx2048m"` 추가
- 근본 원인이 메모리 누수라면 힙 덤프(`-XX:+HeapDumpOnOutOfMemoryError`)를 떠서 원인 객체 분석 필요
