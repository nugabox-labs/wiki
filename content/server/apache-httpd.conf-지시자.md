+++
title = "Apache httpd.conf 지시자"
date = 2019-03-14T07:38:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["WEB"]
toc = true

[extra]
source = "notion"
notion_id = "0b16d2db-55c2-440d-9346-b7791cd18169"
notion_url = "https://app.notion.com/p/Apache-httpd-conf-0b16d2db55c2440d9346b7791cd18169"
+++

> CentOS 6.4 / Apache 2.2.15 yum 설치 기준. 경로: `/etc/httpd/conf/httpd.conf`

## 핵심 지시자

| 지시자 | 설명 |  |  |
| --- | --- | --- | --- |
| `ServerTokens Prod` | 응답 헤더 최소화 (`Server: Apache`) |  |  |
| `ServerRoot "/etc/httpd"` | Apache 홈, 이후 상대경로 기준 |  |  |
| `PidFile run/httpd.pid` | PID 파일 |  |  |
| `Timeout 300` | 무응답 시 연결 종료(초) |  |  |
| `KeepAlive On` | 지속 연결 |  |  |
| `MaxKeepAliveRequests 100` | 연결당 최대 요청 (0=무제한) |  |  |
| `KeepAliveTimeout 2` | 다음 요청 대기(초) |  |  |
| `Listen 80` | 리슨 포트 |  |  |
| `User`/`Group nobody` | 자식 프로세스 소유자 |  |  |
| `ServerName` | Canonical 호스트명 |  |  |
| `UseCanonicalName Off` | 클라이언트가 보낸 Host 사용 |  |  |
| `DocumentRoot "/var/www/html"` | 문서 루트 (`/` 끝 X) |  |  |
| `DirectoryIndex` | 기본 문서 목록 |  |  |
| `AccessFileName .htaccess` | 디렉터리별 접근 제어 파일 |  |  |
| `HostnameLookups Off` | 로그에 IP만 (DNS 질의 부하 방지) |  |  |
| `ErrorLog` / `LogLevel warn` | 에러 로그 |  |  |
| `CustomLog ... combined` | 액세스 로그 |  |  |
| \`ServerSignature On\\ | Off\\ | EMail\` | 에러 페이지 서명 |

## MPM (prefork / worker)

```javascript
<IfModule prefork.c>
    StartServers       8
    MinSpareServers    5
    MaxSpareServers   20
    ServerLimit      256
    MaxClients       256
    MaxRequestsPerChild 4000
</IfModule>

<IfModule worker.c>
    StartServers         4
    MaxClients         300
    MinSpareThreads     25
    MaxSpareThreads     75
    ThreadsPerChild     25
    MaxRequestsPerChild  0
</IfModule>
```

## Directory / Options / AllowOverride

```javascript
<Directory />
    Options FollowSymLinks
    AllowOverride None
</Directory>

<Directory "/var/www/html">
    Options None
    AllowOverride None
    Order allow,deny
    Allow from all
</Directory>
```

- **Options**: `None`, `Indexes`, `Includes`, `FollowSymLinks`, `ExecCGI`, `MultiViews` 등
- **AllowOverride**: `None`, `All`, `AuthConfig`, `FileInfo`, `Indexes`, `Options`, `Limit`
- **Order**: `allow,deny` / `deny,allow`

## .ht\* 파일 차단

```javascript
<Files ~ "^\.ht">
    Order allow,deny
    Deny from all
</Files>
```

## Alias / ScriptAlias

```javascript
Alias /icons/ "/var/www/icons/"
ScriptAlias /cgi-bin/ "/var/www/cgi-bin/"
```

## server-status / server-info (로컬만)

```javascript
<Location /server-status>
    SetHandler server-status
    Order deny,allow
    Deny from all
    Allow from 192.168.0.0/24
</Location>
```

`ExtendedStatus On` 권장.

## 가상호스트

```javascript
#NameVirtualHost *:80
<VirtualHost *:80>
    ServerAdmin webmaster@example.com
    DocumentRoot /www/docs/example.com
    ServerName example.com
    ErrorLog logs/example.com-error_log
    CustomLog logs/example.com-access_log common
</VirtualHost>
```

점검: `httpd -S`

## php.conf (`/etc/httpd/conf.d/php.conf`)

```javascript
AddHandler php5-script .php
AddType text/html .php
AddType application/x-httpd-php .php .phtml
AddType application/x-httpd-php-source .phps
```
