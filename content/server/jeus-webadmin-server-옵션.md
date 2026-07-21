+++
title = "Jeus Webadmin - Server 옵션"
date = "2019-09-18T02:21:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["SERVER"]
tags = ["WAS"]
toc = true

[extra]
source = "notion"
notion_id = "2555dfda-5a41-48c6-9844-66a45e0fa0e5"
notion_url = "https://app.notion.com/p/Jeus-Webadmin-Server-2555dfda5a4148c6984466a45e0fa0e5"
+++

## Jeus 웹어드민 - Server 옵션

**JVM Config (JVM Option)**

```javascript
-Xms1024m -Xmx1024m -XX:MaxPermSize=512m   # 힙 크기 변경 시 여기
-verbose:gc
-XX:+PrintGCDetails
-XX:+PrintGCTimeStamps
-XX:+PrintGCDateStamps
-XX:+PrintHeapAtGC
-Xloggc:/home/jeus7/jeus7/logs/gclog/servername_gc.log
-XX:+HeapDumpOnOutOfMemoryError
-XX:HeapDumpPath=/home/jeus7/jeus7/logs/dump/
```

**Action On Resource Leak** (리소스 누수 감지 시 동작)

- `Warning`: 로그만 기록
- `AutoClose`: 로그 기록 + 자동 종료

**로그 설정**

- Servers > Basic Info: 로그 디렉토리 지정
- Servers > SystemLogging: 로그 레벨 설정, Handler에서 핸들러별 레벨 설정 (동적변경 마크 붙은 항목은 재기동 불필요)
- 세션 로그만 별도 관리하려면 SystemLogging에 `Jeus.session` 로거 추가 + 핸들러 추가(버퍼는 0으로 설정 권장)

**Engine - Access Log**

- Format을 `debug`로 하면 더 상세히 기록
- 경로 예: `jlog/server1/servlet/access.log`

**Engine - Session Config**

- `Timeout`: 서버 세션 유효기간(적절히 설정)
- `Shared`: 같은 서버 내 애플리케이션 간 세션 공유가 필요할 때 사용
