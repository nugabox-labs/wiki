+++
title = "맥 Java 개발환경 구축 (Homebrew, 여러 버전 관리)"
date = 2021-04-06T01:02:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS", "BACK-END"]
tags = ["MACOS", "JAVA"]
toc = true

[extra]
source = "notion"
notion_id = "c2b37dd0-01ad-44e5-b6d4-0c86b5acda22"
notion_url = "https://app.notion.com/p/Java-Homebrew-c2b37dd001ad44e5b6d40c86b5acda22"
external_url = "https://llighter.github.io/install-java-on-mac/"
+++

# 설치

---

## 다운로드 설치

↗︎ [https://www.oracle.com/kr/java/technologies/javase/javase-jdk8-downloads.html](https://www.oracle.com/kr/java/technologies/javase/javase-jdk8-downloads.html)

## Brew로 설치

### 1. [🍺 Homebrew 설치](/4efd3b62998845899b363dc8ae51645c#5f0fdfc50d3a4707a803487d017b5f26)

### 2. adoptopenjdk/openjdk 추가

```bash
$ brew tap adoptopenjdk/openjdk
```

### 3. 설치 가능한 JDK 찾기

```bash
$ brew search jdk

==> Formulae
openjdk ✔                                     openjdk@11                                    openjdk@8
==> Casks
adoptopenjdk                      adoptopenjdk12                    adoptopenjdk14-jre                adoptopenjdk8-jre
adoptopenjdk-jre                  adoptopenjdk12-jre                adoptopenjdk14-openj9             adoptopenjdk8-openj9
adoptopenjdk-openj9               adoptopenjdk12-openj9             adoptopenjdk14-openj9-jre         adoptopenjdk8-openj9-jre
adoptopenjdk-openj9-jre           adoptopenjdk12-openj9-jre         adoptopenjdk14-openj9-jre-large   adoptopenjdk8-openj9-jre-large
adoptopenjdk-openj9-jre-large     adoptopenjdk12-openj9-jre-large   adoptopenjdk14-openj9-large       adoptopenjdk8-openj9-large
adoptopenjdk-openj9-large         adoptopenjdk12-openj9-large       adoptopenjdk15                    adoptopenjdk9
adoptopenjdk10                    adoptopenjdk13                    adoptopenjdk15-jre                jdk-mission-control
adoptopenjdk11 ✔                  adoptopenjdk13-jre                adoptopenjdk15-openj9             oracle-jdk
adoptopenjdk11-jre                adoptopenjdk13-openj9             adoptopenjdk15-openj9-jre         oracle-jdk-javadoc
adoptopenjdk11-openj9             adoptopenjdk13-openj9-jre         adoptopenjdk15-openj9-jre-large   sapmachine-jdk
adoptopenjdk11-openj9-jre         adoptopenjdk13-openj9-jre-large   adoptopenjdk15-openj9-large
adoptopenjdk11-openj9-jre-large   adoptopenjdk13-openj9-large       adoptopenjdk8
adoptopenjdk11-openj9-large       adoptopenjdk14 ✔                  adoptopenjdk8
```

### 4. 원하는 버전의 JDK 설치

여러 버전의 JDK 설치 시 기본적으로 가장 최신 버전의 JDK가 세팅된다.

```bash
$ brew install --cask adoptopenjdk8
$ brew install --cask adoptopenjdk11
```

### 5. Java 설치 경로 확인

```bash
$ /usr/libexec/java_home -V
Matching Java Virtual Machines (5):
	11.0.9.1 (x86_64) "AdoptOpenJDK" - "AdoptOpenJDK 11" /Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home
	1.8.0_282 (x86_64) "AdoptOpenJDK" - "AdoptOpenJDK 8" /Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
```

### 6. Java 버전 확인

```bash
$ java --version
openjdk version "1.8.0_282"
OpenJDK Runtime Environment (AdoptOpenJDK)(build 1.8.0_282-b08)
OpenJDK 64-Bit Server VM (AdoptOpenJDK)(build 25.282-b08, mixed mode)
```

# 설정

---

## JDK 버전 스위치

설치된 여러 가지 버전의 JDK를 바꾸는 방법에는 [jEnv](https://www.jenv.be/)를 활용하는 방법도 있지만 `export JAVA_HOME` 명령어로 직접 변경하는 방법을 사용하는 것이 직관적이고 간단하다.

### 1. 쉘 Profile에서 사용 중인 JDK 버전 세팅

- 현재 사용 중인 쉘 확인
  ```bash
$ echo $SHELL
/bin/zsh 또는 /bin/bash
  ```
- 현재 사용 중인 쉘 확인 후 아래 내용을 해당 프로파일에 추가한다.
  - bash인 경우 : `vim ~/.bash_profile`
  - zsh인 경우 : `vim ~/.zshrc`

  ```bash
# Java Paths
export JAVA_HOME_8=$(/usr/libexec/java_home -v8)
export JAVA_HOME_11=$(/usr/libexec/java_home -v11)
# 위의 /usr/libexec/java_home에 반영이 되지 않을 때는 직접 JDK 위치를 입력해준다.
export JAVA_HOME_8=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export JAVA_HOME_11=/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home

# Java Switch (사용하고자 하는 버전 하나만 주석해제)
export JAVA_HOME=$JAVA_HOME_8
# export JAVA_HOME=$JAVA_HOME_11
  ```

### 2. 변경사항 반영

현재 사용 중인 쉘에 따라 변경사항 반영 뒤 JDK 버전을 확인한다.

- bash인 경우 : `source ~/.bash_profile`
- zsh인 경우 : `source ~/.zshrc`
