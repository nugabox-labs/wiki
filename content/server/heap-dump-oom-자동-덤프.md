+++
title = "Heap Dump OOM 자동 덤프"
date = 2019-09-19T01:30:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["WAS"]
toc = true

[extra]
source = "notion"
notion_id = "b869e2af-c639-410b-a482-0a4166c5fa95"
notion_url = "https://app.notion.com/p/Heap-Dump-OOM-b869e2afc639410ba4820a4166c5fa95"
external_url = "https://www.eclipse.org/mat/"
+++

## OOM 시 자동 Heap Dump

```bash
java -Xms128m -Xmx128m \
  -XX:+HeapDumpOnOutOfMemoryError \
  -XX:HeapDumpPath=/home/jeus7/OOM/heapdump/ \
  -verbose:gc -Xloggc:/home/jeus7/OOM/gc.log \
  -XX:+PrintGCDetails -XX:+PrintGCTimeStamps \
  -classpath . HoldMemoryOOM
```

- `-Xms`/`-Xmx`: 힙 최소·최대
- `-XX:+HeapDumpOnOutOfMemoryError`: OOM 시 `.hprof` 자동 생성
- `-XX:HeapDumpPath`: 덤프 저장 경로

OOM 출력 예:

```
java.lang.OutOfMemoryError: Java heap space
Dumping heap to /home/jeus7/OOM/heapdump/java_pid4791.hprof ...
Heap dump file created [166556043 bytes in 0.979 secs]
```

분석: Eclipse Memory Analyzer(MAT), IBM Heap Analyzer 등으로 `.hprof` 열어 누수 객체 확인.
