+++
title = "oh-my-zsh insecure directories"
date = 2023-03-11T14:03:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["MACOS"]
toc = true

[extra]
source = "notion"
notion_id = "7591343d-72be-4a03-9fb4-0bafceb9e314"
notion_url = "https://app.notion.com/p/oh-my-zsh-insecure-directories-7591343d72be4a039fb40bafceb9e314"
external_url = "http://gyutaehan.me/oh-my-zsh-seolci-hu-insecure-completion-dependent-directories-detected-ereo-mesijiga-nawasseul-ddae-haegyeolbangbeob/"
+++

## oh-my-zsh insecure directories

```bash
compaudit                # 퍼미션 문제 있는 디렉토리 확인
# 예: /usr/local/share/zsh, /usr/local/share/zsh/site-functions

chmod 755 /usr/local/share/zsh
chmod 755 /usr/local/share/zsh/site-functions
```

터미널 재시작하면 에러 메시지 사라짐
