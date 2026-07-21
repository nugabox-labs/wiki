+++
title = "Jekyll/Chirpy로 GitHub Pages 만들기"
date = 2026-07-17T23:51:00Z
updated = 2026-07-21T02:37:00Z
categories = ["DEV-OPS"]
tags = ["GIT/SVN"]
toc = true

[extra]
source = "notion"
notion_id = "3a0aac4e-32a5-8183-aee8-d3620933cfe3"
notion_url = "https://app.notion.com/p/Jekyll-Chirpy-GitHub-Pages-3a0aac4e32a58183aee8d3620933cfe3"
external_url = "https://www.irgroup.org/posts/jekyll-chirpy/"
+++

## 1) 저장소 생성

- 방법 A: [Chirpy Release](https://github.com/cotes2020/jekyll-theme-chirpy/releases) 소스 다운로드
- 방법 B: [Chirpy 저장소 Fork](https://github.com/cotes2020/jekyll-theme-chirpy/fork)
- Repository Name: `<계정명>.github.io`, Public, README 자동생성 체크 해제

**A) 다운로드한 경우**

```bash
echo "Gemfile.lock" >> .gitignore
git init
git remote add origin https://github.com/<계정명>/<계정명>.github.io.git
git branch -M main
git add .
git commit -m "Initial commit"
```

**B) Fork한 경우**

```bash
git clone https://github.com/<계정명>/<계정명>.github.io.git
```

## 2) Chirpy 초기화

```bash
sh tools/init.sh
```

## 3) (선택) 로컬 실행 환경

**Windows**: Ruby Installer 설치 → `Start Command Prompt with Ruby` → 

```bash
gem install jekyll minima bundler jekyll-feed tzinfo-data
```

**macOS**:

```bash
brew install ruby
gem install --user-install bundler jekyll
ruby -v   # 버전 확인 후 아래 X.X에 반영
echo 'export PATH="$HOME/.gem/ruby/X.X.0/bin:$PATH"' >> ~/.zshrc
```

**공통**:

```bash
bundle
jekyll serve                 # 또는
bundle exec jekyll s         # 또는 Docker
docker run -it --rm --volume="$PWD:/srv/jekyll" -p 4000:4000 jekyll/jekyll jekyll serve
```

→ [http://localhost:4000](http://localhost:4000/) 확인

## 4) GitHub Actions 권한

저장소 Settings > Actions > General > Workflow permissions를 `Read and write permissions`로 변경

## 5) \_config.yml 필수 수정

- `lang: ko-KR`
- `timezone: Asia/Seoul`
- `url: https://<계정명>.github.io`

## 6) 배포

```bash
git add -A
git commit -m "Update configure"
git push
```

- push 시 GitHub Actions가 자동 build/deploy (3~5분), `gh-pages` 브랜치 자동 생성
- 저장소 Settings > Pages > Source를 `main`에서 `gh-pages`로 변경

## 참조

- [https://github.com/cotes2020/jekyll-theme-chirpy](https://github.com/cotes2020/jekyll-theme-chirpy)
- [https://www.irgroup.org/posts/jekyll-chirpy/](https://www.irgroup.org/posts/jekyll-chirpy/)
- [https://blog.kimzinu.com/posts/jekyll-4/](https://blog.kimzinu.com/posts/jekyll-4/)
