+++
title = "Tomcat 동시접속자"
date = 2021-08-04T01:49:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["WAS"]
toc = true

[extra]
source = "notion"
notion_id = "4e9afeec-e2cc-4b5f-9f60-26b89c023a39"
notion_url = "https://app.notion.com/p/Tomcat-4e9afeece2cc4b5f9f6026b89c023a39"
+++

## Tomcat 동시접속자 수 늘리기

`conf/server.xml`의 Connector 옵션:

```xml
<Connector port="8009" protocol="HTTP/1.1"
    URIEncoding="UTF-8"
    connectionTimeout="5000"
    disableUploadTimeout="true"
    maxSpareThreads="75"
    maxThreads="500"        <!-- 동시 접속자 수 -->
    minSpareThreads="25"
    acceptCount="10"
/>
```

- `maxThreads`: 동시 접속자 수(스레드 풀 최대 크기)
- `acceptCount`: 노는 스레드가 없을 때 대기하는 큐 크기(기본 100)

**Apache+Tomcat 조합 시 주의**: Tomcat만 늘려도 Apache 쪽 성능이 안 따라주면 소용없음. Apache `MaxClients`(prefork MPM)도 함께 늘려야 함:

```javascript
<IfModule prefork.c>
    StartServers 5
    MinSpareServers 5
    MaxSpareServers 5
    ServerLimit 2000
    MaxClients 2000
    MaxRequestsPerChild 0
</IfModule>
```

- Tomcat `maxThreads`와 Apache `MaxClients`를 같은 값으로 맞추는 것을 권장
