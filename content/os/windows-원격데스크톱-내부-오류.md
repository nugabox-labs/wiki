+++
title = "Windows 원격데스크톱 내부 오류"
date = 2021-08-23T01:45:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "TECH"]
tags = ["WINDOWS", "ISSUE", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "da651cdd-defc-4524-a253-87003a1bf128"
notion_url = "https://app.notion.com/p/Windows-da651cdddefc4524a25387003a1bf128"
external_url = "https://redpants27.tistory.com/21"
+++

증상: 원격 데스크톱 "내부 오류가 발생했습니다". (Windows 10 1703 이하에서 보고)

## 1. RDP 포트 변경 (예: 8898 = `0x22C2`)

```
regedit
HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Wds\rdpwd\Tds\tcp
HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp
→ PortNumber = 22c2 (hex)
```

## 2. 방화벽

- 기본 "원격 데스크톱" 허용 해제
- 인바운드: TCP 8898 허용 (도메인/개인/공용)

## 3. 그룹 정책

`컴퓨터 구성 > 관리 템플릿 > Windows 구성 요소 > 터미널 서비스 > 원격 데스크톱 세션 호스트 > 보안`

- "원격(RDP) 연결에 특정 보안 계층 사용" = 사용, 보안 계층 = RDP

## 4. NLA 해제

제어판 > 시스템 > 원격 설정

- 원격 연결 허용
- "네트워크 수준 인증…만 연결 허용" 체크 해제
