+++
title = "OpenSSL·ulimit·JBoss 참고 링크"
date = 2021-02-23T06:46:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["WEB", "LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "7918bb83-c355-4fe8-9e61-ec68f4d45f79"
notion_url = "https://app.notion.com/p/OpenSSL-ulimit-JBoss-7918bb83c3554fe89e61ec68f4d45f79"
+++

링크·메모 모음 (정리용).

## FD / ulimit / sysctl

- [http://file-leak-detector.kohsuke.org/](http://file-leak-detector.kohsuke.org/)
- [https://twofootdog.tistory.com/51](https://twofootdog.tistory.com/51)
- [https://zetawiki.com/wiki/리눅스\_sysctl](https://zetawiki.com/wiki/리눅스_sysctl)
- [https://woowabros.github.io/experience/2018/04/17/linux-maxuserprocess-openfiles.html](https://woowabros.github.io/experience/2018/04/17/linux-maxuserprocess-openfiles.html)
- [https://lunatine.net/2014/05/28/limits-conf-nofile-big-value-effect/](https://lunatine.net/2014/05/28/limits-conf-nofile-big-value-effect/)

## JBoss

- [https://vaert.tistory.com/188](https://vaert.tistory.com/188)
- [https://carfediem-is.tistory.com/10](https://carfediem-is.tistory.com/10)

## OpenSSL / Apache SSL

- [https://archive.apache.org/dist/httpd/](https://archive.apache.org/dist/httpd/)
- [https://www.openssl.org/source/old/1.0.2/](https://www.openssl.org/source/old/1.0.2/)
- [https://www.ssllabs.com/ssltest/](https://www.ssllabs.com/ssltest/)
- [https://mapoo.net/os/oslinux/openssl-source-install/](https://mapoo.net/os/oslinux/openssl-source-install/)
- `export LIBS=-ldl` (소스 링크 시)
- `curl -Ivvv https://example.com`

## 기타

- OpenJDK 1.8 debuginfo는 서버 세팅 시 버전 맞는 패키지 설치
- jmap 오류: [https://lklingling.tistory.com/entry/jmap-사용-시-에러](https://lklingling.tistory.com/entry/jmap-사용-시-에러)
