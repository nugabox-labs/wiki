+++
title = "디렉터리 없으면 mkdir"
date = 2020-09-02T16:03:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "3099883c-f227-4600-8409-5cead4830eae"
notion_url = "https://app.notion.com/p/mkdir-3099883cf227460084095cead4830eae"
external_url = "https://reoim.tistory.com/entry/쉘스크립트로-폴더-없으면-생성하기"
+++

```bash
mkdir -p "$dir"

# 또는
if [ ! -d "$dir" ]; then
  mkdir "$dir"
fi
```
