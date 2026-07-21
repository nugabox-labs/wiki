+++
title = "yum 없이 gcc·httpd·Tomcat RPM 설치"
date = 2020-03-02T09:55:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["WEB", "LINUX", "WAS"]
toc = true

[extra]
source = "notion"
notion_id = "16f5503a-952f-424b-8ff8-f3d7d9bccb30"
notion_url = "https://app.notion.com/p/yum-gcc-httpd-Tomcat-RPM-16f5503a952f424b8ff8f3d7d9bccb30"
+++

> RHEL 7.x, yum 불가(라이선스) 시 ISO Packages에서 `rpm -Uvh`로 수동 설치. 의존성은 자동 해결 안 됨 — 아래부터 순서대로.

> 주의: CentOS repo를 RHEL에 붙인 뒤 `yum update` 하면 커널/패키지 꼬일 수 있음. 필요 패키지만 설치 후 repo 제거.

## GCC (오른쪽→왼쪽, 의존성 먼저)

```bash
rpm -Uvh kernel-headers-*.rpm
rpm -Uvh glibc-headers-*.rpm
rpm -Uvh glibc-devel-*.rpm
rpm -Uvh libgomp-*.rpm
rpm -Uvh mpfr-*.rpm
rpm -Uvh libmpc-*.rpm
rpm -Uvh cpp-*.rpm
rpm -Uvh gcc-*.rpm
rpm -Uvh libstdc++-devel-*.rpm
rpm -Uvh gcc-c++-*.rpm
```

## Apache (httpd)

```bash
rpm -Uvh apr-*.rpm
rpm -Uvh apr-util-*.rpm
rpm -Uvh httpd-*.rpm
rpm -Uvh httpd-tools-*.rpm
# devel
rpm -Uvh apr-devel-*.rpm apr-util-devel-*.rpm
rpm -Uvh expat-devel-*.rpm libdb-devel-*.rpm openldap-devel-*.rpm cyrus-sasl-devel-*.rpm
rpm -Uvh httpd-devel-*.rpm
```

## Tomcat / Connector 의존

```bash
rpm -Uvh java-1.8.0-openjdk-*.rpm   # 또는 jdk
rpm -Uvh pcre-devel-*.rpm
```
