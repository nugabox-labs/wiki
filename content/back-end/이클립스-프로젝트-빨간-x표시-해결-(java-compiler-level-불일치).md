+++
title = "이클립스 프로젝트 빨간 X표시 해결 (Java compiler level 불일치)"
date = 2019-09-26T07:15:00Z
updated = 2026-07-21T02:37:00Z
categories = ["BACK-END"]
tags = ["JAVA"]
toc = true

[extra]
source = "notion"
notion_id = "94de9649-bfe2-47f4-af0a-fcb0da728f42"
notion_url = "https://app.notion.com/p/X-Java-compiler-level-94de9649bfe247f4af0afcb0da728f42"
+++

## 이클립스 프로젝트 폴더 빨간 엑스(X) 표시 해결

- Window > Show View > Problems 에서 원인 확인
- `Java compiler level does not match the version of the installed Java project facet.` 메시지인 경우: Project Facets 설정과 실제 JDK 버전이 불일치
- 해결: 프로젝트 우클릭 > Properties > Project Facets > Java 항목 버전을 실제 사용 중인 JDK 버전과 동일하게 설정
