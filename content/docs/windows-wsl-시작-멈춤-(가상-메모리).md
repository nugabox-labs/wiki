+++
title = "Windows WSL 시작 멈춤 (가상 메모리)"
date = 2022-12-15T06:43:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "TECH"]
tags = ["WINDOWS", "ISSUE", "LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "78035a05-7b9a-4c96-bd72-3bff30bcd144"
notion_url = "https://app.notion.com/p/Windows-WSL-78035a057b9a4c96bd723bff30bcd144"
external_url = "https://hbase.tistory.com/291"
+++

## 증상

재부팅 후 WSL이 시작 화면에서 멈춤.

## 해결 (가상 메모리)

1. `Win+R` → `SystemPropertiesAdvanced`
1. 고급 → 성능 **설정** → 고급 → 가상 메모리 **변경**
1. 「모든 드라이브에 대한 페이징 파일 크기 자동 관리」 해제
1. 「시스템이 관리하는 크기」 또는 사용자 지정
   - 최소 ≈ RAM
   - 최대 ≈ RAM × 2
1. 적용 후 재부팅

```powershell
wmic pagefile list /format:list
```
