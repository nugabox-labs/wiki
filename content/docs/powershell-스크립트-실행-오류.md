+++
title = "PowerShell 스크립트 실행 오류"
date = 2022-08-18T14:10:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["WINDOWS"]
toc = true

[extra]
source = "notion"
notion_id = "b19a2c0a-b008-4d4a-8e46-04d4f5383bcf"
notion_url = "https://app.notion.com/p/PowerShell-b19a2c0ab0084d4a8e4604d4f5383bcf"
external_url = "https://www.leafcats.com/317"
+++

## PowerShell 스크립트 실행 정책

증상: "이 시스템에서 스크립트를 실행할 수 없으므로..."

원인: ExecutionPolicy 제한.

```powershell
# 관리자 PowerShell
Set-ExecutionPolicy RemoteSigned
```
