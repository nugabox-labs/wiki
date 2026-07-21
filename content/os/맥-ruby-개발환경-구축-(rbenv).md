+++
title = "맥 Ruby 개발환경 구축 (rbenv)"
date = 2021-10-18T01:26:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS"]
tags = ["MACOS"]
toc = true

[extra]
source = "notion"
notion_id = "651268de-3902-4bf5-900e-16a3fbfb0ab6"
notion_url = "https://app.notion.com/p/Ruby-rbenv-651268de39024bf5900e16a3fbfb0ab6"
+++

## rbenv로 Ruby 버전 관리 (macOS, 시스템 Ruby 대신)

```bash
brew install rbenv ruby-build
rbenv install 2.6.5
rbenv global 2.6.5
rbenv versions   # 설치 확인, 사용 중인 버전 앞에 * 표시됨
```

`~/.zshrc`에 추가:

```bash
export PATH={$HOME}/.rbenv/bin:$PATH && \
eval "$(rbenv init -)"
```

```bash
source ~/.zshrc
```
