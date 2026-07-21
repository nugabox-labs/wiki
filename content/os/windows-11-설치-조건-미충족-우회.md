+++
title = "Windows 11 설치 조건 미충족 우회"
date = 2025-06-27T01:05:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["WINDOWS"]
toc = true

[extra]
source = "notion"
notion_id = "21faac4e-32a5-80db-a682-db7aaa825f97"
notion_url = "https://app.notion.com/p/Windows-11-21faac4e32a580dba682db7aaa825f97"
external_url = "https://www.microsoft.com/ko-kr/software-download/windows11"
+++

## TPM/CPU 미지원 업그레이드 허용 (레지스트리)

1. `regedit` → `HKEY_LOCAL_MACHINE\SYSTEM\Setup\MoSetup`
1. DWORD(32비트) `AllowUpgradesWithUnsupportedTPMOrCPU` = `1`
   ![image](/notion-assets/21faac4e-32a5-80db-a682-db7aaa825f97/0.png)

## ISO 설치

1. [Windows 11 다운로드](https://www.microsoft.com/ko-kr/software-download/windows11)에서 ISO 받기 (Installation Assistant 사용 금지)
1. ISO 마운트 후 `setup.exe` 실행
   ![image](/notion-assets/21faac4e-32a5-80db-a682-db7aaa825f97/1.png)
