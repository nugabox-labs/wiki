+++
title = "APM 백업·재설치 (레거시)"
date = 2019-03-28T09:07:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "3a2374a3-69be-40c0-a2ba-d13f381f06f8"
notion_url = "https://app.notion.com/p/APM-3a2374a369be40c0a2bad13f381f06f8"
external_url = "https://www.xpressengine.com/qna/1571665"
+++

## APM 백업·재설치 (레거시 소스 컴파일)

### 백업

```bash
cd /home/path && tar cvfp backup.tar .
cd /usr/local/mysql/var/path && tar cvfp db-backup.tar .
```

### 삭제(주의)

```bash
rm -rf /usr/local/apache /usr/local/php /usr/local/mysql
```

### 재설치 요약 (구버전 예시)

MySQL/Apache/PHP를 `/usr/local/{mysql,apache,php}`에 `./configure && make && make install` 후 init 링크.

복구: `tar xvfp`로 홈·DB 디렉터리 복원.

상세 원문: [https://www.xpressengine.com/qna/1571665](https://www.xpressengine.com/qna/1571665)
