+++
title = "Apache SetEnvIf no-jk"
date = 2021-12-09T05:46:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["WEB", "WAS"]
toc = true

[extra]
source = "notion"
notion_id = "325341f7-a6fa-4837-9446-d1a970b4a010"
notion_url = "https://app.notion.com/p/Apache-SetEnvIf-no-jk-325341f7a6fa48379446d1a970b4a010"
external_url = "https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=twodplay&logNo=220405028892"
+++

## SetEnvIf + no-jk

```javascript
JkMount /* tomcat

SetEnvIf Request_URI "\.+html$" html_filter_flag=1
SetEnvIf Request_URI "test\.+html$" html_filter_flag=0
SetEnvIf html_filter_flag 1 no-jk
```

- `.html` 전부 no-jk (`JkMount`보다 우선)
- `test*.html`만 no-jk 해제

문서: [mod\_setenvif](http://httpd.apache.org/docs/2.2/ko/mod/mod_setenvif.html)
