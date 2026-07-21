+++
title = "Linux tee 화면·파일 동시 출력"
date = 2021-07-08T02:45:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "DEV-OPS", "TECH"]
tags = ["LINUX", "BASH", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "19461c94-80ac-4da8-a843-d1afb105549c"
notion_url = "https://app.notion.com/p/Linux-tee-19461c9480ac4da8a843d1afb105549c"
external_url = "https://zetawiki.com/wiki/%EB%A6%AC%EB%88%85%EC%8A%A4_tee,_%ED%99%94%EB%A9%B4%EA%B3%BC_%ED%8C%8C%EC%9D%BC%EC%97%90_%EB%8F%99%EC%8B%9C_%EC%B6%9C%EB%A0%A5%ED%95%98%EA%B8%B0"
+++

stdout을 화면과 파일에 동시에 기록.

```bash
command | tee file.txt          # 덮어쓰기
command | tee -a file.txt       # 추가
command 2>&1 | tee file.txt     # stdout+stderr
df -h | tee df.txt
```
