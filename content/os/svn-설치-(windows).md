+++
title = "SVN 설치 (Windows)"
date = 2023-03-11T13:27:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS", "DEV-OPS"]
tags = ["GIT/SVN", "WINDOWS"]
toc = true

[extra]
source = "notion"
notion_id = "8bb7d9d8-5022-4963-b720-d9b61e1bfe54"
notion_url = "https://app.notion.com/p/SVN-Windows-8bb7d9d850224963b720d9b61e1bfe54"
+++

## SVN Server (VisualSVN)

- SVN 서버용 PC에 VisualSVN 설치 (기본 443포트)
- Repository 생성 → 유저/그룹 생성
- 레포지토리 우클릭 > Properties에서 유저 권한 설정

## SVN Client (TortoiseSVN)

- 탐색기 통합용 TortoiseSVN + Language Pack 설치
- Repository Browser 접속: `http://192.168.x.x/svn/레포지토리이름` (안되면 `192.168.x.x:443/svn/레포지토리이름`)
- 좌측 폴더 우클릭 > Checkout (전체 또는 파일 개별 가능)
- 파일 우클릭 > Show Log (리비전/버전별 로그)
- 저장할 파일은 Commit, 저장소 버전으로 갱신은 Update
- Eclipse: Eclipse Marketplace에서 Subversion 플러그인 설치 후 주소 입력해 레포지토리 연결

## 용어

→ [SVN-용어 설명](https://app.notion.com/p/cbe918e034cb484bb3d6a00aba558fa0) 참고
