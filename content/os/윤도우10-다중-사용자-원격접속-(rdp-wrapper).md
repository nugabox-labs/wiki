+++
title = "윤도우10 다중 사용자 원격접속 (RDP Wrapper)"
date = 2023-03-11T13:57:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS"]
tags = ["WINDOWS"]
toc = true

[extra]
source = "notion"
notion_id = "4375134c-3a23-40df-9bdb-399174871882"
notion_url = "https://app.notion.com/p/10-RDP-Wrapper-4375134c3a2340df9bdb399174871882"
external_url = "https://syki66.github.io/blog/2020/04/08/rdp-wapper.html"
+++

## RDP Wrapper로 윈도우10 다중 사용자 원격접속

기본적으로 윈도우 원격 데스크톱은 PC당 1명만 접속 가능(다른 사용자 접속 시 기존 세션 강제 로그아웃). RDP Wrapper로 여러 명이 동시에 리소스(CPU/RAM/GPU)를 공유해서 접속 가능.

1. [RDP Wrapper](https://github.com/stascorp/rdpwrap/releases) zip 다운로드 (크롬 세이프 브라우징 꺼야 다운로드됨)
1. 압축 해제 후 `install.bat` → `update.bat` 순으로 실행 (안 되면 관리자 권한으로)
1. `RDPConf.exe` 실행 → 버전 아래 `not supported`면 자기 윈도우 버전에 맞는 `rdpwrap.ini` 검색/다운로드
1. 관리자 권한 CMD에서:

```shell
net stop termservice
```

`C:\Program Files\RDP Wrapper`의 `rdpwrap.ini`를 다운로드한 파일로 교체 후:

```shell
net start termservice
```

1. 재부팅 권장. `RDPConf.exe`에서 `fully supported`로 바뀌면 정상 작동
1. 작업 관리자 > 사용자 탭에서 접속자 목록/리소스 확인, 원치 않는 사용자는 메시지 전송 또는 강제 연결 끊기 가능

원문: [https://syki66.github.io/blog/2020/04/08/rdp-wapper.html](https://syki66.github.io/blog/2020/04/08/rdp-wapper.html)
