+++
title = "vi 문자열 치환 (:s)"
date = 2020-09-07T15:22:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "2329df7d-fe5c-4501-ab8e-8c2bba0bbfc2"
notion_url = "https://app.notion.com/p/vi-s-2329df7dfe5c4501ab8e8c2bba0bbfc2"
external_url = "http://gypark.pe.kr/wiki/Vi로문자열치환하기"
+++

```javascript
:(시작),(끝)s/패턴/치환/옵션
" . = 현재줄, $ = 끝, % = 전체
" 옵션: g(줄내 전부) i(대소무시) c(확인)

:5,10s/a/b/
:.,.+10s/a/b/g
:%s/a/b/gi
:%s/Hello/Good Morning/g

" 그룹 역참조
:%s/\(gnu\|Gnu\)/GNU/g
:%s/<li><a href="\(.\{-}\)">\(.\{-}\)<\/a>/* [[\1 \2]]/g
```
