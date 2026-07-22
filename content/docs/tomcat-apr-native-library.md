+++
title = "Tomcat APR Native Library"
date = 2020-01-23T09:57:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["WAS"]
toc = true

[extra]
source = "notion"
notion_id = "89028882-8d29-4df8-ba58-44862354ba02"
notion_url = "https://app.notion.com/p/Tomcat-APR-Native-Library-890288828d294df8ba5844862354ba02"
external_url = "https://sarc.io/index.php/tomcat/899-apr-apache-portable-runtime-tomcat-native-library"
+++

Tomcat이 OS 네이티브(C) 라이브러리로 소켓·SSL 등을 처리하는 확장. 순수 Java Connector보다 성능(특히 SSL·대량 커넥션)이 나아질 수 있음.

- 기동 로그에 `Loaded APRLifecycleListener` 등이 보이면 활성
- 미설치여도 Tomcat은 NIO 등으로 정상 동작 (선택적 최적화)

참고: [sarc.io APR](https://sarc.io/index.php/tomcat/899-apr-apache-portable-runtime-tomcat-native-library) · [toma0912](https://toma0912.tistory.com/61) · [hengki](https://hengki.net/63)
