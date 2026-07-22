+++
title = "PHP 개발서버 구축"
date = 2021-01-22T07:53:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "BACK-END"]
tags = ["LINUX", "PHP"]
toc = true

[extra]
source = "notion"
notion_id = "d3b522ce-c5d8-470e-afb2-ee6a21515686"
notion_url = "https://app.notion.com/p/PHP-d3b522cec5d8470eafb2ee6a21515686"
+++

## CentOS 부팅 USB + PHP 개발서버

1. CentOS ISO 다운로드
1. Windows Rufus로 부팅 USB 생성
1. USB 부팅 후 설치(파티션 분리)
1. `php.ini` browscap 경로

```bash
sed -i 's/;browscap = extra\/browscap.ini/browscap = \/etc\/browscap.ini/g' php70.ini
```
