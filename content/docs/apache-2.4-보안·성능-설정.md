+++
title = "Apache 2.4 보안·성능 설정"
date = 2024-08-22T04:54:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["WAS", "WEB", "WINDOWS"]
toc = true

[extra]
source = "notion"
notion_id = "5a60c11c-dada-461e-b9c5-32dc5aa7cdd7"
notion_url = "https://app.notion.com/p/Apache-2-4-5a60c11cdada461eb9c532dc5aa7cdd7"
external_url = "https://hyuunchul.tistory.com/289"
+++

## ServerTokens

`httpd-default.conf`

```
ServerTokens ProductOnly
```

## 메모리·캐시

`httpd.conf`

```javascript
EnableMMAP off
EnableSendfile off
```

DocumentRoot `<Directory>`:

```javascript
Header always set Pragma "no-cache"
Header always set Expires "Thu, 1 Jan 1970 00:00:00 GMT"
Header always set Cache-Control "max-age=0, no-store, no-cache, must-revalidate"
Header unset ETag
FileETag None
```

## MPM EVENT — 동시접속 2048 / 4096

`httpd-mpm.conf`

```javascript
<IfModule mpm_event_module>
    StartServers             32
    ServerLimit              32
    MinSpareThreads        512
    MaxSpareThreads        1024
    ThreadsPerChild          64
    MaxRequestWorkers      2048
    MaxConnectionsPerChild    0
    AsyncRequestWorkerFactor  1
</IfModule>
# 4096: StartServers/ServerLimit 64, MinSpare 1024, MaxSpare 3072, MaxRequestWorkers 4096
```

## MPM WinNT — 2048

```javascript
<IfModule mpm_winnt_module>
    ThreadsPerChild        2048
    ThreadLimit            2048
    MaxConnectionsPerChild    0
</IfModule>
```

## 보안 헤더

```javascript
Header edit Set-Cookie ^(.*)$ $1;HttpOnly;Secure;SameSite=None;
Header always set X-Content-Type-Options nosniff
Header always set X-XSS-Protection "1; mode=block"
Header always set Content-Security-Policy "default-src 'self' 'unsafe-inline' 'unsafe-eval'"
Header always set Content-Security-Policy-Report-Only "default-src 'self' 'unsafe-inline' 'unsafe-eval'"
```

## SSL

```javascript
SSLProtocol -all +TLSv1.2 +TLSv1.3
SSLProxyProtocol -all +TLSv1.2 +TLSv1.3
```

## mod\_jk

`connection_pool_*` = MPM `ThreadsPerChild`와 동일

```javascript
worker.template.connection_pool_minsize=64
worker.template.connection_pool_size=64
```
