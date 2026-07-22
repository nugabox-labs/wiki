+++
title = "Tomcat maxThreads 동시 접속"
date = 2021-08-04T01:49:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["WAS"]
toc = true

[extra]
source = "notion"
notion_id = "4e9afeec-e2cc-4b5f-9f60-26b89c023a39"
notion_url = "https://app.notion.com/p/Tomcat-maxThreads-4e9afeece2cc4b5f9f6026b89c023a39"
+++

## Connector (`conf/server.xml`)

```xml
<Connector port="8009" protocol="HTTP/1.1"
    URIEncoding="UTF-8"
    connectionTimeout="5000"
    disableUploadTimeout="true"
    maxSpareThreads="75"
    maxThreads="500"
    minSpareThreads="25"
    acceptCount="10"
/>
```

- `maxThreads`: 스레드 풀 최대(동시 처리 상한)
- `acceptCount`: 유휴 스레드 없을 때 대기 큐(기본 100)

## Apache+Tomcat

Tomcat만 키워도 Apache가 병목이면 무의미. prefork라면 `MaxClients`/`ServerLimit`도 함께 조정하고, 가능하면 `maxThreads`와 맞출 것.

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
