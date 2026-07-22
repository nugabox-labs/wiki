+++
title = "Eclipse 프로젝트 Java 버전 변경"
date = 2022-02-15T16:17:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END", "TECH"]
tags = ["JAVA", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "1428b309-e977-4d60-bffe-72ba0fd9c5e1"
notion_url = "https://app.notion.com/p/Eclipse-Java-1428b309e9774d60bffe72ba0fd9c5e1"
external_url = "https://yongtech.tistory.com/98"
+++

## 1) JRE 등록

`Window` → `Preferences` → `Java` → `Installed JREs` → `Add...` → `Standard VM`

- JRE home = JDK 최상위 폴더 → Finish → OK

## 2) Project Facets

프로젝트 우클릭 → `Properties` → `Project Facets` → Java Version 변경 → OK

## 3) Build Path

`Properties` → `Java Build Path` → `Libraries` → `JRE System Library` 더블클릭

- `Alternate JRE` → 등록한 JRE → Finish

이후 재컴파일 확인.
