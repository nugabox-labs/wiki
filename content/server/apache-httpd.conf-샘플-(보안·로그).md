+++
title = "Apache httpd.conf 샘플 (보안·로그)"
date = "2021-07-23T00:00:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["SERVER"]
tags = ["WEB"]
toc = true

[extra]
source = "notion"
notion_id = "f4c85c26-089b-4506-9b71-3136069f6cc3"
notion_url = "https://app.notion.com/p/Apache-httpd-conf-f4c85c26089b45069b713136069f6cc3"
+++

## 샘플 httpd.conf (보안·로그 중심)

```javascript
ServerRoot "/etc/httpd"
ServerTokens prod
ServerSignature Off
ServerAdmin root@localhost
ServerName localhost
TraceEnable Off
Listen 80
User nobody
Group nobody

Include conf.modules.d/*.conf

<IfModule dir_module>
    DirectoryIndex index.html
</IfModule>
<Files ".ht*">
    Require all denied
</Files>

ErrorLog "logs/error_log"
LogLevel warn
LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"" combined
SetEnvIf Remote_Addr "::1" do_not_log
SetEnvIf Remote_Addr "127\\.0\\.0\\.1" do_not_log
SetEnvIfNoCase Request_URI "\\.(jpg|png|gif|css|ico|js)$" do_not_log
CustomLog "logs/access_log" combined env=!do_not_log

AddDefaultCharset UTF-8

<IfModule mod_headers.c>
    Header set X-Content-Type-Options nosniff
    Header set X-XSS-Protection "1;mode=block"
    Header set X-Frame-Options "SAMEORIGIN"
    Header unset X-Powered-By
</IfModule>

IncludeOptional conf.d/*.conf
```

## headers.conf 예

```bash
<IfModule mod_headers.c>
    Header set X-Content-Type-Options nosniff
    Header set X-XSS-Protection "1;mode=block"
</IfModule>
```

관련: [httpd.conf 지시자](https://app.notion.com/p/0b16d2db55c2440d9346b7791cd18169)
