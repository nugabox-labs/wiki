+++
title = "SVN 설치 (Linux, RPM)"
date = 2023-03-11T13:17:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "DEV-OPS"]
tags = ["GIT/SVN", "LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "32e75bc2-7876-48ad-aa9b-a612bdef97bb"
notion_url = "https://app.notion.com/p/SVN-Linux-RPM-32e75bc2787648adaa9ba612bdef97bb"
+++

> CentOS 6.5 / Subversion 1.7.22 RPM 기준. yum·tar.gz·방화벽은 SVN 설치 (Linux)

## RPM 설치

```bash
# http://opensource.wandisco.com/centos/6/svn-1.7/RPMS/x86_64/
rpm -ivh subversion-1.7.22-1.x86_64.rpm
rpm -ivh subversion-tools-1.7.22-1.x86_64.rpm
rpm -ivh mod_dav_svn-1.7.22-1.x86_64.rpm
svn --help
```

## 저장소

```bash
mkdir /home/svn/repos && cd /home/svn/repos
svnadmin create project1
chown -R user.usergroup project1   # 필요시
chcon -R -t httpd_sys_content_t project1
```

## svnserve.conf

```bash
cd /home/svn/repos/project1
mv svnserve.conf svnserve.conf_org
vi svnserve.conf
```

```
[general]
anon-access = none
auth-access = write
password-db = passwd
authz-db = authz
```

## passwd / authz (데모)

```
[users]
testuser = testpassword
```

```
[/]
testuser = rw
```

## 서비스

```bash
echo 'OPTIONS=" --threads --root /home/svn "' > /etc/sysconfig/svnserve
# 포트 변경: --listen-port 9999 (기본 3690)

service svnserve start
# 또는: svnserve -d -r 폴더경로
ps -ef | grep svnserve
netstat -na | grep svnserve
chkconfig svnserve on
chkconfig --list svnserve
```

## 삭제

```bash
service svnserve stop
rm -rf /home/svn/repos/project1
```
