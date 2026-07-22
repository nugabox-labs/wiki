+++
title = "alias·PATH (.bash_profile)"
date = 2019-09-30T02:45:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "8a2fa4a9-11f0-4475-b32c-893437869c91"
notion_url = "https://app.notion.com/p/alias-PATH-bash_profile-8a2fa4a911f04475b32c893437869c91"
+++

## alias / PATH

```bash
vi ~/.bash_profile   # 또는 ~/.bashrc
source ~/.bash_profile

alias ll='ls -al'
alias mysql='/usr/local/mysql/bin/mysql'
export PATH=$PATH:$HOME/bin:/usr/local/mysql/bin
```
