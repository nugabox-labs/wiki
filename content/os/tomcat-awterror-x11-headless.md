+++
title = "Tomcat AWTError X11 headless"
date = 2022-09-10T16:08:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER", "BACK-END", "TECH"]
tags = ["WAS", "JAVA", "ISSUE", "LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "3f2aa2de-20df-42b2-98ce-138f8ce76929"
notion_url = "https://app.notion.com/p/Tomcat-AWTError-X11-headless-3f2aa2de20df42b298ce138f8ce76929"
external_url = "https://soye0n.tistory.com/67"
+++

## 증상

Tomcat 기동 후 404. `catalina.out`에:

```
java.awt.AWTError: Can't connect to X11 window server using 'localhost:10.0'
```

Captcha 등 `BufferedImage` / AWT 사용 시 흔함 (헤드리스 서버).

## 해결 (JRE 1.4+)

`catalina.sh` **맨 위**에 추가 후 재기동:

```bash
export JAVA_OPTS="$JAVA_OPTS -Djava.awt.headless=true"
```

> `CATALINA_OPTS` 아래에만 넣으면 무시되는 경우가 있음 → 파일 상단 export 권장.

JRE 1.3 이하는 Xvfb 등 가상 디스플레이 필요.
