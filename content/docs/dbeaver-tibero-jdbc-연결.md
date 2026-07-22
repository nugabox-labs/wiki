+++
title = "DBeaver Tibero JDBC 연결"
date = 2020-03-24T19:53:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["DB", "Tibero"]
toc = true

[extra]
source = "notion"
notion_id = "b5ce2a3a-6651-4319-ad3a-7337bd8bbf2b"
notion_url = "https://app.notion.com/p/DBeaver-Tibero-JDBC-b5ce2a3a66514319ad3a7337bd8bbf2b"
external_url = "http://blog.naver.com/PostView.nhn?blogId=sisosw&logNo=221562085589"
+++

## 드라이버 등록

- Driver Name: `Tibero`
- Class Name: `com.tmax.tibero.jdbc.TbDriver`
- URL Template: `jdbc:tibero:thin:@{host}[:{port}]:{database}`
- Default Port: `8629`
- JAR: `tibero6-jdbc.jar` (`$TB_HOME/client/lib` → DBeaver `lib/` 복사)

Database → New Connection → Tibero → Test Connection.

참고: 테이블 조회는 되나 프로시저 소스 보기는 제한될 수 있음.
