+++
title = "PowerShell 스크립트 실행 오류"
date = "2022-08-18T14:10:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["OS"]
tags = ["WINDOWS"]
toc = true

[extra]
source = "notion"
notion_id = "b19a2c0a-b008-4d4a-8e46-04d4f5383bcf"
notion_url = "https://app.notion.com/p/PowerShell-b19a2c0ab0084d4a8e4604d4f5383bcf"
external_url = "https://www.leafcats.com/317"
+++

## PowerShell "이 시스템에서 스크립트를 실행할 수 없으므로..." 에러

- 원인: 스크립트 실행 정책(ExecutionPolicy)이 막혀 있음

```powershell
# 관리자 권한 PowerShell에서
Set-ExecutionPolicy RemoteSigned
```

원문: [https://www.leafcats.com/317](https://www.leafcats.com/317)
