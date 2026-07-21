+++
title = "SVN 설치 (Linux)"
date = "2023-03-11T13:25:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["OS", "DEV-OPS"]
tags = ["GIT/SVN", "LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "cfd10bd1-d6dc-4933-8414-abfcb341aaa5"
notion_url = "https://app.notion.com/p/SVN-Linux-cfd10bd1d6dc49338414abfcb341aaa5"
external_url = "https://blog.naver.com/hi_mylover/221101276614"
+++

## SVN 설치 (Linux, 3가지 방식)

```bash
# yum 방식
yum install apr apr-util sqlite zlib subversion

# rpm 방식
rpm -Uvh 파일명.rpm

# tar.gz 방식 (apr → apr-util → sqlite → zlib → subversion 순으로)
mkdir /usr/local/svn && cd /usr/local/svn
tar -zxvf 파일명.tar.gz
cd apr-1.5.2 && ./configure && make && make install
cd ../apr-util-1.5.4 && ./configure --with-apr=/usr/local/apr && make && make install
cd ../sqlite-autoconf-3081101 && ./configure && make && make install
cd ../zlib-1.2.8 && ./configure && make && make install
cd ../subversion-1.9.4 && ./configure --with-apr=/usr/local/apr --with-apr-util=/usr/local/apr && make && make install
```

## 저장소 생성

```bash
mkdir /home/사용자명/svn && cd /home/사용자명/svn
svnadmin create --fs-type fsfs 프로젝트폴더명
```

## 인증 설정 (conf/svnserve.conf)

```bash
cd /home/사용자명/svn/저장소명/conf
mv svnserve.conf svnserve.conf.old
vi svnserve.conf
```

```javascript
[general]
anon-access = none
auth-access = write
password-db = passwd
authz-db = authz
```

## 계정 추가 (conf/passwd)

```javascript
[users]
사용자ID = 암호
```

## 권한 설정 (conf/authz)

```javascript
[groups]
usergroup = user1, user2

[/]
* = rw

[repository:/저장소명]
@usergroup = rw
user1 = rw
```

## 폴더 권한

```bash
chmod -R 760 /home/사용자명/svn/*   # 소유자 RWE, 그룹 RW
# 764면 타인 R까지 추가
```

## 서비스 구동 (기본 포트 3690)

```bash
svnserve -d -r /home/사용자명/svn

# CentOS 7 방화벽
sudo firewall-cmd --permanent --zone=public --add-port=3690/tcp
sudo firewall-cmd --reload

# CentOS 6 방화벽 (/etc/sysconfig/iptables에 추가)
-A INPUT -m state --state NEW -m tcp -p tcp --dport 3690 -j ACCEPT
service iptables restart

# 부팅 시 자동실행: /etc/rc.d/rc.local 에 svnserve -d -r 경로 추가
chkconfig svnserve on
chkconfig --list svnserve
```

## 체크아웃 / 서비스 시작

```bash
svn co svn://192.168.x.x/repository
service svnserve start
```

## 트러블슈팅

**"서버소켓을 바인드할 수 없습니다" 에러**

```bash
killall svnserve
svnserve -d -r /svn
ps -aux | grep svnserve
netstat -ant | grep 3690
```

**"Store password unencrypted" 무한 질문**

`$HOME/.subversion/servers` 파일에서 아래 두 줄 주석 해제 후 yes로 변경

```javascript
store-passwords = yes
store-plaintext-passwords = yes
```

## 참조

- SVN 용어설명: [http://lambert.egloos.com/2974388/](http://lambert.egloos.com/2974388/)
- [https://blog.naver.com/hi\_mylover/221101276614](https://blog.naver.com/hi_mylover/221101276614)
- [https://tavris.tistory.com/9](https://tavris.tistory.com/9)
- [http://lmc.cs.kookmin.ac.kr/readmore/linux-svn](http://lmc.cs.kookmin.ac.kr/readmore/linux-svn)

관련: [SVN-리눅스 rpm 설치](https://app.notion.com/p/32e75bc2787648adaa9ba612bdef97bb) (RPM 방식만 간단히)
