+++
title = "Linux JDK 설치 tar·yum"
date = 2021-11-15T08:46:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "BACK-END", "TECH"]
tags = ["LINUX", "JAVA", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "24b1294b-01d9-4400-98a4-cc56ebce5417"
notion_url = "https://app.notion.com/p/Linux-JDK-tar-yum-24b1294b01d9440098a4cc56ebce5417"
external_url = "https://app.notion.com/p/1fdd33e896c240b3b57416a5d9078a4e"
+++

## 1) Oracle JDK tar

```bash
wget '<다운로드_링크>'   # 브라우저에서 복사한 인증 링크
mv 'jdk-8u221-linux-x64.tar.gz?AuthParam=...' jdk-8u221-linux-x64.tar.gz
gunzip jdk-8u221-linux-x64.tar.gz
tar -xvf jdk-8u221-linux-x64.tar
sudo mv jdk1.8.0_221 /usr/local
cd /usr/local && sudo ln -s jdk1.8.0_221 java
```

`/etc/profile`:

```bash
JAVA_HOME=/usr/local/java
CLASSPATH=.:$JAVA_HOME/lib/tools.jar
PATH=$PATH:$JAVA_HOME/bin
export JAVA_HOME CLASSPATH PATH
```

```bash
source /etc/profile
javac -version
```

## 2) yum OpenJDK

```bash
yum list java*jdk-devel
yum install java-1.8.0-openjdk-devel.x86_64
which javac
readlink -f /usr/bin/javac
# /etc/profile 에 JAVA_HOME 등록 후
source /etc/profile
echo $JAVA_HOME
```

참고: `JAVA_HOME`은 `.../bin/javac`가 아니라 JDK 루트 경로로 두는 것이 일반적.
