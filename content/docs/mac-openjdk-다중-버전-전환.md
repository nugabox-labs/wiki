+++
title = "Mac OpenJDK 다중 버전 전환"
date = 2023-01-14T15:08:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "BACK-END", "DEV-OPS", "TECH"]
tags = ["MACOS", "JAVA", "TIP", "BASH"]
toc = true

[extra]
source = "notion"
notion_id = "1c7e5b0a-ff6e-45bf-a1b4-01e4fa7db601"
notion_url = "https://app.notion.com/p/Mac-OpenJDK-1c7e5b0aff6e45bfa1b401e4fa7db601"
external_url = "https://miro7923.github.io/java/set-java-version/"
+++

## 설치·확인

```bash
brew install --cask temurin@11   # 또는 zulu / adoptopenjdk 등
/usr/libexec/java_home -V
java -version
```

## 삭제

```bash
cd /Library/Java/JavaVirtualMachines
sudo rm -rf adoptopenjdk-11.jdk   # 대상 JDK 폴더명
```

## 버전 전환 alias (~/.zshrc 또는 ~/.bash\_profile)

```bash
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export PATH="$JAVA_HOME/bin:$PATH"
alias setJava8='export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)'
alias setJava11='export JAVA_HOME=$(/usr/libexec/java_home -v 11)'
```

```bash
source ~/.zshrc
setJava11 && java -version
setJava8 && java -version
```

Apple Silicon이면 **arm64** JDK(Zulu 등) 사용 권장.
