+++
title = "JAVA_OPTS GC·HeapDump 설정"
date = 2022-11-03T06:13:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "BACK-END", "TECH"]
tags = ["JAVA", "WAS", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "5f6a4711-3e7d-4bc2-82ec-a6c58766309d"
notion_url = "https://app.notion.com/p/JAVA_OPTS-GC-HeapDump-5f6a47113e7d4bc282eca6c58766309d"
external_url = "https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=kletgdgo&logNo=221392107035"
+++

## JAVA\_OPTS (HeapDump·GC 로그)

```bash
DATE=$(date +%Y%m%d%H%M%S)

# 공통
export JAVA_OPTS="$JAVA_OPTS -XX:+HeapDumpOnOutOfMemoryError"
export JAVA_OPTS="$JAVA_OPTS -XX:HeapDumpPath=$INSTANCE_BASE/logs/heapDump_$DATE.hprof"
export JAVA_OPTS="$JAVA_OPTS -XX:-OmitStackTraceInFastThrow"
# export JAVA_OPTS="$JAVA_OPTS -XX:OnOutOfMemoryError=/app/scripts/oom.sh"

# Java 8 GC 로그
export JAVA_OPTS="$JAVA_OPTS -XX:+PrintGCDetails"
export JAVA_OPTS="$JAVA_OPTS -XX:+PrintGCTimeStamps"
export JAVA_OPTS="$JAVA_OPTS -XX:+PrintGCDateStamps"
export JAVA_OPTS="$JAVA_OPTS -Xloggc:$INSTANCE_BASE/logs/gc_$DATE.log"
export JAVA_OPTS="$JAVA_OPTS -XX:+UseGCLogFileRotation"
export JAVA_OPTS="$JAVA_OPTS -XX:NumberOfGCLogFiles=10"
export JAVA_OPTS="$JAVA_OPTS -XX:GCLogFileSize=10M"
export JAVA_OPTS="$JAVA_OPTS -XX:+UseParallelGC"
export JAVA_OPTS="$JAVA_OPTS -XX:+ExplicitGCInvokesConcurrent"

# Java 9+ 예
# export JAVA_OPTS="$JAVA_OPTS -Xlog:gc*:file=$INSTANCE_BASE/logs/gc_$DATE.log:time,uptime:filecount=10,filesize=10M"
```

- WildFly: `standalone.conf`에 동일 `export JAVA_OPTS=...`
- Spring Boot: 기동 스크립트 / `JAVA_TOOL_OPTIONS`
