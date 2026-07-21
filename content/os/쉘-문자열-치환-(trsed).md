+++
title = "쉘 문자열 치환 (tr/sed)"
date = "2021-02-09T09:45:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "cd180466-ab0a-499c-8d78-7a9e50cd177f"
notion_url = "https://app.notion.com/p/tr-sed-cd180466ab0a499c8d787a9e50cd177f"
external_url = "https://danamoni.tistory.com/entry/%EC%89%98%EC%97%90%EC%84%9C-%EB%AC%B8%EC%9E%90%EC%97%B4-%EC%B9%98%ED%99%98%ED%95%98%EA%B8%B0"
+++

## 쉘 문자열 치환 (tr / sed)

```bash
echo 'THIS' | tr 'A-Z' 'a-z'
echo 'THIS' | tr -d 'A'
echo 'This is' | sed 's/This/That/g'
echo 'THIS' | sed 's/\(.*\)/\L\1/'
echo 'a\tb' | tr '\t' ' '
```
