+++
title = "SVN 설치 (Linux)"
date = 2023-03-11T13:25:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "DEV-OPS"]
tags = ["GIT/SVN", "LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "cfd10bd1-d6dc-4933-8414-abfcb341aaa5"
notion_url = "https://app.notion.com/p/SVN-Linux-cfd10bd1d6dc49338414abfcb341aaa5"
external_url = "https://blog.naver.com/hi_mylover/221101276614"
+++

## 설치 (yum / rpm / tar.gz)

```bash
# yum
yum install apr apr-util sqlite zlib subversion

# rpm
rpm -Uvh 파일명.rpm

# tar.gz (apr → apr-util → sqlite → zlib → subversion)
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

## 인증 (conf/svnserve.conf)

```bash
cd /home/사용자명/svn/저장소명/conf
mv svnserve.conf svnserve.conf.old
vi svnserve.conf
```

```
[general]
anon-access = none
auth-access = write
password-db = passwd
authz-db = authz
```

## 계정 (conf/passwd)

```
[users]
사용자ID = 암호
```

## 권한 (conf/authz)

```
[groups]
usergroup = user1, user2

[/]
* = rw

[repository:/저장소명]
@usergroup = rw
user1 = rw
```

## 폴더 권한·서비스 (포트 3690)

```bash
chmod -R 760 /home/사용자명/svn/*   # 764면 타인 R 추가
svnserve -d -r /home/사용자명/svn

# CentOS 7
sudo firewall-cmd --permanent --zone=public --add-port=3690/tcp
sudo firewall-cmd --reload

# CentOS 6 (/etc/sysconfig/iptables)
-A INPUT -m state --state NEW -m tcp -p tcp --dport 3690 -j ACCEPT
service iptables restart

# 부팅 자동: /etc/rc.d/rc.local 에 svnserve -d -r 경로 추가
chkconfig svnserve on
chkconfig --list svnserve
```

## 체크아웃·시작

```bash
svn co svn://192.168.x.x/repository
service svnserve start
```

## 트러블슈팅

**서버소켓 바인드 실패**

```bash
killall svnserve
svnserve -d -r /svn
ps -aux | grep svnserve
netstat -ant | grep 3690
```

**Store password unencrypted 무한 질문** — `$HOME/.subversion/servers`에서 주석 해제:

```
store-passwords = yes
store-plaintext-passwords = yes
```

## 참조

- [http://lambert.egloos.com/2974388/](http://lambert.egloos.com/2974388/)
- [https://blog.naver.com/hi\_mylover/221101276614](https://blog.naver.com/hi_mylover/221101276614)
- [https://tavris.tistory.com/9](https://tavris.tistory.com/9)
- [http://lmc.cs.kookmin.ac.kr/readmore/linux-svn](http://lmc.cs.kookmin.ac.kr/readmore/linux-svn)

관련: SVN 설치 (Linux, RPM)
