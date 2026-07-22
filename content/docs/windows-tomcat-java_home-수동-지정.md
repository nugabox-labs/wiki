+++
title = "Windows Tomcat JAVA_HOME 수동 지정"
date = 2022-09-01T08:59:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER", "BACK-END", "TECH"]
tags = ["WINDOWS", "JAVA", "WAS", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "0e690083-6943-4879-b656-07a3a4eacf69"
notion_url = "https://app.notion.com/p/Windows-Tomcat-JAVA_HOME-0e69008369434879b65607a3a4eacf69"
external_url = "https://fromisnine.tistory.com/90"
+++

`%CATALINA_HOME%\bin\catalina.bat` 상단(주석 아래)에 JDK 경로 지정.

```shell
set "JAVA_HOME=C:\Program Files\Java\jdk1.8.0_202"
set "JRE_HOME=C:\Program Files\Java\jdk1.8.0_202"
```

- `JAVA_HOME=` 뒤·경로 앞뒤 공백 금지
- `set "VAR=경로"` 형태 유지
- 경로는 서버 JDK로 교체
