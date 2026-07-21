+++
title = "macOS 폴더명 현지화(Localization) 개념"
date = "2023-01-14T17:36:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["OS"]
tags = ["MACOS"]
toc = true

[extra]
source = "notion"
notion_id = "e6946230-f994-4d12-8a02-d94a88d27c75"
notion_url = "https://app.notion.com/p/macOS-Localization-e6946230f9944d128a02d94a88d27c75"
external_url = "https://velog.io/@choicore/macOS-%ED%8F%B4%EB%8D%94-%EC%9D%B4%EB%A6%84-%ED%98%84%EC%A7%80%ED%99%94-%ED%95%98%EA%B8%B0"
+++

## macOS 폴더명 현지화(Localization) 개념

- macOS 기본 앱(Finder 등)은 실제 영문 폴더명(예: `Developments`)을 한국어(예: "개발")로 표시해주는 현지화 기능이 있음
- 현지화 정보는 `/System/Library/CoreServices/SystemFolderLocalizations` 안의 plist 파일(`<key>`,`<string>` 쌍)에 있으나, 최신 macOS는 시스템 볼륨 쓰기 권한이 막혀 있어 직접 수정 불가
- 대안(흉내내기): 실제로는 폴더명을 `Developments.localized`처럼 `.localized` 접미사를 붙이는 방식으로 우회 가능하나, 터미널/단축키 위주 작업 환경에서는 파일명에 `.localized`가 붙는 게 불편함 → 심볼릭 링크로 우회하는 방법도 있음(저자도 실사용은 안 함)

참고: [https://developer.apple.com/library/archive/documentation/FileManagement/Conceptual/FileSystemAdvancedPT/LocalizingtheNameofaDirectory/LocalizingtheNameofaDirectory.html](https://developer.apple.com/library/archive/documentation/FileManagement/Conceptual/FileSystemAdvancedPT/LocalizingtheNameofaDirectory/LocalizingtheNameofaDirectory.html)

원문: [https://velog.io/@choicore/macOS-폴더-이름-현지화-하기](https://velog.io/@choicore/macOS-폴더-이름-현지화-하기)
