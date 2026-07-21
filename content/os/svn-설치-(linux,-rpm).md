+++
title = "SVN 설치 (Linux, RPM)"
date = 2023-03-11T13:17:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS", "DEV-OPS"]
tags = ["GIT/SVN", "LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "32e75bc2-7876-48ad-aa9b-a612bdef97bb"
notion_url = "https://app.notion.com/p/SVN-Linux-RPM-32e75bc2787648adaa9ba612bdef97bb"
+++

## SVN 설치 (RPM, CentOS 6.5, Subversion 1.7.22)

```bash
# RPM 3개 다운로드 후 설치 (subversion, subversion-tools, mod_dav_svn)
# http://opensource.wandisco.com/centos/6/svn-1.7/RPMS/x86_64/
rpm -ivh subversion-1.7.22-1.x86_64.rpm
rpm -ivh subversion-tools-1.7.22-1.x86_64.rpm
rpm -ivh mod_dav_svn-1.7.22-1.x86_64.rpm
svn --help   # 설치/버전 확인
```

## 저장소 생성

```bash
mkdir /home/svn/repos && cd /home/svn/repos
svnadmin create project1
chown -R user.usergroup project1   # 필요시
chcon -R t httpd_sys_content_t project1
```

## svnserve.conf 설정

```bash
cd /home/svn/repos/project1
mv svnserve.conf svnserve.conf_org
vi svnserve.conf
```

```javascript
[general]
anon-access = none
auth-access = write
password-db = passwd
authz-db = authz
```

## 계정 설정 (conf/passwd)

```bash
cd /home/svn/repos/project1/conf
mv passwd passwd_org
vi passwd
```

```javascript
[users]
testuser = testpassword
```

## 권한 설정 (conf/authz)

```javascript
[/]
testuser = rw
```

## 서비스 등록/기동

```bash
echo 'OPTIONS=" --threads --root /home/svn "' > /etc/sysconfig/svnserve
# 포트 변경 시: --listen-port 9999 (기본 3690)

service svnserve start        # 또는 stop
svnserve -d -r 폴더경로        # 서비스 등록 없이 바로 실행

ps -ef | grep svnserve
netstat -na | grep svnserve

chkconfig svnserve on         # 부팅 시 자동시작
chkconfig --list svnserve
```

## 저장소 삭제

```bash
service svnserve stop
rm -rf /home/svn/repos/project1
```

관련: [SVN-리눅스 설치](https://app.notion.com/p/cfd10bd1d6dc49338414abfcb341aaa5) (yum/tar.gz 방식, 방화벽, 트러블슈팅)
