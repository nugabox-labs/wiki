+++
title = "Windows 10 3D 개체 폴더 삭제"
date = 2023-03-11T13:50:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["WINDOWS"]
toc = true

[extra]
source = "notion"
notion_id = "90a1f692-df38-4437-8929-2992504467fa"
notion_url = "https://app.notion.com/p/Windows-10-3D-90a1f692df38443789292992504467fa"
external_url = "https://siait.tistory.com/645"
+++

## Windows 10 "3D 개체" 폴더 삭제 (레지스트리)

1. `regedit` 실행
1. `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC9-9020-FF41B59E513A}` 키 삭제
1. 내 PC에서 F5 → 사라짐
- 레지스트리 편집은 신중히.
