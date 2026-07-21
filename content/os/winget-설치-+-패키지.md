+++
title = "Winget 설치 + 패키지"
date = "2023-06-29T09:27:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["OS"]
tags = ["WINDOWS"]
toc = true

[extra]
source = "notion"
notion_id = "9fbc7612-c29b-4fb8-9c69-2c8b48db5c7a"
notion_url = "https://app.notion.com/p/Winget-9fbc7612c29b4fb89c692c8b48db5c7a"
+++

## Winget 설치

```powershell
# 관리자 권한 PowerShell
Install-Module -Name Microsoft.WinGet.Client
```

## 패키지 설치 예시

```powershell
winget install --id Git.Git -e --source winget
```
