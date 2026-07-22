+++
title = "Webshell 대응 (업로드·Apache·PHP)"
date = 2019-09-03T02:01:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER", "BACK-END"]
tags = ["WEB", "LINUX", "PHP"]
toc = true

[extra]
source = "notion"
notion_id = "a6df32ce-c9af-4bf1-a4c9-a948f3026ace"
notion_url = "https://app.notion.com/p/Webshell-Apache-PHP-a6df32cec9af4bf1a4c9a948f3026ace"
+++

## Webshell 대응

- 업로드: whitelist 확장자만 서버 검증
- 저장 경로 실행권한 제거, 파일명 난수화, 확장자 제거/변경, Docroot 밖 이동

### Apache (업로드 디렉터리 PHP 비활성)

```javascript
<Directory /path/to/upload>
  php_admin_value engine Off
</Directory>
```

### PHP

```
disable_functions = system,exec,shell_exec,passthru,phpinfo,show_source,popen,proc_open
allow_url_fopen = Off
```

업로드 서버와 웹 서버 물리 분리 권장.
