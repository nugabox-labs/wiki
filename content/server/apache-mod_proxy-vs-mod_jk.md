+++
title = "Apache mod_proxy vs mod_jk"
date = 2020-11-19T12:52:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["WEB", "WAS"]
toc = true

[extra]
source = "notion"
notion_id = "6b0f7599-6014-4539-ab35-9e96240dd162"
notion_url = "https://app.notion.com/p/Apache-mod_proxy-vs-mod_jk-6b0f759960144539ab359e96240dd162"
external_url = "https://jfrom.tistory.com/entry/modjk-%EB%8C%80%EC%8B%A0-modproxy%EC%82%AC%EC%9A%A9"
+++

mod\_jk가 정상이면 교체 불필요. mod\_proxy는 별도 모듈 빌드·workers 파일 없이 사용(Apache 2.2+).

> `mod_proxy_ajp`는 8KB 이상 바디 이슈 보고 → 그때는 mod\_jk 또는 `mod_proxy_http`.

## AJP

```javascript
ProxyPassMatch ^/(.*\.jsp)$  ajp://localhost:8009/$1
ProxyPassReverse / ajp://localhost:8009/
```

## HTTP (Tomcat AJP connector 불필요)

```javascript
ProxyPassMatch ^/(.*\.jsp)$  http://localhost:8080/$1
ProxyPassReverse / http://localhost:8080/
```

## 정적 제외 / 선택 프록시

```javascript
ProxyPass /images !
ProxyPass /css !
ProxyPass / http://backend.example.com/
ProxyPassMatch ^/(.*\.gif)$ http://backend.example.com/$1
```

## VirtualHost 예

```javascript
<VirtualHost *:80>
    <Proxy *>
        Order deny,allow
        Allow from all
    </Proxy>
    ProxyPass / ajp://localhost:8009/
    ProxyPassReverse / ajp://localhost:8009/
</VirtualHost>
```

## 참고

- [mod\_jk vs mod\_proxy](https://stackoverflow.com/questions/1081918/apache-to-tomcat-mod-jk-vs-mod-proxy)
- [ProxyPass](https://httpd.apache.org/docs/2.2/mod/mod_proxy.html#proxypass)
