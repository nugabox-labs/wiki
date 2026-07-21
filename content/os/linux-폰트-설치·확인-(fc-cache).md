+++
title = "Linux 폰트 설치·확인 (fc-cache)"
date = "2019-11-13T17:45:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "119e84d8-8b8f-481a-8369-60332f110201"
notion_url = "https://app.notion.com/p/Linux-fc-cache-119e84d88b8f481a836960332f110201"
external_url = "https://mkil.tistory.com/366"
+++

> 출처: [https://mkil.tistory.com/366](https://mkil.tistory.com/366)

```bash
# 폰트 디렉터리
ls /usr/share/fonts

# 폰트 파일 복사 후 캐시 갱신
cp MyFont.ttf /usr/share/fonts/
fc-cache -f -v

# 확인
fc-list | grep -i MyFont
```
