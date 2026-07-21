+++
title = "PowerShell 작업 스케줄러 등록"
date = 2022-08-20T16:02:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "TECH"]
tags = ["WINDOWS", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "6ab9444d-04f4-45b1-a16c-6a3d2541901e"
notion_url = "https://app.notion.com/p/PowerShell-6ab9444d04f445b1a16c6a3d2541901e"
external_url = "https://xinet.kr/?p=1002"
+++

## 스크립트 예 (`process_check.ps1`)

```powershell
Get-Process | Out-File -FilePath C:\process_list.txt
```

## GUI

1. 작업 스케줄러 → 기본 작업 만들기
1. 트리거: 매일 등
1. 동작: 프로그램 시작
1. 프로그램: `C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe`
1. 인수: `-NoLogo -ExecutionPolicy Bypass -File "C:\path\process_check.ps1"`
1. 설정: 사용자 로그온 여부와 관계없이 실행

## CLI

```powershell
$action  = New-ScheduledTaskAction -Execute "powershell.exe" `
  -Argument "-NoLogo -ExecutionPolicy Bypass -File C:\path\process_check.ps1"
$trigger = New-ScheduledTaskTrigger -Daily -At 9am
Register-ScheduledTask -TaskName "ProcessCheck" -Action $action -Trigger $trigger -RunLevel Highest
```
