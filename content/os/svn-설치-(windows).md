+++
title = "SVN 설치 (Windows)"
date = 2023-03-11T13:27:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "DEV-OPS"]
tags = ["GIT/SVN", "WINDOWS"]
toc = true

[extra]
source = "notion"
notion_id = "8bb7d9d8-5022-4963-b720-d9b61e1bfe54"
notion_url = "https://app.notion.com/p/SVN-Windows-8bb7d9d850224963b720d9b61e1bfe54"
+++

## SVN Server (VisualSVN)

- VisualSVN 설치 (기본 443)
- Repository 생성 → 유저/그룹 생성 → Properties에서 권한 설정

## SVN Client (TortoiseSVN)

- TortoiseSVN + Language Pack 설치
- Repository Browser: `http://192.168.x.x/svn/레포지토리이름` (실패 시 `:443` 명시)
- 폴더 우클릭 → Checkout / 파일 우클릭 → Show Log
- Commit = 저장, Update = 저장소 버전으로 갱신
- Eclipse: Marketplace Subversion 플러그인 → 주소로 레포 연결

## 용어

→ SVN 용어
