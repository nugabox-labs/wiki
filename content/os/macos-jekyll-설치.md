+++
title = "macOS Jekyll 설치"
date = 2022-04-30T05:00:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER", "TECH"]
tags = ["MACOS", "WEB", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "78221eea-96b4-4dab-9a29-7a3a44171e27"
notion_url = "https://app.notion.com/p/macOS-Jekyll-78221eea96b44dab9a297a3a44171e27"
external_url = "https://jekyllrb-ko.github.io/docs/installation/macos/"
+++

공식: [https://jekyllrb-ko.github.io/docs/installation/macos/](https://jekyllrb-ko.github.io/docs/installation/macos/)

## 준비

```bash
xcode-select --install
```

## Ruby (Homebrew)

```bash
brew install ruby
echo 'export PATH="/usr/local/opt/ruby/bin:$PATH"' >> ~/.zshrc
# Apple Silicon: /opt/homebrew/opt/ruby/bin
which ruby && ruby -v
```

## 또는 rbenv

```bash
brew install rbenv
rbenv init
rbenv install 2.6.3 && rbenv global 2.6.3
```

## Jekyll (user install 권장)

```bash
gem install --user-install bundler jekyll
echo 'export PATH="$HOME/.gem/ruby/X.X.0/bin:$PATH"' >> ~/.zshrc   # X.X는 ruby -v
gem env
```

Mojave에서 글로벌 설치가 필요할 때만:

```bash
sudo gem install bundler
sudo gem install -n /usr/local/bin/ jekyll
```
