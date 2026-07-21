+++
title = "Linux find -exec 여러 명령"
date = 2023-08-07T01:23:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "DEV-OPS", "TECH"]
tags = ["LINUX", "BASH", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "549e7d87-7af1-4861-a7be-45be4ea6112e"
notion_url = "https://app.notion.com/p/Linux-find-exec-549e7d877af14861a7be45be4ea6112e"
external_url = "https://zetawiki.com/wiki/%EB%A6%AC%EB%88%85%EC%8A%A4_find_-exec_%EC%97%AC%EB%9F%AC_%EB%AA%85%EB%A0%B9%EC%96%B4_%EC%8B%A4%ED%96%89"
+++

## 패턴

```bash
find . -name '패턴' -exec sh -c '명령1; 명령2; 명령3;' \;
```

## 예: 압축 후 원본 삭제

```bash
find . -name '*.txt' -exec sh -c 'tar cjvf {}.bz2 {}; rm -f {};' \;
```

## 예: 파일명 + base64

```bash
find ?.txt -exec sh -c 'echo -n {} :::: ; base64 {} -w0; echo' \;
```
