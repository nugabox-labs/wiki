+++
title = "Apache-Tomcat 연동 (mod_jk/AJP)"
date = "2019-05-14T09:23:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["SERVER"]
tags = ["WEB", "WAS"]
toc = true

[extra]
source = "notion"
notion_id = "bdc4bef1-9e7b-4b9f-8fa6-1d8b6155cfbb"
notion_url = "https://app.notion.com/p/Apache-Tomcat-mod_jk-AJP-bdc4bef19e7b4b9f8fa61d8b6155cfbb"
+++

## Apache-Tomcat 연동 (mod\_jk / AJP)

- Apache(Web): 정적 파일 처리, Tomcat(WAS): 동적 파일 처리. Tomcat도 정적 처리 가능하나 느려서 역할 분리가 효율적
- 연동 방식 3가지: Tomcat Connector(mod\_jk), mod\_proxy(리버스 프록시), mod\_proxy\_ajp(AJP 프로토콜 리버스 프록시)
- 흐름(mod\_jk 기준): 클라이언트→Apache(80)→정적파일은 직접처리, 동적파일은 mod\_jk(8009)→Tomcat(8080)→처리 후 다시 Apache→클라이언트

### mod\_jk 연동 절차

```bash
yum install gcc gcc-c++ httpd-devel
wget -c http://tomcat.apache.org/download-connectors.cgi에서받은주소
tar zxvf tomcat-connectors-*.tar.gz
cd tomcat-connectors-*/native
./configure --with-apxs=/usr/bin/apxs   # 안되면 /usr/sbin/apxs
make && make install
```

**httpd.conf에 모듈 로드 추가**

```javascript
LoadModule jk_module modules/mod_jk.so
```

**가상호스트 설정 (httpd-vhost.conf 등)**

```javascript
<VirtualHost *:80>
ServerName localhost
JkMount /*.jsp tomcat
JkMount /*.json tomcat
JkMount /*.xml tomcat
JkMount /*.do tomcat
</VirtualHost>
```

**conf.modules.d/mod\_jk.conf 생성**

```javascript
<IfModule mod_jk.c>
JkWorkersFile conf/workers.properties
JkShmFile run/mod_jk.shm      # SELinux 때문에 반드시 run 밑에 위치
JkLogFile logs/mod_jk.log
JkLogLevel info
JkLogStampFormat "[%y %m %d %H:%M:%S] "
</IfModule>
```

**conf/**[**workers.properties**](http://workers.properties/)** 생성**

```javascript
worker.list=tomcat
worker.tomcat.port=8009   # Tomcat conf/server.xml의 AJP 포트와 일치
worker.tomcat.host=localhost
worker.tomcat.type=ajp13
worker.tomcat.lbfactor=1
```

Apache, Tomcat 재시작 후 8080(톰캣) 직접 접속과 80(아파치) 경유 접속이 같은 화면을 보이면 성공

### 안 될 때 체크리스트

- Tomcat 루트 경로를 Apache DocumentRoot와 일치시키기: `톰캣루트/conf/Catalina/localhost/ROOT.xml`

```xml
<Context docBase="/home/artmuse/www" debug="0" privileged="true" reloadable="true"></Context>
```

- SELinux 컨텍스트 설정:

```bash
chcon -u system_u -r object_r -t httpd_modules_t /etc/httpd/modules/mod_jk.so
```

- Apache 가상호스트 설정 충돌 여부 확인
