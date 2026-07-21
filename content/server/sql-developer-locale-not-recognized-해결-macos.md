+++
title = "SQL Developer Locale not recognized 해결 macOS"
date = 2020-02-18T23:26:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["DB", "Oracle"]
toc = true

[extra]
source = "notion"
notion_id = "a33403ee-f6b3-487a-b00b-2783588996a9"
notion_url = "https://app.notion.com/p/SQL-Developer-Locale-not-recognized-macOS-a33403eef6b3487ab00b2783588996a9"
+++

## SQL Developer "Locale not recognized" 해결 (macOS)

접속 테스트 시 Locale 인식 오류가 발생하면, 설치 디렉터리의 `sqldeveloper.conf`에 JVM Locale 옵션 추가

**파일 위치**: `Contents/Resources/sqldeveloper/sqldeveloper/bin/sqldeveloper.conf`

**파일 마지막에 추가**

```javascript
AddVMOption -Duser.language=ko
AddVMOption -Duser.country=KR
```

저장 후 SQL Developer 재시작하면 정상 접속 확인 가능
