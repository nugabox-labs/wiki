+++
title = "Tomcat 기동·재시작 스크립트"
date = 2021-07-28T04:54:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "DEV-OPS"]
tags = ["WAS", "BASH"]
toc = true

[extra]
source = "notion"
notion_id = "34681252-b08b-4ccf-8b51-6a9638d33922"
notion_url = "https://app.notion.com/p/Tomcat-34681252b08b4ccf8b516a9638d33922"
+++

엔진 분리(멀티 인스턴스) 환경용 종료 후 기동 스크립트.

```bash
#!/bin/sh
# INSTANCE_NAME 비우면 CATALINA_HOME 단일 인스턴스
export INSTANCE_NAME=
export CATALINA_HOME=/usr/local/tomcat8

########## 종료 ##########
if [ -z "${INSTANCE_NAME}" ]; then
  tomcat_pid() {
    ps aux | grep org.apache.catalina.startup.Bootstrap \
      | grep "catalina.base=${CATALINA_HOME}" | grep -v grep | awk '{ print $2 }'
  }
else
  tomcat_pid() {
    ps aux | grep org.apache.catalina.startup.Bootstrap \
      | grep "${INSTANCE_NAME}" | grep -v grep | awk '{ print $2 }'
  }
  export CATALINA_BASE=/home/${INSTANCE_NAME}
fi

pid=$(tomcat_pid)
echo "killing pid: $pid"
[ -n "$pid" ] && kill -9 $pid
echo "Tomcat 종료"

########## 기동 ##########
if [ -z "${INSTANCE_NAME}" ]; then
  ${CATALINA_HOME}/bin/startup.sh
else
  export CATALINA_BASE=/home/${INSTANCE_NAME}
  ${CATALINA_BASE}/bin/startup.sh
fi
echo "Tomcat 기동 완료"
```

> `kill -9`는 강제 종료. 가능하면 `shutdown.sh` 후 대기하는 편이 안전.
