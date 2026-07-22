+++
title = "CentOS OpenJDK 설치"
date = 2020-02-28T13:02:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "BACK-END"]
tags = ["LINUX", "JAVA"]
toc = true

[extra]
source = "notion"
notion_id = "f37fe924-6e1d-4b83-9100-d36d888ea1bd"
notion_url = "https://app.notion.com/p/CentOS-OpenJDK-f37fe9246e1d4b839100d36d888ea1bd"
external_url = "https://zetawiki.com/wiki/CentOS_JDK_설치"
+++

```bash
yum list 'java*jdk-devel'
yum install java-1.8.0-openjdk-devel.x86_64

rpm -qa 'java*jdk-devel'
javac -version
```

`java-*-openjdk` = JRE, `*-devel` = JDK (devel이 JRE 의존).
