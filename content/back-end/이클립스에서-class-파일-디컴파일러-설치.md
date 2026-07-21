+++
title = "이클립스에서 class 파일 디컴파일러 설치"
date = 2019-10-04T09:05:00Z
updated = 2026-07-21T02:37:00Z
categories = ["BACK-END"]
tags = ["JAVA"]
toc = true

[extra]
source = "notion"
notion_id = "8e86fef7-b1af-47be-a21a-f51f8b668771"
notion_url = "https://app.notion.com/p/class-8e86fef7b1af47bea21af51f8b668771"
+++

> 원본이 스크린샷 이미지뿐(텍스트 추출 불가)

## 이클립스에서 .class 파일 디컴파일해서 열기 (일반 참고)

1. Help > Eclipse Marketplace 에서 "Enhanced Class Decompiler" 검색 후 설치 (JD-Core, Fernflower, CFR, Procyon 등 여러 디컴파일러 엔진 지원)
1. 설치 후 재시작
1. Window > Preferences > Java > Decompiler 에서 사용할 디컴파일러 엔진 선택
1. 이후 소스 없이 `.class` 파일(라이브러리 jar 내부 등)을 더블클릭하면 자동으로 디컴파일된 소스가 표시됨
