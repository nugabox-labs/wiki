+++
title = "JSP 환경 구축 JDK·Tomcat·mod_jk"
date = 2019-03-11T07:49:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER", "BACK-END"]
tags = ["LINUX", "JAVA", "WAS"]
toc = true

[extra]
source = "notion"
notion_id = "1fdd33e8-96c2-40b3-b574-16a5d9078a4e"
notion_url = "https://app.notion.com/p/JSP-JDK-Tomcat-mod_jk-1fdd33e896c240b3b57416a5d9078a4e"
external_url = "https://app.notion.com/p/24b1294b01d9440098a4cc56ebce5417"
+++

> Tomcat 8 + JDK 1.8 + mod\_jk (Apache 연동) 기준.

## 1. OpenJDK

```bash
yum list java*jdk-devel
yum install java-1.8.0-openjdk-devel.x86_64
rpm -qa java*jdk-devel
javac -version
```

## 1-1. Oracle JDK

```bash
yum remove java-1.6.0-openjdk-devel java-1.6.0-openjdk
wget <jdk8-tar.gz-URL>
tar -zxvf jdk-*.tar.gz
mv jdk1.8.* /usr/local/
cd /usr/local && ln -s jdk1.8.* java
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
java -version && javac -version
```

## 2. Tomcat

```bash
wget http://archive.apache.org/dist/tomcat/tomcat-8/v8.5.38/bin/apache-tomcat-8.5.38.tar.gz
tar zxvf apache-tomcat-8.5.38.tar.gz
mv apache-tomcat-8.5.38 /usr/share/tomcat
```

### iptables 8080

```bash
# /etc/sysconfig/iptables
-A INPUT -m state --state NEW -m tcp -p tcp --dport 8080 -j ACCEPT
service iptables restart
netstat -ntl
```

### init.d 등록

`/etc/init.d/tomcat`:

```bash
#!/bin/bash
# chkconfig: 345 50 50
# description: Tomcat
source /etc/profile
export CATALINA_HOME=/usr/share/tomcat
case "$1" in
  start)   $CATALINA_HOME/bin/startup.sh ;;
  stop)    $CATALINA_HOME/bin/shutdown.sh ;;
  restart) $CATALINA_HOME/bin/shutdown.sh; $CATALINA_HOME/bin/startup.sh ;;
  *) echo "Usage: $0 {start|stop|restart}"; exit 1 ;;
esac
```

```bash
chmod 755 /etc/init.d/tomcat
chkconfig --add tomcat
service tomcat start
# http://localhost:8080
```

## 3. mod\_jk

```bash
cd /usr/local/src
wget -c <tomcat-connectors-src-URL>
tar zxvf tomcat-connectors-*-src.tar.gz
cd tomcat-connectors-*-src/native
./configure --with-apxs=/usr/sbin/apxs
make && make install
which javac
readlink -f $(which javac)
```
