+++
title = "Tomcat Engine/Instance 분리 (Multi Instance) 설정"
date = "2020-09-18T11:27:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["SERVER"]
tags = ["WAS"]
toc = true

[extra]
source = "notion"
notion_id = "cd3bfb64-43cb-4191-b5ce-0e42b21f684c"
notion_url = "https://app.notion.com/p/Tomcat-Engine-Instance-Multi-Instance-cd3bfb6443cb4191b5ce0e42b21f684c"
external_url = "https://stevenjsmin.tistory.com/m/115"
+++

## Tomcat Engine/Instance 분리 (Multi Instance)

Engine(lib, bin)과 Instance(conf, logs, temp, webapps, work)를 분리하면 톰캣 엔진 하나로 여러 인스턴스를 운영 가능(버전관리 용이, 중복설치 불필요)

**필요 환경변수**: `CATALINA_HOME`(엔진 경로), `CATALINA_BASE`(인스턴스 홈), `CATALINA_TMPDIR`, `JAVA_HOME`, `CLASSPATH`

### 1) 엔진 설치

```bash
tar zxvf apache-tomcat-8.0.5.tar.gz
ln -s /opt/apps/apache-tomcat-8.0.5 /opt/tomcat
```

### 2) 인스턴스 디렉토리 구성 (예: tomcat-root, tomcat-instance1~3)

```bash
mkdir tomcat-root && cd tomcat-root
cp -R /opt/tomcat/conf ./conf
cp -R /opt/tomcat/logs ./logs
cp -R /opt/tomcat/temp ./temp
cp -R /opt/tomcat/webapps ./webapps
cp -R /opt/tomcat/work ./work
```

- 다른 인스턴스들도 각자 디렉토리에 동일하게 복사
- 엔진 쪽은 bin/lib만 남기고 나머지는 삭제 가능:

```bash
rm -rf conf/ logs/ temp/ webapps/ work/ LICENSE NOTICE RELEASE-NOTES RUNNING.txt
```

### 3) 기동/종료 스크립트 (인스턴스별)

```bash
#!/usr/bin/env bash
# export TOMCAT_SERVER_NAME="tomcat-root"
CUR_DIR=`pwd`
export CATALINA_OPTS="-Denv=product -Denv.servername=${TOMCAT_SERVER_NAME}"
export CATALINA_BASE="${CUR_DIR}"
export CATALINA_TMPDIR="${CUR_DIR}/temp"
export CATALINA_OUT="${CUR_DIR}/logs/catalina.out"
export CATALINA_PID="/var/run/${TOMCAT_SERVER_NAME}.pid"
cd $CATALINA_HOME/bin
./startup.sh   # 종료 시 ./shutdown.sh
```

### 4) 포트 재설정 (인스턴스마다 충돌 방지)

기존 포트 앞에 정수를 순차적으로 붙이는 방식(예: 기본+10000):

```xml
<Server port="18005" shutdown="SHUTDOWN">
  ...
  <Connector connectionTimeout="20000" port="18080"
      protocol="org.apache.coyote.http11.Http11NioProtocol" redirectPort="18443" />
  ...
  <Connector port="18109" protocol="AJP/1.3" redirectPort="18443" />
</Server>
```

원문: [https://stevenjsmin.tistory.com/m/115](https://stevenjsmin.tistory.com/m/115)
