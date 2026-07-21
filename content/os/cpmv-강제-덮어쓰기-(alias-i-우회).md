+++
title = "cp/mv 강제 덮어쓰기 (alias -i 우회)"
date = 2020-11-04T11:25:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "6647a5f5-4174-4fe7-a3ae-f5da1a064c06"
notion_url = "https://app.notion.com/p/cp-mv-alias-i-6647a5f541744fe7a3aef5da1a064c06"
external_url = "https://gracefulprograming.tistory.com/81"
+++

> 출처: [https://gracefulprograming.tistory.com/81](https://gracefulprograming.tistory.com/81)

`alias cp='cp -i'` / `alias mv='mv -i'` 때문에 `-f`도 확인 프롬프트가 뜸.

```bash
alias | grep -E 'cp|mv'

# 방법1: 절대경로
/usr/bin/cp -f src dst
/usr/bin/mv -f src dst

# 방법2: alias 무시
\cp -f src dst
\mv -f src dst
```
