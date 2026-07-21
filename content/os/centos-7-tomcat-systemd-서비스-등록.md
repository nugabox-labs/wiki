+++
title = "CentOS 7 Tomcat systemd 서비스 등록"
date = 2020-12-02T18:39:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["WAS", "LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "78212eed-a097-4fc2-8fc4-88c28d4aac95"
notion_url = "https://app.notion.com/p/CentOS-7-Tomcat-systemd-78212eeda0974fc28fc488c28d4aac95"
external_url = "https://haenny.tistory.com/141"
+++

## unit 파일

```bash
vi /etc/systemd/system/tomcat.service
```

```
[Unit]
Description=Apache Tomcat 9
After=network.target syslog.target

[Service]
Type=forking
Environment="JAVA_HOME=/usr/java/default"
Environment="CATALINA_HOME=/usr/local/tomcat"
User=root
Group=root
ExecStart=/usr/local/tomcat/bin/startup.sh
ExecStop=/usr/local/tomcat/bin/shutdown.sh

[Install]
WantedBy=multi-user.target
```

`JAVA_HOME`/`CATALINA_HOME`은 환경에 맞게 수정. Tomcat 쪽 Java 설정은 `$CATALINA_HOME/bin/setclasspath.sh`에서 확인.

## 등록·제어

```bash
systemctl daemon-reload
systemctl enable tomcat.service
systemctl start tomcat.service
systemctl stop tomcat.service
systemctl status tomcat.service
# 자동시작 해제: systemctl disable tomcat.service
```
