+++
title = "macOS Java 개발환경 (Homebrew·다중 JDK)"
date = 2021-04-06T01:02:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "BACK-END"]
tags = ["MACOS", "JAVA"]
toc = true

[extra]
source = "notion"
notion_id = "c2b37dd0-01ad-44e5-b6d4-0c86b5acda22"
notion_url = "https://app.notion.com/p/macOS-Java-Homebrew-JDK-c2b37dd001ad44e5b6d40c86b5acda22"
external_url = "https://llighter.github.io/install-java-on-mac/"
+++

## 설치

- Oracle JDK: [https://www.oracle.com/kr/java/technologies/javase/javase-jdk8-downloads.html](https://www.oracle.com/kr/java/technologies/javase/javase-jdk8-downloads.html)
- Homebrew

```bash
brew tap adoptopenjdk/openjdk
brew search jdk
brew install --cask adoptopenjdk8
brew install --cask adoptopenjdk11
/usr/libexec/java_home -V
java --version
```

> AdoptOpenJDK는 Temurin 등으로 이전됨. 신규는 `temurin@8` / `temurin@11` 확인.

## JAVA\_HOME 전환

`~/.zshrc` (또는 `~/.bash_profile`):

```bash
export JAVA_HOME_8=$(/usr/libexec/java_home -v8)
export JAVA_HOME_11=$(/usr/libexec/java_home -v11)
export JAVA_HOME=$JAVA_HOME_8
# export JAVA_HOME=$JAVA_HOME_11
```

```bash
source ~/.zshrc
```

jenv 방식: macOS jenv Java 버전 관리
