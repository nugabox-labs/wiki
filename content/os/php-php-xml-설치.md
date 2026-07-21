+++
title = "PHP php-xml 설치"
date = 2020-09-10T13:33:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "BACK-END"]
tags = ["LINUX", "PHP"]
toc = true

[extra]
source = "notion"
notion_id = "dc9a0160-2c4f-43f7-94e7-3dbacd3a5258"
notion_url = "https://app.notion.com/p/PHP-php-xml-dc9a01602c4f43f794e73dbacd3a5258"
external_url = "https://zetawiki.com/wiki/CentOS_php-xml_%EC%84%A4%EC%B9%98"
+++

## 설치 (CentOS)

```bash
yum install php-xml      # CentOS5: php53-xml
php -m | grep -i dom
service httpd restart    # 또는 systemctl restart httpd
```

DOMDocument 등 XML 확장.
