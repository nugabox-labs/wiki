+++
title = "Windows 서버 RDP 멀티세션·작업관리자"
date = 2022-04-22T10:40:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["WINDOWS"]
toc = true

[extra]
source = "notion"
notion_id = "c5a7b488-ad4c-48c8-9159-11574f472192"
notion_url = "https://app.notion.com/p/Windows-RDP-c5a7b488ad4c48c8915911574f472192"
+++

## RDP 멀티세션

1. `Win+R` → `gpedit.msc`
1. 로컬 컴퓨터 정책 > 컴퓨터 구성 > 관리 템플릿 > Windows 구성 요소 > 터미널 서비스 > 연결
   - **연결 개수 제한** — 사용/사용 안 함
   - **원격 데스크톱 서비스 사용자를 하나의 세션으로 제한**
     - 사용: 사용자당 세션 1개(데스크톱 유지)
     - 사용 안 함: 세션 무제한(데스크톱 새로 생성)

## 작업 관리자 활성/비활성

`regedit` → `HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System`

| `DisableTaskMgr` | 상태 |
| --- | --- |
| `0` | 활성 |
| `1` | 비활성 |
| (키 없음) | 활성 |

비활성 상태면 키 삭제로도 원복.
