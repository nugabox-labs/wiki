+++
title = "Git 커밋 날짜 수정"
date = "2021-09-02T15:14:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["DEV-OPS"]
tags = ["GIT/SVN"]
toc = true

[extra]
source = "notion"
notion_id = "f45f1d7b-8ff5-49df-adef-ebf89c94c0f4"
notion_url = "https://app.notion.com/p/Git-f45f1d7b8ff549dfadefebf89c94c0f4"
+++

## 특정 커밋 날짜 수정

```bash
git log   # 수정할 커밋의 해시값 확인

git filter-branch --env-filter \
    'if [ $GIT_COMMIT = 복사한해쉬값 ]
     then
         export GIT_AUTHOR_DATE="Tue Aug 4 11:00:00 2020 +0900"
         export GIT_COMMITTER_DATE="Tue Aug 4 11:00:00 2020 +0900"
     fi'

git pull origin master --allow-unrelated-histories
git push origin master
```
