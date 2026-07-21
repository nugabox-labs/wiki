+++
title = "Apache Tomcat mod_jk 연동"
date = 2019-05-14T09:23:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["WEB", "WAS"]
toc = true

[extra]
source = "notion"
notion_id = "bdc4bef1-9e7b-4b9f-8fa6-1d8b6155cfbb"
notion_url = "https://app.notion.com/p/Apache-Tomcat-mod_jk-bdc4bef19e7b4b9f8fa61d8b6155cfbb"
+++

## 역할

Apache(Web)=정적, Tomcat(WAS)=동적. 연동: mod\_jk / mod\_proxy / mod\_proxy\_ajp.

흐름(mod\_jk): Client→Apache(80) → 동적은 AJP(8009)→Tomcat → Apache→Client

## mod\_jk 설치

```bash
yum install gcc gcc-c++ httpd-devel
# connectors: https://tomcat.apache.org/download-connectors.cgi
tar zxvf tomcat-connectors-*.tar.gz
cd tomcat-connectors-*/native
./configure --with-apxs=/usr/bin/apxs   # 또는 /usr/sbin/apxs
make && make install
```

## httpd.conf

```javascript
LoadModule jk_module modules/mod_jk.so
```

## VirtualHost

```javascript
<VirtualHost *:80>
ServerName localhost
JkMount /*.jsp tomcat
JkMount /*.json tomcat
JkMount /*.xml tomcat
JkMount /*.do tomcat
</VirtualHost>
```

## conf.modules.d/mod\_jk.conf

```javascript
<IfModule mod_jk.c>
JkWorkersFile conf/workers.properties
JkShmFile run/mod_jk.shm
JkLogFile logs/mod_jk.log
JkLogLevel info
JkLogStampFormat "[%y %m %d %H:%M:%S] "
</IfModule>
```

## [workers.properties](http://workers.properties/)

```javascript
worker.list=tomcat
worker.tomcat.port=8009
worker.tomcat.host=localhost
worker.tomcat.type=ajp13
worker.tomcat.lbfactor=1
```

Apache·Tomcat 재시작 후 8080 직접 vs 80 경유가 동일하면 성공.

## 점검

- ROOT Context: `conf/Catalina/localhost/ROOT.xml`

```xml
<Context docBase="/home/<user>/www" debug="0" privileged="true" reloadable="true"></Context>
```

- SELinux: `chcon -u system_u -r object_r -t httpd_modules_t /etc/httpd/modules/mod_jk.so`
- VirtualHost 충돌 여부
