+++
title = "macOS Homebrew"
date = 2021-04-06T07:32:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["MACOS"]
toc = true

[extra]
source = "notion"
notion_id = "4efd3b62-9988-4589-9b36-3dc8ae51645c"
notion_url = "https://app.notion.com/p/macOS-Homebrew-4efd3b62998845899b363dc8ae51645c"
external_url = "https://brew.sh/index_ko"
+++

## 설치

```bash
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew -v
```

## 주요 명령

| 목적 | 명령 |
| --- | --- |
| 진단 | `brew doctor` |
| 검색/설치/삭제 | `brew search` / `brew install` / `brew uninstall` |
| cask | `brew install --cask <이름>` |
| 업그레이드 | `brew outdated` → `brew upgrade` / `brew upgrade <이름>` |
| 정리·목록·정보 | `brew cleanup` / `brew list` / `brew info` |
| 삭제 | `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"` |

## Trouble: OpenSSL 1.0.0 dylib

```bash
brew tap-new $USER/old-openssl
brew extract --version=1.0.2t openssl $USER/old-openssl
brew install openssl@1.0.2t
cd /usr/local/opt && mv openssl openssl_bak
ln -s ../Cellar/openssl@1.0.2t/1.0.2t openssl
```
