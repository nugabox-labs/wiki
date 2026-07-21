+++
title = "Tomcat catalina.out 로그 제어/날짜별 분리"
date = 2020-11-18T18:36:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["WAS"]
toc = true

[extra]
source = "notion"
notion_id = "088a221e-974d-4fd3-926b-f108ae79a6c0"
notion_url = "https://app.notion.com/p/Tomcat-catalina-out-088a221e974d4fd3926bf108ae79a6c0"
+++

## Tomcat catalina.out 로그 제어

기본적으로 Tomcat 실행 로그는 모두 `catalina.out`에 누적 기록되어 방치하면 파일이 계속 커짐. `[CATALINA_HOME]/bin/catalina.sh`에서 아래 라인을 찾아 수정:

```bash
touch "$CATALINA_OUT"
>> "$CATALINA_OUT" 2>&1 "&"
```

### 1) catalina.out에 기록 안 하기

```bash
# touch "$CATALINA_OUT"
>> /dev/null 2>&1 &
```

- 서버 상태 로그는 `catalina.yyyy-mm-dd.log`에만 기록되고 catalina.out에는 안 남음
- ⚠️ 애플리케이션 로직에서 발생하는 로그도 catalina.out에 안 남으므로 log4j 등으로 별도 기록 필요

### 2) 날짜별 파일로 분리 (심플 버전)

```bash
>> "$CATALINA_OUT".$(date '+%Y-%m-%d') 2>&1 &
```

→ `catalina.out.yyyy-mm-dd` 형식으로 매일 새 파일 생성

### 3) rotatelogs로 날짜별 로테이션 (권장, 자동 압축/보관주기 관리에 유리)

```bash
"2>&1" | /usr/sbin/rotatelogs "$CATALINA_OUT".%Y-%m-%d.log 86400 540 "&"
```

- `86400`: 로테이션 주기(초, 여기선 1일) / `540`: 타임존 오프셋(초, KST +9h)

원문: [https://roadrunner.tistory.com/634](https://roadrunner.tistory.com/634) , [https://boya.tistory.com/135](https://boya.tistory.com/135) (참고: [mycup.tistory.com/216](http://mycup.tistory.com/216), [share9.tistory.com/39](http://share9.tistory.com/39))
