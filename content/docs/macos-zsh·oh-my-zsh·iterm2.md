+++
title = "macOS zsh·Oh My Zsh·iTerm2"
date = 2021-01-22T01:57:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["MACOS"]
toc = true

[extra]
source = "notion"
notion_id = "f13af713-e413-484a-8605-d3f11f769605"
notion_url = "https://app.notion.com/p/macOS-zsh-Oh-My-Zsh-iTerm2-f13af713e413484a8605d3f11f769605"
+++

## 설치

```bash
brew install zsh curl
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
brew install --cask iterm2
```

## ~/.zshrc

```bash
ZSH_THEME="agnoster"
# hostname 숨김
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}
```

```bash
source ~/.zshrc
```

## iTerm2

- `Cmd + ,` → Profiles → Text: D2Coding 등 고정폭 폰트
- Colors → Color Presets → Import로 스키마 적용
