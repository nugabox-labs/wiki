+++
title = "맥에서 포트 점유 프로세스(Tomcat 등) 강제종료"
date = "2019-10-04T06:45:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["BACK-END"]
tags = ["JAVA"]
toc = true

[extra]
source = "notion"
notion_id = "fa89614e-ce43-4bd0-9cfc-d4349f2dde30"
notion_url = "https://app.notion.com/p/Tomcat-fa89614ece434bd09cfcd4349f2dde30"
+++

## 맥에서 포트 점유 프로세스(Tomcat 등) 강제 종료

```bash
sudo lsof -i :8080     # 해당 포트 사용 중인 PID 확인
kill -9 PID             # 강제 종료
```
