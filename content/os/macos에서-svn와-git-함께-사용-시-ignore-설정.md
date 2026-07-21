+++
title = "macOS에서 SVN와 Git 함께 사용 시 ignore 설정"
date = 2023-12-05T00:27:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS", "DEV-OPS"]
tags = ["MACOS", "GIT/SVN"]
toc = true

[extra]
source = "notion"
notion_id = "5bef4ac0-e20c-4292-be9f-964cfb432add"
notion_url = "https://app.notion.com/p/macOS-SVN-Git-ignore-5bef4ac0e20c4292be9f964cfb432add"
external_url = "https://gyuha.tistory.com/417"
+++

## macOS에서 SVN + Git 동시 사용 시 서로 제외 설정

**1) git 설정**

```bash
# ~/.gitignore 에 추가
.svn
.DS_Store
build
xcuserdata

git config --global core.excludesfile ~/.gitignore
```

확인: `~/.gitconfig`에 `excludesfile = /Users/userid/.gitignore` 반영됨

**2) svn 설정**

```bash
vi ~/.subversion/config
```

`[miscellany]`의 `global-ignores` 주석 해제 후 `.git build xcuserdata` 추가:

```javascript
global-ignores = *.o *.lo *.la *.al .libs *.so *.so.[0-9]* *.pyc *.pyo .DS_Store .git build xcuserdata
```

- `~/.subversion` 폴더 없으면 SVN을 먼저 설정해야 함(한글 파일명 사용 시 별도 패치 필요, 1.6.15까지 확인됨)

원문: [https://gyuha.tistory.com/417](https://gyuha.tistory.com/417), [https://gyuha.tistory.com/412](https://gyuha.tistory.com/412)
