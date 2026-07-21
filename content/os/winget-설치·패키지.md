+++
title = "Winget 설치·패키지"
date = 2023-06-29T09:27:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["WINDOWS"]
toc = true

[extra]
source = "notion"
notion_id = "9fbc7612-c29b-4fb8-9c69-2c8b48db5c7a"
notion_url = "https://app.notion.com/p/Winget-9fbc7612c29b4fb89c692c8b48db5c7a"
external_url = "https://learn.microsoft.com/en-us/windows/package-manager/winget/"
+++

## Winget 설치·패키지

### 모듈 (관리자 PowerShell)

```powershell
Install-Module -Name Microsoft.WinGet.Client
```

### 패키지 예

```powershell
winget install --id Git.Git -e --source winget
```

문서: [https://learn.microsoft.com/en-us/windows/package-manager/winget/](https://learn.microsoft.com/en-us/windows/package-manager/winget/)
