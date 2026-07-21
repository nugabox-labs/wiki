+++
title = "Jekyll Chirpy 테마 적용"
date = 2022-04-30T05:28:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "DEV-OPS"]
tags = ["WEB", "GIT/SVN"]
toc = true

[extra]
source = "notion"
notion_id = "55d611ab-27e4-49d7-b7c5-ccdd9165335e"
notion_url = "https://app.notion.com/p/Jekyll-Chirpy-55d611ab27e449d7b7c5ccdd9165335e"
external_url = "https://blog.kimzinu.com/posts/jekyll-4/"
+++

## Chirpy 테마 적용

테마: [https://github.com/cotes2020/jekyll-theme-chirpy](https://github.com/cotes2020/jekyll-theme-chirpy)

```bash
# 1. repo 생성 후 테마 압축 해제
# 2. _config.yml 수정
git add .
git commit -m "init chirpy"
git push

bash tools/init.sh
```

- GitHub Pages 소스를 **빌드 결과 브랜치**(`gh-pages` 등)로 설정
- token에 **workflow** 권한 필요
- `.nojekyll` 사용 → Actions로 `_site`를 별도 브랜치에 배포

## 빌드 실패 시 (수동 init)

```bash
# .travis.yml, _posts, docs 제거
# .github/workflows/pages-deploy.yml.hook 외 .github 정리
bundle
git push
```

- `Gemfile.lock`이 원인일 수 있음 → `.gitignore`에 추가 후 repo에서 삭제
- 브랜치명: `tools/deploy.sh`의 `PAGES_BRANCH="gh-pages"`
