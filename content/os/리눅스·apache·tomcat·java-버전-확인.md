+++
title = "리눅스·Apache·Tomcat·Java 버전 확인"
date = 2019-05-17T01:13:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER", "BACK-END"]
tags = ["LINUX", "WEB", "WAS", "JAVA"]
toc = true

[extra]
source = "notion"
notion_id = "566fc506-370d-4e33-b04c-4024f71645c6"
notion_url = "https://app.notion.com/p/Apache-Tomcat-Java-566fc506370d4e33b04c4024f71645c6"
external_url = "https://app.notion.com/p/24b1294b01d9440098a4cc56ebce5417"
+++

## Apache

```bash
httpd -v
# Server version: Apache/x.x.x
```

## Tomcat

```bash
$CATALINA_HOME/bin/version.sh
# 또는
$CATALINA_HOME/bin/catalina.sh version
cat $CATALINA_HOME/RELEASE-NOTES | head

# 마이너까지
cd $CATALINA_HOME/lib
jar xf catalina.jar org/apache/catalina/util/ServerInfo.properties
grep number org/apache/catalina/util/ServerInfo.properties
```

## Java

```bash
java -version
```

## OS

```bash
cat /etc/redhat-release
cat /proc/version
uname -a
```

## mod\_jk

```bash
strings apache/modules/mod_jk.so | grep mod_jk/
```
