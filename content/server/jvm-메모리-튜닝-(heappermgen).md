+++
title = "JVM 메모리 튜닝 (Heap/PermGen)"
date = "2020-09-18T11:55:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["SERVER"]
tags = ["WAS"]
toc = true

[extra]
source = "notion"
notion_id = "ac4abce0-8af0-4e45-822b-e0a274424d32"
notion_url = "https://app.notion.com/p/JVM-Heap-PermGen-ac4abce08af04e45822be0a274424d32"
external_url = "https://epthffh.tistory.com/entry/JVM-%EB%A9%94%EB%AA%A8%EB%A6%AC-%EA%B4%80%EB%A0%A8-%EC%84%A4%EC%A0%95"
+++

## JVM 메모리 튜닝

**PermGen space OOM** (`java.lang.OutOfMemoryError: PermGen space`)

- Class/Method 객체를 저장하는 PermGen 공간 부족 시 발생. 너무 많은 class를 로드할 때(Spring, MyBatis 등 동적 클래스 생성 프레임워크에서 주로) 발생
- Java 8부터는 PermGen이 폐지되고 Metaspace로 대체(`-XX:MetaspaceSize`, `-XX:MaxMetaspaceSize` 사용)

**기본 옵션 설정 예 (Java 7 이하)**

```bash
JAVA_OPTS="-Djava.awt.headless=true -Dfile.encoding=UTF-8 -server \
-Xms1024m -Xmx1024m -XX:NewSize=512m -XX:MaxNewSize=512m \
-XX:PermSize=512m -XX:MaxPermSize=512m -XX:+DisableExplicitGC"
```

**주요 옵션**

- `-Xms`: 힙 초기 크기 / `-Xmx`: 힙 최대 크기 — **운영 환경에서는 동일값 권장**(동적 확장 시 GC 정지 오버헤드 방지)
- `-XX:PermSize`/`-XX:MaxPermSize`: Permanent Generation 초기/최대 크기 (MaxPermSize는 `-Xmx`와 별도로 추가 할당됨. 예: Xmx256m + MaxPermSize256m = 최대 512m)
- `-XX:NewSize`: Eden+Survivor(Young 영역) 초기 크기

**권장 가이드라인**

- 전체 Heap은 요구사항 없으면 1G 내외가 무난, New:Old 비율은 서버 앱 기준 1:2가 적절
- PermSize는 보통 128m, 크더라도 256m 넘으면 배포/패키징 점검 필요
- Xms=Xmx로 맞추는 이유: committed 도달 시 신규 메모리 할당하며 WAS가 순간 멈추는(약 1초) 현상 방지

**예시 (대용량 서버, 여러 프로젝트 호스팅)**

```bash
JAVA_OPTS="-Djava.awt.headless=true -Dfile.encoding=UTF-8 -server \
-Xms3072m -Xmx3072m -XX:NewSize=384m -XX:MaxNewSize=384m \
-XX:PermSize=256m -XX:MaxPermSize=256m -XX:+DisableExplicitGC"
```

## JVM 구조 참고

- Class Loader: 런타임에 클래스를 메모리에 로드
- Runtime Data Areas: OS로부터 할당받은 실행 메모리 공간(Heap, Stack, PermGen/Metaspace 등)
- Execution Engine: 바이트코드를 실행 (초기엔 Interpreter 방식, JIT 컴파일러로 속도 개선)

원문: [https://epthffh.tistory.com/entry/JVM-메모리-관련-설정](https://epthffh.tistory.com/entry/JVM-메모리-관련-설정) (참고: [nextree.co.kr](http://nextree.co.kr/), [bcho.tistory.com/788](http://bcho.tistory.com/788) 등)
