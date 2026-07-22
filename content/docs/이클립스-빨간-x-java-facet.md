+++
title = "이클립스 빨간 X Java Facet"
date = 2019-09-26T07:15:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END"]
tags = ["JAVA"]
toc = true

[extra]
source = "notion"
notion_id = "94de9649-bfe2-47f4-af0a-fcb0da728f42"
notion_url = "https://app.notion.com/p/X-Java-Facet-94de9649bfe247f4af0afcb0da728f42"
+++

## 이클립스 프로젝트 빨간 X

- Window → Show View → Problems 에서 원인 확인
- `Java compiler level does not match the version of the installed Java project facet` → Project Facets Java 버전 ≠ 실제 JDK
- 해결: 프로젝트 Properties → Project Facets → Java를 사용 JDK와 동일하게
