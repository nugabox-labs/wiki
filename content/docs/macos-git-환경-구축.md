+++
title = "macOS Git 환경 구축"
date = 2021-01-22T02:13:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["MACOS", "GIT"]
toc = true

[extra]
source = "notion"
notion_id = "71ba8bd0-491b-450b-b583-476e152f8d05"
notion_url = "https://app.notion.com/p/macOS-Git-71ba8bd0491b450bb583476e152f8d05"
external_url = "https://playon.tistory.com/115"
+++

## 설치

```bash
# Xcode Command Line Tools (git 포함) 또는 Homebrew
xcode-select --install
# 또는
brew install git
git --version
```

## 초기 설정

```bash
git config --global user.name "이름"
git config --global user.email "email@example.com"
git config --list
```

## 참고

- [https://playon.tistory.com/115](https://playon.tistory.com/115)
- [https://zeddios.tistory.com/120](https://zeddios.tistory.com/120)
