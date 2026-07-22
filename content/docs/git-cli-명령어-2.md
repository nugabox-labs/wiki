+++
title = "Git CLI 명령어 #2"
date = 2022-06-25T18:17:00Z
updated = 2026-07-21T06:47:00Z
categories = ["TECH"]
tags = ["GIT"]
toc = true

[extra]
source = "notion"
notion_id = "ea907d96-fef2-4f39-ad79-89e31c91714f"
notion_url = "https://app.notion.com/p/Git-CLI-2-ea907d96fef24f39ad7989e31c91714f"
external_url = "https://atoz-develop.tistory.com/entry/CLI-%ED%99%98%EA%B2%BD%EC%97%90%EC%84%9C-Git-%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0%EB%AA%85%EB%A0%B9%EC%96%B4-%EC%A0%95%EB%A6%AC-2?category=835891"
+++

## stash

```bash
git stash          # 임시 저장 (working tree clean으로 보임)
git stash list     # stash@{0}, stash@{1}...
git stash pop      # 최근 것 적용+제거
git stash apply <n> # 특정 번호 적용
git stash drop     # 삭제
```

## merge

```bash
git merge <브랜치명>
git merge <원격저장소>/<브랜치명>
```

현재 브랜치에 대상 변경사항을 합침.

## rebase

```bash
git rebase <브랜치명>              # merge와 결과는 비슷, 로그가 선형
git rebase -i @~3                  # 최근 3개 대화형
```

- 옵션: `p`ick / `r`eword / `e`dit / `s`quash / `f`ixup / `x`exec
- push되어 공유 중인 커밋은 rebase 금지 (미merge feature만)
- 충돌: `--abort` / `--continue` / `--skip`

```bash
git add <충돌파일>
git rebase --continue
```

## pull request (GitHub)

브랜치 push → Compare & pull request → Create → 리뷰 후 Merge.

충돌은 GitHub Resolve보다 로컬 merge/rebase 후 재push 권장.

## show

```bash
git show HEAD    # = git show @
git show HEAD~   # = HEAD^ / @~ / @^  (1커밋 이전)
git show @~3     # 3커밋 이전
```

## reset

```bash
git reset --soft @^     # 1커밋 되돌림, staged 유지
git reset @~3           # --mixed(기본), modified 유지
git reset @ <파일명>    # unstage
```

- `--hard` — commit/add/워킹트리까지 되돌림, 복구 어려움 → 혼자 쓰는 브랜치만

## cherry-pick

```bash
git cherry-pick <커밋해시>
```

다른 브랜치의 특정 커밋만 가져옴 (원본 커밋은 유지).
