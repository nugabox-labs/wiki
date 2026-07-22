+++
title = "Windows 최대 절전 모드 활성·비활성"
date = 2023-07-25T07:52:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "TECH"]
tags = ["WINDOWS", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "9ee885b9-8e16-41a9-913a-f9111f817f2f"
notion_url = "https://app.notion.com/p/Windows-9ee885b98e1641a9913af9111f817f2f"
external_url = "https://learn.microsoft.com/ko-kr/troubleshoot/windows-client/deployment/disable-and-re-enable-hibernation"
+++

관리자 CMD/PowerShell:

```shell
powercfg.exe /hibernate off   # 비활성 (Hiberfil.sys 제거)
powercfg.exe /hibernate on    # 다시 활성
```

- `Hiberfil.sys`: OS 드라이브 루트, 크기 ≈ RAM
- 하이브리드 절전 사용 중 off 하면 정전 시 데이터 손실 가능
