+++
title = "Git CLI 명령어 정리 #2"
date = "2022-06-25T18:17:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["DEV-OPS"]
tags = ["GIT/SVN"]
toc = true

[extra]
source = "notion"
notion_id = "ea907d96-fef2-4f39-ad79-89e31c91714f"
notion_url = "https://app.notion.com/p/Git-CLI-2-ea907d96fef24f39ad7989e31c91714f"
external_url = "https://atoz-develop.tistory.com/entry/CLI-%ED%99%98%EA%B2%BD%EC%97%90%EC%84%9C-Git-%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0%EB%AA%85%EB%A0%B9%EC%96%B4-%EC%A0%95%EB%A6%AC-2?category=835891"
+++

## stash

```javascript
git stash          # 현재 변경사항 임시 저장 (status에서 working tree clean으로 보임)
git stash list      # 저장 목록 확인 (stash@{0}, stash@{1}...)
git stash pop       # 가장 최근 것 가져오기
git stash apply <n> # 특정 번호 가져오기
git stash drop      # 전체 삭제
```

## merge

```
git merge <브랜치명>
git merge <원격저장소>/<브랜치명>
```

- 현재 브랜치에 대상 브랜치의 변경사항을 합침

## rebase

```javascript
git rebase <브랜치명>              # 다른 브랜치와 병합, merge와 기능은 같지만 로그가 깔끔해짐
git rebase -i @~3                  # 최근 3개 커밋 대화형 수정
```

- 대화형 모드 옵션: `p`ick / `r`eword(메시지 수정) / `e`dit / `s`quash(이전 커밋에 합침) / `f`ixup(squash+메시지 버림) / `x`exec
- ⚠️ push되어 다른 사람이 사용 중인 커밋은 rebase 금지 (아직 merge 안 된 자기 feature 브랜치만 안전)
- 충돌 처리: `--abort`(중단/원복) / `--continue`(진행) / `--skip`(대상 브랜치 내용 적용)

```javascript
git add <충돌파일>
git rebase --continue
```

## pull request (GitHub)

- 브랜치 push 후 GitHub에서 Compare & pull request → Create pull request → 리뷰 후 Merge pull request
- 충돌 시 GitHub의 Resolve conflicts 기능 대신 로컬에서 merge/rebase로 처리 후 재push 권장

## show

```javascript
git show HEAD   git show @         # 같음, HEAD 커밋 보기
git show HEAD~  git show HEAD^  git show @~  git show @^   # 모두 같음, 1커밋 이전
git show @~3    # 3커밋 이전
```

## reset

```javascript
git reset --soft @^     # 1커밋 되돌림, 파일은 staged 상태로 남음
git reset @~3           # --mixed(기본), 파일은 modified 상태로 남음
git reset @ <파일명>     # add 취소 (unstaged로)
```

- `--hard` : commit/add/워킹디렉토리까지 전부 되돌림, git으로 복구 불가 → 혼자 쓰는 브랜치에서만

## cherry-pick

```javascript
git cherry-pick <커밋해시>
```

- 다른 브랜치의 특정 커밋만 현재 브랜치로 가져옴 (원본 브랜치의 커밋은 그대로 남음)

---

관련: [CLI Git 명령어 정리 #1](https://app.notion.com/p/14d0b8006aec42fc95613242b5469dd8) (status/log/add/commit/branch/checkout/push/pull/fetch)

원문: [https://atoz-develop.tistory.com/entry/CLI-%ED%99%98%EA%B2%BD%EC%97%90%EC%84%9C-Git-%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0%EB%AA%85%EB%A0%B9%EC%96%B4-%EC%A0%95%EB%A6%AC-2](https://atoz-develop.tistory.com/entry/CLI-%ED%99%98%EA%B2%BD%EC%97%90%EC%84%9C-Git-%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0%EB%AA%85%EB%A0%B9%EC%96%B4-%EC%A0%95%EB%A6%AC-2)
