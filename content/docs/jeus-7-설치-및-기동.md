+++
title = "Jeus 7 설치 및 기동"
date = 2019-09-16T04:49:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["WAS"]
toc = true

[extra]
source = "notion"
notion_id = "475decc8-3e31-405c-9eb4-b8cabb47ed85"
notion_url = "https://app.notion.com/p/Jeus-7-475decc83e31405c9eb4b8cabb47ed85"
external_url = "https://onestone-note.tistory.com/44"
+++

## 사용자·설치

```bash
useradd -d /home/jeus7 -m -s /bin/bash jeus7 && passwd jeus7
su - jeus7
chmod u+x jeus70_unix-generic_ko.bin && ./jeus70_unix-generic_ko.bin
```

- JDK `/usr/java` · 도메인 `jeus_domain` · 관리자 `administrator`

```bash
jeusadmin -fullversion && jeusadmin -licenseinfo
```

## 기동 순서 DAS → Node Manager → MS

```bash
# dsboot
startDomainAdminServer -domain jeus_domain -server adminServer -u administrator -p 비밀번호
# dsdown
jeusadmin -host localhost:9736 -domain jeus_domain -u administrator -p 비밀번호 local-shutdown
# nmboot / nmdown
nohup startNodeManager > $JEUS_HOME/nodemanager/logs/nm.log &
stopNodeManager -host localhost -port 7730
```

웹어드민: `http://IP:9736/webadmin` · 접속 불가 시 `domain.xml` BASE listen-address를 실제 IP로.
