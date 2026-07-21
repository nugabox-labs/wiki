+++
title = "스프링 프로젝트 설정 메모 (Maven/패키지구조)"
date = 2019-09-26T08:55:00Z
updated = 2026-07-21T02:37:00Z
categories = ["BACK-END"]
tags = ["JAVA"]
toc = true

[extra]
source = "notion"
notion_id = "54935f03-44e0-451b-8eb5-98df0227b545"
notion_url = "https://app.notion.com/p/Maven-54935f0344e0451b8eb598df0227b545"
external_url = "https://addio3305.tistory.com/33"
+++

## 스프링 프로젝트 설정 메모

기본 IDE/서버 설치는 [Spring 개발환경 셋팅](https://app.notion.com/p/e58d7927dccf4bdb97ad2b94d7c1ad10) 참고. 여기는 추가 팁:

**Maven 설정**

- Maven repository 위치: `settings.xml`에서 설정
- 이클립스 Maven 설정에서 User Setting 지정
- SVN Connector 설치 후, 이클립스 Team 설정에서 `*/target/*` 제외 처리 권장

**프로젝트 생성**

- package는 최소 3레벨 이상으로 구성 (`[1레벨].[2레벨].[3레벨]`, 예: `com.company.first`)
- Maven Dependencies: 필요한 라이브러리를 Maven이 자동으로 받아와 로컬 Repository 폴더에 저장. 추가/삭제 관리는 `pom.xml`에서

원문: [https://addio3305.tistory.com/33](https://addio3305.tistory.com/33)
