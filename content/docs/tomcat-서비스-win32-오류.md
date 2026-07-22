+++
title = "Tomcat 서비스 Win32 오류"
date = 2022-09-01T07:13:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER", "TECH"]
tags = ["WAS", "WINDOWS", "ISSUE"]
toc = true

[extra]
source = "notion"
notion_id = "8c1e135f-b831-4f34-9821-0d41f1922c0a"
notion_url = "https://app.notion.com/p/Tomcat-Win32-8c1e135fb8314f3498210d41f1922c0a"
external_url = "https://rios.tistory.com/entry/Tomcat-%EC%84%9C%EB%B9%84%EC%8A%A4-%EB%93%B1%EB%A1%9D-%ED%9B%84-%EC%8B%A4%ED%96%89-%EC%97%90%EB%9F%AC-1%EC%9D%80-%EC%98%AC%EB%B0%94%EB%A5%B8-Win32-%EC%9D%91%EC%9A%A9-%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%A8%EC%9D%B4-%EC%95%84%EB%8B%99%EB%8B%88%EB%8B%A4"
+++

## 증상

```bash
service.bat install serviceName
```

서비스 실행 시: **올바른 Win32 응용 프로그램이 아닙니다.**

## 원인

Tomcat 8 이하 `prunsrv.exe` 기본이 **32bit**. 64bit OS와 불일치.

## 해결

1. 64bit `prunsrv.exe` 확보 (Tomcat 배포 `amd64`/`x64`)
1. `$TOMCAT_HOME/bin/prunsrv.exe`를 64bit로 교체
1. 서비스 재등록

```bash
service.bat uninstall serviceName
service.bat install serviceName
```

## 참고 로그/메모
