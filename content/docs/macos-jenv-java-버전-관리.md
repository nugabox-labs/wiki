+++
title = "macOS jenv Java 버전 관리"
date = 2023-03-11T14:03:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "BACK-END"]
tags = ["MACOS", "JAVA"]
toc = true

[extra]
source = "notion"
notion_id = "aa27116b-3490-40a4-8211-1c569ca86d6b"
notion_url = "https://app.notion.com/p/macOS-jenv-Java-aa27116b349040a482111c569ca86d6b"
external_url = "https://jojoldu.tistory.com/329"
+++

```bash
brew install --cask temurin   # 또는 원하는 JDK
brew install jenv
```

`~/.zshrc` (또는 `~/.bash_profile`):

```bash
if which jenv > /dev/null; then eval "$(jenv init -)"; fi
```

```bash
jenv add /Library/Java/JavaVirtualMachines/<jdk>/Contents/Home/
jenv versions
jenv global <버전>    # 전역
jenv local <버전>     # 프로젝트 디렉터리
```

Java 9+: `jshell`
