+++
title = "OpenSSL 업데이트 및 Apache 적용"
date = 2020-12-22T00:16:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS", "SERVER"]
tags = ["WEB", "NETWORK", "LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "49752389-4732-43dd-9da4-3aa704f27649"
notion_url = "https://app.notion.com/p/OpenSSL-Apache-49752389473243dd9da43aa704f27649"
+++

- 2020년부터 크롬 등 주요 브라우저에서 보안이 취약한 TLS v1.0 및 v1.1의 경우 홈페이지 접속 시 경고 및 접속을 제한함
- TLS v1.2는 OpenSSL 1.0.1 이상부터 적용
- OpenSSL 또는 mod\_ssl 버전이 낮은 경우 Apache 구동 시 아래와 같은 오류메시지 발생
  `SSLProtocol: Illegal protocol 'TLSv1.2'`
- 패키지 설치가 되어 있는 경우 OpenSSL 업데이트 후 Apache 재시동 시 적용됨
- 컴파일 설치인 경우 Apache를 재컴파일 후 기동 시 Openssl 적용됨
- 2021. 8. OpenSSL에서 정보노출 및 서비스거부 취약점(CVE-2021-3712) 발견
  → OpenSSL 1.0.2 또는 1.1.1i 이상으로 업데이트 권고

  - Apache 2.2.x는 OpenSSL 1.0.2까지만 호환 (1.1.1은 호환X)
- 참고 사이트
  ↗︎ [http://egloos.zum.com/js7309/v/11081643](http://egloos.zum.com/js7309/v/11081643)

# 1. 패키지 설치인 경우

```bash
# 패키지 업데이트
yum install openssl-devel
yum update openssl
yum update mod_ssl

# Apache 재기동
apachectl stop
apachectl start
ps -ef | grep httpd
```

# 2. 컴파일 설치인 경우

## 1) 기존 환경 확인

### Apache

- 버전 확인 : `[기존아파치경로]/bin/httpd -v`
- 컴파일 환경변수 확인 : `cat [기존아파치경로]/build/config.nice`

### OpenSSL

- 위에서 확인한 기존 아파치 컴파일 환경 변수에서 with-ssl 옵션이 있는 경우 해당 경로의 OpenSSL 버전 확인, 없으면 시스템에 등록된 `/usr/bin/openssl` 을 읽음
- 버전 확인 : `[아파치 옵션의 with-ssl 경로]/bin/openssl version` 또는 `openssl version`

## 2) OpenSSL 업데이트

### 필요한 패키지 설치

`yum install gcc pcre`

### 설치 파일 다운로드

- 최신 버전 : [https://www.openssl.org/source/](https://www.openssl.org/source/)
- 이전 버전 : [https://www.openssl.org/source/old/](https://www.openssl.org/source/old/)

### 설치

```bash
# openssl 다운로드
wget -c https://www.openssl.org/source/openssl-1.1.1b.tar.gz

# gcc 설치
yum install gcc pcre

# openssl 설치
tar zxvf openssl-1.1.1b.tar.gz
cd openssl-1.1.1b
./config --prefix=/usr/local/openssl --openssldir=/usr/local/openssl shared -fPIC
make
make install
```

### 라이브러리 설정

```bash
# 라이브러리 로딩
vim /etc/ld.so.conf.d/openssl-1.1.1b(버전).conf
	/usr/local/openssl/lib
ldconfig -v

# 심볼릭 링크 연결 (선택)
ln -s /usr/local/openssl/lib/libssl.so.1.1 /usr/lib64/libssl.so.1.1
ln -s /usr/local/openssl/lib/libcrypto.so.1.1 /usr/lib64/libcrypto.so.1.1

# openssl 적용안될때 확인할 라이브러리 경로 : /lib, /usr/lib, /usr/lib64
ll /usr/lib64 | grep libssl
ll /usr/lib64 | grep libcrypto
```

### OpenSSL 갱신 및 확인

```bash
# openssl 갱신
mv /usr/bin/openssl /usr/bin/openssl1.0.1 ## 기존버전 백업
ln -s /usr/local/openssl/bin/openssl /usr/bin/openssl

# openssl 확인
openssl version
```

## 3) Apache 재컴파일

> [!NOTE]
> **사이트가 운영 중인 실서버인 경우**

일단, httpd -l 명령에 mod\_ssl이 포함이 되어 있다면 정적으로 compile이 되어진 것이기 때문에 apache도 다시 빌드해 주어야 합니다.만약 mod\_ssl이 동적으로 호출이 되고 있다면

ldd mod\_ssl.so

명령으로 openssl이 정적으로 링크하고 있는지 동적으로 링크하고 있는지를 확인해 보셔야 합니다. 동적으로 링크하고 있다면 openssl만 업데이트 해 주시면 됩니다만, 이 라이브러리 링크가 안깨지도록 잘 업데이트 해 주셔야 합니다. :-)

### 기존 아파치 환경 확인

- 기존 아파치 빌드 내용 확인 : `cat [기존아파치경로]/build/config.nice`

### 설치 파일 다운로드

- Apache : [http://archive.apache.org/dist/httpd/](http://archive.apache.org/dist/httpd/)
- apr, apr-util : [http://apache.mirror.cdnetworks.com/apr/](http://apache.mirror.cdnetworks.com/apr/)

```bash
# apache 다운로드
wget -c http://archive.apache.org/dist/httpd/httpd-2.4.6.tar.gz

# apr, apr-util 다운로드
wget -c http://apache.mirror.cdnetworks.com/apr/apr-1.7.0.tar.gz
wget -c http://apache.mirror.cdnetworks.com/apr/apr-util-1.6.1.tar.gz

# 설치파일 세팅
tar zxvf httpd-2.4.6.tar.gz
tar zxvf apr-1.7.0.tar.gz
tar zxvf apr-util-1.6.1.tar.gz
mv apr-1.7.0 httpd-2.4.6/srclib/apr
mv apr-util-1.6.1 httpd-2.4.6/srclib/apr-util
```

### 환경 변수 적용

```bash
# 환경 변수 적용
## prefix : Apache를 설치할 경로 (기존 경로 동일하게)
./configure --prefix=/usr/local/apache \
--with-included-apr \ 
--with-included-apr-util \
--with-mpm=worker \
--enable-so \
--enable-rewrite \
--enable-ssl \
--enable-mods-shared=all
--with-ssl=/usr/local/openssl
## 1. 업그레이드한 OpenSSL 경로를 with-ssl에 정확히 넣을 것
## 2. with-included-apr, apr-util 옵션 넣을 시 srclib 폴더에 있어야 함
##    옵션 없을 시 시스템에 설치된 apr, apr-util 사용함
```

### 설치

```bash
make
make install
```

- Trouble Shooting

```bash
# make 오류 발생 시
make clean

# 에러 error: Bundled APR requested but not found at ./srclib/.
#     ㄴ apr, apr-util을 srclib에 제대로 넣었는지 또는 with-included-apr 넣었는지 확인
# 에러 fatal error: expat.h: 그런 파일이나 디렉터리가 없습니다 
#     ㄴ yum install expat-devel
# 에러 ab.c:2265: warning: implicit declaration of function ‘SSLv2_client_method’
#     ㄴ configure with-ssl 옵션에서 경로에 'bin' 추가/제거하여 비교진행
```

### 설정 및 기동

```bash
# 기존 환경설정 세팅
cp -Rp [기존아파치경로]/conf/* [새아파치경로]/conf/
cp -Rp [기존아파치경로]/modules/* [새아파치경로]/modules/
cp -Rp [기존아파치경로]/logs/* [새아파치경로]/logs/
## 복사-덮어쓰기 한꺼번에
yes | cp -arpf [기존아파치경로]/modules/* [새아파치경로]/modules/

# 문법검사 및 기동, 확인
apachectl configtest
	Syntax OK
apachectl start
ps -ef | grep httpd

# httpd-ssl.conf에 TLSv1.2 적용
vim conf.d/httpd-ssl.conf (또는 conf/extra/httpd-ssl.conf)
	SSLEngine on
  ## SSL 프로토콜 설정 (TLS 1.2)
  SSLProtocol -all +TLSv1.2
  SSLCipherSuite EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:ECDHE-RSA-AES128-SHA:DHE-RSA-AES128-GCM-SHA256:AES256+EDH:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GC$
  SSLHonorCipherOrder on

# 문법검사 및 재기동
apachectl configtest
	Syntax OK
apachectl stop
apachectl start
```

## 4) 확인

- curl (Apache 환경설정에서 `ServerTokens Full` 적용해야 함)
  ```bash
curl -I http://www.xxx.com
	HTTP/1.1 302 Found
	Date: Fri, 05 Mar 2021 02:21:54 GMT
	Server: Apache/2.4.x (CentOS) OpenSSL/1.1.x PHP/7.2.x
  ```

- SSL 테스트 사이트 (결과 및 점수 확인)
  [https://www.ssllabs.com/ssltest/](https://www.ssllabs.com/ssltest/)

- 크롬 개발자 도구 - Security 탭에서 확인
  ![image](/notion-assets/49752389-4732-43dd-9da4-3aa704f27649/12.png)

[https://blanche-star.tistory.com/entry/APM-%EC%84%A4%EC%B9%98-openssl-%EC%B5%9C%EC%8B%A0%EB%B2%84%EC%A0%84%EC%84%A4%EC%B9%98%EC%86%8C%EC%8A%A4%EC%84%A4%EC%B9%98-shared%EC%84%A4%EC%B9%98](https://blanche-star.tistory.com/entry/APM-%EC%84%A4%EC%B9%98-openssl-%EC%B5%9C%EC%8B%A0%EB%B2%84%EC%A0%84%EC%84%A4%EC%B9%98%EC%86%8C%EC%8A%A4%EC%84%A4%EC%B9%98-shared%EC%84%A4%EC%B9%98)
