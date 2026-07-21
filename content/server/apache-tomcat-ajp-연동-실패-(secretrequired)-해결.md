+++
title = "Apache-Tomcat AJP 연동 실패 (secretRequired) 해결"
date = 2020-03-31T19:54:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["WAS"]
toc = true

[extra]
source = "notion"
notion_id = "db00b902-f98c-47cf-924f-e5097bb6c473"
notion_url = "https://app.notion.com/p/Apache-Tomcat-AJP-secretRequired-db00b902f98c47cf924fe5097bb6c473"
+++

> 원본이 스크린샷 이미지뿐(텍스트 추출 불가)

## Apache-Tomcat AJP 연동 실패 (Tomcat 7.0.100/8.5.51/9.0.31+, 무한로딩/403/503)

- 원인: Ghostcat(CVE-2020-1938) 대응으로 해당 버전부터 AJP 커넥터에 `secret` 검증이 강제됨. mod\_jk/mod\_proxy\_ajp 쪽에 인증 정보가 없으면 연동 실패
- 해결: `server.xml`의 AJP Connector에 `secretRequired`/`address` 설정 추가하거나, 외부에서 직접 AJP 포트 접근이 불필요하면 `address="127.0.0.1"`로 바인딩 제한

```xml
<Connector protocol="AJP/1.3" address="127.0.0.1" port="8009"
    secretRequired="false" redirectPort="8443" />
```

- 운영 환경에서는 `secretRequired="true"` + `secret="비밀값"`을 Apache 쪽 mod\_jk/mod\_proxy\_ajp 설정과 일치시키는 것이 보안상 권장됨
