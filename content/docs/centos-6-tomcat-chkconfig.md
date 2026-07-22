+++
title = "CentOS 6 Tomcat chkconfig"
date = 2020-08-31T16:33:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["LINUX", "WAS"]
toc = true

[extra]
source = "notion"
notion_id = "fbd08e6f-ae23-4694-9ca4-ad66cc9c2054"
notion_url = "https://app.notion.com/p/CentOS-6-Tomcat-chkconfig-fbd08e6fae2346949ca4ad66cc9c2054"
external_url = "https://blog.miyam.net/8"
+++

## chkconfig 등록 (CentOS 6)

```bash
cp /usr/local/server/tomcat/bin/catalina.sh /etc/init.d/tomcat
vi /etc/init.d/tomcat
# 파일 상단에 추가:
# chkconfig: 35 99 99
# description: Tomcat Server.
chkconfig --add tomcat
chkconfig --list tomcat
service tomcat start
```

> CentOS 7+는 systemd unit 사용 → CentOS 7 Tomcat systemd 서비스 등록
