+++
title = "Tomcat 기동 스크립트"
date = 2021-07-28T04:54:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER", "DEV-OPS"]
tags = ["WAS", "BASH"]
toc = true

[extra]
source = "notion"
notion_id = "34681252-b08b-4ccf-8b51-6a9638d33922"
notion_url = "https://app.notion.com/p/Tomcat-34681252b08b4ccf8b516a9638d33922"
+++

```bash
#!/bin/sh

#### Tomcat 엔진이 분리되어 있는 경우 CATALINA_HOME이 엔진 경로
export INSTANCE_NAME=
export CATALINA_HOME=/usr/local/tomcat8

########## Tomcat 종료 ########## 
if [ -z ${INSTANCE_NAME} ]; then
  tomcat_pid() {
     echo `ps aux | grep org.apache.catalina.startup.Bootstrap | grep 'catalina.base='${CATALINA_HOME} | grep -v grep | awk '{ print $2 }'`
  }
else
  tomcat_pid() {
     echo `ps aux | grep org.apache.catalina.startup.Bootstrap | grep ${INSTANCE_NAME} | grep -v grep | awk '{ print $2 }'`
  }
  export CATALINA_BASE=/home/${INSTANCE_NAME}
fi

pid=$(tomcat_pid)
echo "killing pid: $pid"
kill -9 $pid

echo "$nowDate Tomcat 서버 종료!"

########## Tomcat 기동 ########## 
if [ -z ${INSTANCE_NAME} ]; then
  ${CATALINA_HOME}/bin/startup.sh
else
  export CATALINA_BASE=/home/${INSTANCE_NAME}
  ${CATALINA_BASE}/bin/startup.sh
fi

echo "$nowDate Tomcat 서버 시작 완료!"
```
