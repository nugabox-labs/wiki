+++
title = "Git CLI 명령어 #1"
date = 2021-04-08T01:42:00Z
updated = 2026-07-21T06:47:00Z
categories = ["DEV-OPS"]
tags = ["GIT/SVN"]
toc = true

[extra]
source = "notion"
notion_id = "14d0b800-6aec-42fc-9561-3242b5469dd8"
notion_url = "https://app.notion.com/p/Git-CLI-1-14d0b8006aec42fc95613242b5469dd8"
external_url = "https://atoz-develop.tistory.com/entry/CLI-%ED%99%98%EA%B2%BD%EC%97%90%EC%84%9C-Git-%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0%EB%AA%85%EB%A0%B9%EC%96%B4-%EC%A0%95%EB%A6%AC-1"
+++

## status

- `git status` — Untracked / Staged / Modified / clean

## log

```bash
git config --global alias.lg "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
git lg
```

## add / commit

```bash
git add <파일>
git commit -am "메시지"     # add+commit (modified만)
git commit --amend          # 마지막 커밋 수정
```

## branch

```bash
git br                                # 목록 (* = 현재)
git br -r                             # 원격
git br {브랜치명}                     # 생성
git br -D {브랜치명}                  # 강제 삭제
git br -d {브랜치명}                  # merge된 것만 삭제
git push origin --delete {브랜치명}   # 원격 삭제
git fetch -p                          # 삭제된 원격 반영
```

## checkout

```bash
git checkout {브랜치명}
git checkout {커밋해시}     # working tree clean 필요
git checkout -b {브랜치명}  # 생성+이동
```

## push

```bash
git push [원격저장소] [브랜치]
git push -f                                    # 강제(혼자 쓰는 브랜치만)
git push --set-upstream [원격저장소] [브랜치]  # no upstream 시
```

## pull / fetch

- `git pull` — fetch + merge (충돌 시 실패)
- `git fetch` — 데이터만 (merge 없음)
- 충돌: `git merge --abort` 또는 수정 → `add` → `commit` → `push`
