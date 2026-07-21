+++
title = "JBoss EAP 설치 및 설정"
date = 2021-04-06T00:18:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["WAS"]
toc = true

[extra]
source = "notion"
notion_id = "5cefc368-a346-4dab-b0df-ba9046225c8e"
notion_url = "https://app.notion.com/p/JBoss-EAP-5cefc368a3464dabb0dfba9046225c8e"
+++

## 설치

```bash
unzip jboss-eap-6.4.0.zip   # 또는 yum/GUI 설치
$JBOSS_HOME/bin/add-user.sh   # 관리자 생성
```

## 외부 접속 (`standalone/configuration/standalone.xml`)

```xml
<interface name="management"><any-address/></interface>
<interface name="public"><any-address/></interface>
```

- 확인: `http://IP:8080/` · `http://IP:9990/management`

## 기동

```bash
$JBOSS_HOME/bin/standalone.sh -c=standalone.xml -b=0.0.0.0 -bmanagement=0.0.0.0
# 포트 offset: -Djboss.socket.binding.port-offset=100
# 도메인 모드: domain.sh -c=domain.xml --host-config=host.xml -b=0.0.0.0
```
