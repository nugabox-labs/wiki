+++
title = "jar 압축·풀기"
date = 2019-10-04T09:14:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END"]
tags = ["JAVA"]
toc = true

[extra]
source = "notion"
notion_id = "20bfb61c-02ee-4dd6-813e-78b399880be6"
notion_url = "https://app.notion.com/p/jar-20bfb61c02ee4dd6813e78b399880be6"
external_url = "https://m.blog.naver.com/PostView.nhn?blogId=gwang39&logNo=221007458092"
+++

## 기본

```bash
jar cvf 파일명.jar .    # 현재 디렉터리 압축
jar xvf 파일명.jar      # 풀기
jar tvf 파일명.jar      # 목록
```

## 옵션

| 옵션 | 의미 |
| --- | --- |
| c | 새 jar 생성 |
| t | 목록 |
| x | 풀기 |
| f | jar 파일명 (c/t/x와 함께) |
| v | 상세 출력 |
| m | manifest 지정 |
| M | manifest 미생성 |
| 0 | 무압축 묶기 |
| u | 내용 업데이트 |
| i | INDEX.LIST 생성 |
| C | 기준 디렉터리 |
