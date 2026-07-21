+++
title = "CI (Continuous Integration)"
date = 2022-04-27T13:56:00Z
updated = 2026-07-21T06:47:00Z
categories = ["DEV-OPS", "TECH"]
tags = ["GIT/SVN", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "cd3935fd-6df6-4c35-841a-60d09290f34f"
notion_url = "https://app.notion.com/p/CI-Continuous-Integration-cd3935fd6df64c35841a60d09290f34f"
external_url = "https://helloworld-88.tistory.com/50"
+++

## CI (Continuous Integration)

팀원이 SCM(Git/SVN)에 올린 코드를 **주기적으로 통합·빌드·테스트**. CI 서버가 커밋을 폴링해 컴파일·단위테스트·정적분석 후 피드백.

### 핵심 구성요소

| 구분 | 역할 | 예 |
| --- | --- | --- |
| CI Server | 빌드 프로세스 관리 | Jenkins, Travis CI |
| SCM | 소스 형상관리 | Git, Subversion |
| Build Tool | 컴파일·패키징 | Maven, Gradle, Ant |
| Test Tool | 자동 테스트 | JUnit, Mocha |

### 자동화 절차

1. 소스 → 바이너리 컴파일
1. 배포 형태로 패키징
1. 단위 테스트
1. 정적 분석
1. 결과 리포팅
1. 테스트 서버 배포
