+++
title = "Java GC 튜닝"
date = 2023-11-23T02:07:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END", "TECH"]
tags = ["JAVA", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "3f370ff8-363a-45a3-a5d6-049ad4c3a890"
notion_url = "https://app.notion.com/p/Java-GC-3f370ff8363a45a3a5d6049ad4c3a890"
external_url = "https://johngrib.github.io/wiki/java/gc/tuning-guide/"
+++

Oracle HotSpot GC Tuning Guide 요약 (Java 8~17).

## 기본 수집기

| Java | 기본 GC |
| --- | --- |
| 8 | Parallel GC |
| 9+ | G1 GC |

## 수집기 선택

```bash
-XX:+UseSerialGC
-XX:+UseParallelGC
-XX:+UseConcMarkSweepGC   # Java 8 CMS (9+ deprecated)
-XX:+UseG1GC
-XX:+UseZGC               # 11+
-XX:+UseShenandoahGC
```

## Heap

```bash
-Xms<size> -Xmx<size>
-XX:NewRatio=<n>
-XX:SurvivorRatio=<n>
-XX:MetaspaceSize=<size> -XX:MaxMetaspaceSize=<size>
```

## G1

```bash
-XX:MaxGCPauseMillis=<ms>
-XX:G1HeapRegionSize=<size>
-XX:InitiatingHeapOccupancyPercent=<pct>
```

## GC 로그

```bash
# Java 8
-XX:+PrintGCDetails -Xloggc:gc.log -XX:+UseGCLogFileRotation \
  -XX:NumberOfGCLogFiles=10 -XX:GCLogFileSize=10M

# Java 9+
-Xlog:gc*:file=gc.log:time,uptime,level,tags:filecount=10,filesize=10M
```

## OOM 덤프

```bash
-XX:+HeapDumpOnOutOfMemoryError
-XX:HeapDumpPath=/path/heap.hprof
```
