+++
title = "Windows 제품 키 확인"
date = 2024-09-10T00:15:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "TECH"]
tags = ["WINDOWS", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "c0e73f31-78f5-4400-8f88-aa616ae8f0d6"
notion_url = "https://app.notion.com/p/Windows-c0e73f3178f544008f88aa616ae8f0d6"
external_url = "https://m.blog.naver.com/dentivation/223025164265"
+++

## 제품 키 조회 (설치된 Windows)

```shell
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform" /v BackupProductKeyDefault
```

```shell
wmic path softwarelicensingservice get OA3xOriginalProductKey
```

- OEM/현재 제품 키 조회용. 환경에 따라 비어 있을 수 있음.
- 디지털 라이선스(업그레이드)는 키가 없을 수 있음.
- [Windows 제품 키 찾기](https://support.microsoft.com/ko-kr/windows/windows-제품-키-찾기-aaa2bf69-7b2b-9f13-f581-a806abf0a886)
