+++
title = "APR, Tomcat Native Library"
date = 2020-01-23T09:57:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["WAS"]
toc = true

[extra]
source = "notion"
notion_id = "89028882-8d29-4df8-ba58-44862354ba02"
notion_url = "https://app.notion.com/p/APR-Tomcat-Native-Library-890288828d294df8ba5844862354ba02"
+++

## APR (Apache Portable Runtime) / Tomcat Native Library

- Tomcat이 OS 네이티브(C) 라이브러리를 통해 소켓/SSL 등을 처리하도록 하는 확장. 순수 Java 구현보다 성능(특히 SSL, 대규모 커넥션 처리) 향상
- 설치 시 Tomcat 시작 로그에 `Loaded APRLifecycleListener` 관련 메시지로 활성화 여부 확인 가능
- 미설치 시에도 Tomcat은 정상 동작(NIO 등 다른 Connector 사용), APR은 선택적 성능 최적화 요소

참고: [https://sarc.io/index.php/tomcat/899-apr-apache-portable-runtime-tomcat-native-library](https://sarc.io/index.php/tomcat/899-apr-apache-portable-runtime-tomcat-native-library) , [https://toma0912.tistory.com/61](https://toma0912.tistory.com/61) , [https://hengki.net/63](https://hengki.net/63)
