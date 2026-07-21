+++
title = "맥 Python 개발환경 구축 (Homebrew)"
date = 2021-04-05T05:49:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS", "BACK-END"]
tags = ["MACOS", "PYTHON"]
toc = true

[extra]
source = "notion"
notion_id = "dff66fd8-b378-4cfd-9e62-4bfe7dc37624"
notion_url = "https://app.notion.com/p/Python-Homebrew-dff66fd8b3784cfd9e624bfe7dc37624"
+++

# 설치

---

## 다운로드 설치

↗︎ [https://www.python.org/downloads/](https://www.python.org/downloads/)

## Brew로 설치

### 1. [🍺 Homebrew 설치](/4efd3b62998845899b363dc8ae51645c#5f0fdfc50d3a4707a803487d017b5f26)

### 2. Python 설치

```bash
brew install python
또는
brew upgrade python@설치된버전
```

### 3. 필수 라이브러리 설치

```bash
brew install pipenv
```

### 4. 환경변수 설정

- 현재 사용 중인 쉘 확인
  ```bash
$ echo $SHELL
/bin/zsh 또는 /bin/bash
  ```
- 현재 사용 중인 쉘 확인 후 아래 내용을 해당 프로파일에 추가한다.
  - bash인 경우 : `vim ~/.bash_profile`
  - zsh인 경우 : `vim ~/.zshrc`

  ```bash
export PATH=/usr/local/opt/python/libexec/bin:$PATH
  ```
- 변경사항 반영
  - bash인 경우 : `source ~/.bash_profile`
  - zsh인 경우 : `source ~/.zshrc`

### 5. 버전 확인

```bash
python -V
```
