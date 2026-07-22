+++
title = "Tomcat catalina.out 날짜별 분리"
date = 2020-11-18T18:36:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["WAS"]
toc = true

[extra]
source = "notion"
notion_id = "088a221e-974d-4fd3-926b-f108ae79a6c0"
notion_url = "https://app.notion.com/p/Tomcat-catalina-out-088a221e974d4fd3926bf108ae79a6c0"
external_url = "https://roadrunner.tistory.com/634"
+++

## 개요

기본 실행 로그는 `catalina.out`에 누적 → 방치 시 파일 비대화. `[CATALINA_HOME]/bin/catalina.sh`에서 아래를 수정:

```bash
touch "$CATALINA_OUT"
>> "$CATALINA_OUT" 2>&1 "&"
```

## 1) catalina.out 미기록

```bash
# touch "$CATALINA_OUT"
>> /dev/null 2>&1 &
```

- 서버 상태 로그는 `catalina.yyyy-mm-dd.log`에만 남음
- 앱 로그도 catalina.out에 안 남으므로 log4j 등 별도 기록 필요

## 2) 날짜별 파일 (심플)

```bash
>> "$CATALINA_OUT".$(date '+%Y-%m-%d') 2>&1 &
```

→ `catalina.out.yyyy-mm-dd`

## 3) rotatelogs (권장)

```bash
"2>&1" | /usr/sbin/rotatelogs "$CATALINA_OUT".%Y-%m-%d.log 86400 540 "&"
```

- `86400`: 1일 / `540`: KST(+9h) 오프셋(초)
