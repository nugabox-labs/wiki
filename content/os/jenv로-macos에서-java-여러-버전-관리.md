+++
title = "jenv로 macOS에서 Java 여러 버전 관리"
date = 2023-03-11T14:03:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS"]
tags = ["MACOS"]
toc = true

[extra]
source = "notion"
notion_id = "aa27116b-3490-40a4-8211-1c569ca86d6b"
notion_url = "https://app.notion.com/p/jenv-macOS-Java-aa27116b349040a482111c569ca86d6b"
external_url = "https://jojoldu.tistory.com/329"
+++

## jenv로 macOS에서 Java 여러 버전 관리

```bash
brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup
brew cask install java     # 최신 버전 설치
brew install jenv          # 버전 관리 도구 (Node.js의 nvm과 유사)
```

`~/.bash_profile`에 추가:

```bash
if which jenv > /dev/null; then eval "$(jenv init -)"; fi
```

```bash
source ~/.bash_profile
```

**jenv에 설치된 JDK 등록**

```bash
jenv add /Library/Java/JavaVirtualMachines/jdk1.8.0_162.jdk/Contents/Home/
jenv add /Library/Java/JavaVirtualMachines/jdk-10.0.2.jdk/Contents/Home/
```

**버전 설정**

```bash
jenv global oracle64-1.8.0.162   # 전역 기본 버전
jenv versions                     # 등록된 버전 확인

jenv local oracle64-10.0.2        # 특정 디렉토리(프로젝트)에서만 다른 버전 사용
```

**jshell** (Java9+, IDE 없이 REPL로 코드 테스트)

```bash
jshell
```

원문: [https://jojoldu.tistory.com/329](https://jojoldu.tistory.com/329)
