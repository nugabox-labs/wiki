+++
title = "macOS 폴더명 현지화 개념"
date = 2023-01-14T17:36:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["MACOS"]
toc = true

[extra]
source = "notion"
notion_id = "e6946230-f994-4d12-8a02-d94a88d27c75"
notion_url = "https://app.notion.com/p/macOS-e6946230f9944d128a02d94a88d27c75"
external_url = "https://velog.io/@choicore/macOS-%ED%8F%B4%EB%8D%94-%EC%9D%B4%EB%A6%84-%ED%98%84%EC%A7%80%ED%99%94-%ED%95%98%EA%B8%B0"
+++

## macOS 폴더명 현지화

- Finder 등은 실제 영문 경로(예: `Developments`)를 한국어 표시명으로 보여 줌
- 시스템 현지화 맵: `/System/Library/CoreServices/SystemFolderLocalizations` (최신 macOS는 시스템 볼륨 쓰기 불가)
- 우회: 폴더명에 `.localized` 접미사 또는 심볼릭 링크(터미널 작업에선 비권장)

참고: [Apple — Localizing Directory Names](https://developer.apple.com/library/archive/documentation/FileManagement/Conceptual/FileSystemAdvancedPT/LocalizingtheNameofaDirectory/LocalizingtheNameofaDirectory.html)
