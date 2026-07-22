+++
title = "macOS SVN·Git ignore 설정"
date = 2023-12-05T00:27:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["MACOS", "GIT", "SVN"]
toc = true

[extra]
source = "notion"
notion_id = "5bef4ac0-e20c-4292-be9f-964cfb432add"
notion_url = "https://app.notion.com/p/macOS-SVN-Git-ignore-5bef4ac0e20c4292be9f964cfb432add"
external_url = "https://gyuha.tistory.com/417"
+++

## Git → SVN 제외

```bash
# ~/.gitignore
.svn
.DS_Store
build
xcuserdata

git config --global core.excludesfile ~/.gitignore
```

`~/.gitconfig`에 `excludesfile = /Users/userid/.gitignore` 반영 확인.

## SVN → Git 제외

```bash
vi ~/.subversion/config
```

`[miscellany]` `global-ignores` 주석 해제 후 `.git build xcuserdata` 추가:

```
global-ignores = *.o *.lo *.la *.al .libs *.so *.so.[0-9]* *.pyc *.pyo .DS_Store .git build xcuserdata
```

- `~/.subversion` 없으면 SVN을 먼저 설정. 한글 파일명은 별도 패치 필요할 수 있음(1.6.15까지 확인).
