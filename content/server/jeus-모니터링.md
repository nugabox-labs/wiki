+++
title = "Jeus 모니터링"
date = 2019-09-18T06:21:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["WAS"]
toc = true

[extra]
source = "notion"
notion_id = "d7690ef8-3892-4601-82ef-79579fcf73ca"
notion_url = "https://app.notion.com/p/Jeus-d7690ef83892460182ef79579fcf73ca"
+++

## Jeus 모니터링

**웹어드민 > Monitoring 메뉴**

- Servers 모니터링, Thread 모니터링, Connection Pool 모니터링, Web 모니터링

**jeusadmin CLI** (거의 안 쓰지만 참고용)

```bash
jeusadmin -host IP:9736 -u administrator -p 비밀번호
help    # 명령어 도움말
si      # 서버 상태 확인
boot / down   # 기동/중지
```

- 콘솔모드 접속 스크립트로 만들어두면 편리: `jeusadmin -host localhost:9736 -u administrator -p 비밀번호`
