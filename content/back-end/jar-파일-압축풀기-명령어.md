+++
title = "jar 파일 압축/풀기 명령어"
date = "2019-10-04T09:14:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["BACK-END"]
tags = ["JAVA"]
toc = true

[extra]
source = "notion"
notion_id = "20bfb61c-02ee-4dd6-813e-78b399880be6"
notion_url = "https://app.notion.com/p/jar-20bfb61c02ee4dd6813e78b399880be6"
external_url = "https://m.blog.naver.com/PostView.nhn?blogId=gwang39&logNo=221007458092"
+++

## jar 파일 압축/풀기

```bash
jar cvf 파일명.jar .    # 현재 디렉토리를 압축
jar xvf 파일명.jar      # 압축 풀기
```

## jar 옵션

```javascript
c   새 jar 패키지 생성
t   패키지 내 파일 리스트 출력
x   압축 풀기
f   대상 jar 파일명 지정 (c/t/x와 함께 사용)
v   수행 메시지 출력
m   manifest 파일 이름 지정
M   manifest 파일 생성 안 함
O   압축하지 않고 묶기만 함
u   패키지 내용 업데이트
i   Class-Path로 참조되는 jar 정보를 INDEX.LIST로 생성
C   압축 시 기준 디렉토리 지정
```

원문: [https://m.blog.naver.com/PostView.nhn?blogId=gwang39&logNo=221007458092](https://m.blog.naver.com/PostView.nhn?blogId=gwang39&logNo=221007458092)
