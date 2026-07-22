+++
title = "Tomcat classloader ._* 스캔 실패 해결 (macOS ExFAT)"
date = 2019-09-30T17:48:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["WAS"]
toc = true

[extra]
source = "notion"
notion_id = "fa264dd1-6bc4-48e5-9692-b6d248267782"
notion_url = "https://app.notion.com/p/Tomcat-classloader-_-macOS-ExFAT-fa264dd16bc448e59692b6d248267782"
+++

## Tomcat "Failed to scan \[...\] from classloader hierarchy" (ZipException) 해결

- 원인: macOS에서 ExFAT 등 특정 파일시스템(외장 저장장치)에 파일을 저장하면 macOS가 각 파일마다 메타데이터용 `._파일명` 숨김 파일을 자동 생성. Tomcat이 `lib` 폴더의 jar를 스캔하다 이 `._*.jar` 더미 파일까지 열려다 `ZipException: error in opening zip file` 발생
- 해결: 해당 `._*` 파일들을 삭제하면 됨

```bash
find /경로/tomcat/lib -name "._*" -delete
```

- 참고: [https://support.apple.com/kb/HT1627](https://support.apple.com/kb/HT1627)
