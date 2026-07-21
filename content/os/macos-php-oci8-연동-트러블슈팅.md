+++
title = "macOS PHP-OCI8 연동 트러블슈팅"
date = 2023-03-11T14:06:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS"]
tags = ["MACOS"]
toc = true

[extra]
source = "notion"
notion_id = "91891e7e-a1be-4f5a-a590-8b7da5f788df"
notion_url = "https://app.notion.com/p/macOS-PHP-OCI8-91891e7ea1be4f5aa5908b7da5f788df"
external_url = "https://bestofsky.com/185"
+++

## macOS(Intel, 구버전) PHP-OCI8 연동 트러블슈팅

**설치**

```bash
# instantclient-basic, instantclient-sdk 64비트용 다운로드 후 압축 해제
mv instantclient_64 /usr/local/oracle/instantclient_64
cd /usr/local/oracle/instantclient_64
ln -s libclntsh.dylib.10.1 libclntsh.dylib   # 심볼릭 링크 필요

pecl install oci8
# 프롬프트에 입력: instantclient,/usr/local/oracle/instantclient_64

# pecl 실패 시 수동 빌드
phpize
./configure --with-oci8=instantclient,/usr/local/oracle/instantclient_64
make && make install
```

```
; php.ini
extension=oci8.so
```

**⚠️ phpinfo()에 oci8 섹션이 안 나올 때**

```bash
mkdir -p /b/227/rdbms
ln -s /usr/local/oracle/instantclient_64 /b/227/rdbms/lib
```

**⚠️ ****`OCIEnvNlsCreate() failed`**** / DYLD\_LIBRARY\_PATH 에러**

- `.bash_profile`, `/etc/profile`, httpd.conf의 `SetEnv`, `putenv()` 모두 안 먹힐 수 있음
- 원인: macOS 기본 Apache는 `/System/Library/LaunchDaemons/org.apache.httpd.plist`에서 자체 환경변수를 관리 (셸 프로필과 별개)

```xml
<key>EnvironmentVariables</key>
<dict>
    <key>DYLD_LIBRARY_PATH</key>
    <string>/usr/local/oracle/instantclient_64</string>
</dict>
```

- 위 항목을 plist에 추가 후 아파치 재시작하면 해결

**⚠️ Navicat 접속 시 ****`ORA-12737: unsupported server character set KO16MSWIN949`**

- instantclient 32비트용을 추가로 설치하고 Navicat 접속 설정에서 해당 클라이언트 사용하도록 지정

원문: [https://bestofsky.com/185](https://bestofsky.com/185)
