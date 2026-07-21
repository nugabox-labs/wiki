+++
title = "WebtoB 설치 실습"
date = "2019-09-16T04:49:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["SERVER"]
tags = ["WEB"]
toc = true

[extra]
source = "notion"
notion_id = "a4cf5518-94a0-464d-9bf1-79c8eae9d8e7"
notion_url = "https://app.notion.com/p/WebtoB-a4cf551894a0464d9bf179c8eae9d8e7"
+++

## 설치

```bash
chmod u+x WEBTOB*_Linux*.bin
./WEBTOB*_Linux*.bin
# Set: 1=WebtoB(Standard) / 2=Servlet+WebtoB(Enterprise)
# 설치 디렉터리 = WEBTOBDIR
```

## 버전·환경파일·라이선스

```bash
wsadmin -v
cd $WEBTOBDIR/config
wscfl -i http.m
# license.dat → $WEBTOBDIR/license/
wsadmin -i license.dat
wscfl -i http.m   # 라이선스 변경 후 재컴파일
```

## 기동/종료

```bash
wsboot
wsdown
```

기동: WEB → WAS / 종료: WAS → WEB

관련: [WebtoB 5 설치·설정](https://app.notion.com/p/4dedffed60bb4cb08ed28a48fd9ac956)
