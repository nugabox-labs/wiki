+++
title = "CentOS7 Tomcat systemd 서비스 등록"
date = "2020-12-02T18:39:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["SERVER"]
tags = ["WAS"]
toc = true

[extra]
source = "notion"
notion_id = "78212eed-a097-4fc2-8fc4-88c28d4aac95"
notion_url = "https://app.notion.com/p/CentOS7-Tomcat-systemd-78212eeda0974fc28fc488c28d4aac95"
external_url = "https://haenny.tistory.com/141"
+++

## Tomcat systemd 서비스 등록 (CentOS 7)

- root는 원격 접속이 보통 막혀 있어, 서버 다운 시 매번 콘솔 로그인해서 수동 기동해야 하는 번거로움을 없애기 위해 서비스로 등록

```bash
vi /etc/systemd/system/tomcat.service
```

```
[Unit]
Description=tomcat 9
After=network.target syslog.target

[Service]
Type=forking
Environment="톰캣 경로"
User=root
Group=root
ExecStart=톰캣경로/bin/startup.sh
ExecStop=톰캣경로/bin/shutdown.sh

[Install]
WantedBy=multi-user.target
```

- Tomcat에 JAVA\_HOME이 설정 안 돼 있으면 추가:

```
Environment="JAVA_HOME=자바경로"
Environment="CATALINA_HOME=톰캣경로"
```

- 톰캣의 자바 설정 여부는 `톰캣경로/bin/setclasspath.sh`에서 확인 가능

```bash
systemctl enable tomcat.service   # 부팅 시 자동 시작 등록
systemctl start tomcat.service    # 시작
systemctl stop tomcat.service     # 중지
systemctl disable tomcat.service  # 자동시작 해제
systemctl status tomcat.service   # 상태 확인
```

원문: [https://haenny.tistory.com/141](https://haenny.tistory.com/141)
