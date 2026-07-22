+++
title = "macOS Python 개발환경 (Homebrew)"
date = 2021-04-05T05:49:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "BACK-END"]
tags = ["MACOS", "PYTHON"]
toc = true

[extra]
source = "notion"
notion_id = "dff66fd8-b378-4cfd-9e62-4bfe7dc37624"
notion_url = "https://app.notion.com/p/macOS-Python-Homebrew-dff66fd8b3784cfd9e624bfe7dc37624"
+++

## 설치

- 공식: [https://www.python.org/downloads/](https://www.python.org/downloads/)
- Homebrew: Homebrew

```bash
brew install python
# 또는 brew upgrade python@버전
brew install pipenv
```

## PATH (Intel 예)

`~/.zshrc` 또는 `~/.bash_profile`:

```bash
export PATH=/usr/local/opt/python/libexec/bin:$PATH
```

Apple Silicon은 `/opt/homebrew/opt/python/libexec/bin` 확인.

```bash
source ~/.zshrc   # 또는 ~/.bash_profile
python -V
```
