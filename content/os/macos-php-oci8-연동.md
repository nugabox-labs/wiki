+++
title = "macOS PHP OCI8 연동"
date = 2023-03-11T14:06:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["MACOS"]
toc = true

[extra]
source = "notion"
notion_id = "91891e7e-a1be-4f5a-a590-8b7da5f788df"
notion_url = "https://app.notion.com/p/macOS-PHP-OCI8-91891e7ea1be4f5aa5908b7da5f788df"
external_url = "https://bestofsky.com/185"
+++

## 설치 (macOS Intel, 구버전)

```bash
# instantclient-basic, instantclient-sdk 64비트 다운로드 후 압축 해제
mv instantclient_64 /usr/local/oracle/instantclient_64
cd /usr/local/oracle/instantclient_64
ln -s libclntsh.dylib.10.1 libclntsh.dylib

pecl install oci8
# 프롬프트: instantclient,/usr/local/oracle/instantclient_64

# pecl 실패 시
phpize
./configure --with-oci8=instantclient,/usr/local/oracle/instantclient_64
make && make install
```

```
; php.ini
extension=oci8.so
```

## phpinfo에 oci8 미표시

```bash
mkdir -p /b/227/rdbms
ln -s /usr/local/oracle/instantclient_64 /b/227/rdbms/lib
```

## OCIEnvNlsCreate / DYLD\_LIBRARY\_PATH

- `.bash_profile`, `/etc/profile`, httpd.conf `SetEnv`, `putenv()`는 안 먹을 수 있음
- macOS 기본 Apache는 `/System/Library/LaunchDaemons/org.apache.httpd.plist`의 EnvironmentVariables를 씀

```xml
<key>EnvironmentVariables</key>
<dict>
    <key>DYLD_LIBRARY_PATH</key>
    <string>/usr/local/oracle/instantclient_64</string>
</dict>
```

plist 추가 후 Apache 재시작.

## Navicat ORA-12737 (KO16MSWIN949)

instantclient 32비트를 추가 설치하고 Navicat에서 해당 클라이언트 지정.
