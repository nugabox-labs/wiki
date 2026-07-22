+++
title = "Tomcat 설치"
date = 2020-10-27T00:21:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["WAS", "LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "9c150547-502d-4055-b1d8-68bc7c786798"
notion_url = "https://app.notion.com/p/Tomcat-9c150547502d4055b1d868bc7c786798"
external_url = "https://tomcat.apache.org/"
+++

## JDK

```bash
yum list java*jdk-devel
yum install java-1.8.0-openjdk-devel.x86_64
```

## Tomcat 설치

Archive: [http://archive.apache.org/dist/tomcat/](http://archive.apache.org/dist/tomcat/)

```bash
wget -c http://archive.apache.org/dist/tomcat/tomcat-8/v8.5.59/bin/apache-tomcat-8.5.59.tar.gz
tar zxvf apache-tomcat-8.5.59.tar.gz -C /usr/local
ln -s /usr/local/apache-tomcat-8.5.59 /usr/local/tomcat
```

## Manager (`conf/tomcat-users.xml`)

```xml
<role rolename="manager-gui"/>
<role rolename="manager-script"/>
<role rolename="manager-status"/>
<user username="admin" password="<password>" roles="manager-gui,manager-script,manager-status"/>
```

- `webapps/ROOT` = 기본, `webapps/manager` = 관리자 (`http://localhost:8080/manager/html`)
- Manager Undeploy는 Deploy 경로(심볼릭 링크 포함)를 삭제할 수 있음 → 운영 비권장
- 인스턴스별 메모리 튜닝이 필요하면 멀티 인스턴스 구성 권장

## catalina.out 날짜별

`bin/catalina.sh`에서 `touch "$CATALINA_OUT"` 주석 후:

```bash
# Apache rotatelogs
2>&1 "&" | /usr/sbin/rotatelogs "$CATALINA_OUT"-%Y-%m-%d 86400 540 &
# 단순 날짜 접미사
>> "$CATALINA_OUT"-$(date '+%Y-%m-%d') 2>&1 "&"
```

## 메모리

```bash
JAVA_OPTS="-Djava.awt.headless=true -Dfile.encoding=UTF-8 -server -Xms2048M -Xmx4096M -XX:NewSize=512m -XX:MaxNewSize=512m -XX:+DisableExplicitGC"
```

## HTTP 메소드 제한 (`conf/web.xml`)

```xml
<security-constraint>
  <web-resource-collection>
    <web-resource-name>Restricted methods</web-resource-name>
    <url-pattern>/*</url-pattern>
    <http-method>PUT</http-method>
    <http-method>DELETE</http-method>
    <http-method>OPTIONS</http-method>
    <http-method>TRACE</http-method>
  </web-resource-collection>
  <auth-constraint />
</security-constraint>
```

## 버전 숨김

1. `server.xml` Connector에 `server="server"`
1. `catalina.jar` 내 `ServerInfo.properties`의 `server.info` 등 수정 후 재패키징

참고: [hanumoka JDK](https://www.hanumoka.net/2018/04/30/centOs-20180430-centos-install-jdk/) · [blog.miyam.net/83](https://blog.miyam.net/83)
