+++
title = "Windows 작업 스케줄러 PowerShell 실행"
date = 2022-08-19T14:01:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "TECH"]
tags = ["WINDOWS", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "72191962-c264-447e-b0b2-20704cdb92fb"
notion_url = "https://app.notion.com/p/Windows-PowerShell-72191962c264447eb0b220704cdb92fb"
external_url = "https://kwjabcd.tistory.com/16"
+++

## 등록

1. `Win+R` → `taskschd.msc`
1. 작업 스케줄러 라이브러리 → **작업 만들기**

## 일반

- 이름 지정
- 사용자의 로그온 여부에 관계없이 실행
- 가장 높은 수준의 권한으로 실행
- 구성 대상: OS 버전에 맞게

## 트리거

한 번/매일/매주/매월 등. 필요 시 반복 간격·기간.

## 동작

- 프로그램 시작
- 프로그램: `C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe`
- 인수:

```powershell
-ExecutionPolicy Unrestricted -File "C:\경로\스크립트.ps1"
```

## 권한

실행 계정: 도메인/로컬 관리자.
