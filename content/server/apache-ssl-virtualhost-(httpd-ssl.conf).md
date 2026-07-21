+++
title = "Apache SSL VirtualHost (httpd-ssl.conf)"
date = "2019-12-23T08:32:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["SERVER"]
tags = ["WEB"]
toc = true

[extra]
source = "notion"
notion_id = "4c246323-75ba-46ae-8e52-345f1af291fe"
notion_url = "https://app.notion.com/p/Apache-SSL-VirtualHost-httpd-ssl-conf-4c24632375ba46ae8e52345f1af291fe"
+++

> 도메인·인증서 경로는 플레이스홀더로 일반화.

```javascript
Listen 443

<VirtualHost www.example.com:443>
    ServerAdmin webmaster@example.com
    DocumentRoot "/home/app/www"
    ServerName www.example.com
    ServerAlias en.example.com
    DirectoryIndex index.do index.jsp index.html
    AddDefaultCharset UTF-8

    JkMount /WEB-INF/* worker1
    JkMount /*.do worker1
    JkMount /*.jsp worker1

    ErrorLog "|/usr/local/apache2/bin/rotatelogs /usr/local/apache2/logs/www-error_log_%Y%m%d 86400"
    CustomLog "|/usr/local/apache2/bin/rotatelogs /usr/local/apache2/logs/www-access_log_%Y%m%d 86400" combined

    SSLEngine on
    SSLProtocol all -SSLv2 -SSLv3
    SSLCipherSuite ECDHE-RSA-AES128-SHA256:AES128-GCM-SHA256:AES128-SHA:AES256-SHA:!RC4:HIGH:!MD5:!aNULL:!EDH
    SSLCertificateFile "/usr/local/apache2/conf/ssl/www.example.com.crt"
    SSLCertificateKeyFile "/usr/local/apache2/conf/ssl/www.example.com.key"
    SSLCertificateChainFile "/usr/local/apache2/conf/ssl/chainca.crt"
</VirtualHost>
```

관련: SSLPassPhraseDialog는 [Apache SSLPassPhraseDialog 자동 입력](https://app.notion.com/p/2b54f16d42c54fe5a8daa9ba14144415) 참고.
