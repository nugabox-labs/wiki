+++
title = "IntelliJ Tomcat JSP 핫리로드"
date = 2021-09-19T09:46:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "BACK-END", "TECH"]
tags = ["JAVA", "WAS", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "05100d89-2df7-4337-9198-5f3935dee14f"
notion_url = "https://app.notion.com/p/IntelliJ-Tomcat-JSP-05100d892df7433791985f3935dee14f"
+++

## 목적

IntelliJ에서 JSP 수정 시 Tomcat 재배포 없이 반영.

## 설정

1. Run → Edit Configurations → Tomcat
1. **Deployment** 탭 → `war exploded` 편집
1. **Output directory** → `src/main/webapp` (프로젝트 경로)

## 확인

JSP 수정 후 브라우저 새로고침만으로 반영.
