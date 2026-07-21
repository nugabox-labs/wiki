+++
title = "yum vault·lock·timeout"
date = "2021-02-19T06:11:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "09de93b2-1f57-459f-96f4-82e616eaa5bc"
notion_url = "https://app.notion.com/p/yum-vault-lock-timeout-09de93b21f57459f96f482e616eaa5bc"
+++

### RPM 저장소

↗︎ [https://vault.centos.org/](https://vault.centos.org/)

↗︎ [http://ftp.iij.ad.jp/pub/linux/centos-vault/](http://ftp.iij.ad.jp/pub/linux/centos-vault/)

↗︎ [https://www.rpmfind.net/linux/rpm2html/search.php](https://www.rpmfind.net/linux/rpm2html/search.php)

↗︎ [http://rpm.pbone.net/](http://rpm.pbone.net/)

↗︎ [https://www.rpmseek.com/](https://www.rpmseek.com/)

---

CentOS 현재 릴리스 버전 확인

```bash
cat /etc/redhat-release
```

### 패키지 다운로드

```bash
yum install 패키지명 --downloadonly --downloaddir=경로
```

### Trouble Shooting

- `Another app is currently holding the yum lock`
  ### 해결

  ```bash
rm -rf /var/run/yum.pid
  ```
- `YumRepo Error: All mirror URLs are not using ftp, http[s] or file.`
  ### 원인

  - CentOS의 해당 버전에 대한 공식 지원이 종료되면 Fastmirror Site에서 해당 버전의 패키지가 제거되어 발생하는 오류

  ### 해결

  - 기본 레포지토리 파일 확인
    ```bash
vim /etc/yum.repos.d/CentOS-Base.repo 
    ```
  - mirrorlist에 주석처리, **baseurl을 아래와 같이 수정**
    - `$releasever`이 정확하게 안 나오면 직접 입력 (예 : 6은 인식안됨 → 6.10으로 수정)

    ```bash
[base]
name=CentOS-$releasever – Base
#mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=os
baseurl=http://vault.centos.org/$releasever/os/$basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-5

#released updates
[updates]
name=CentOS-$releasever – Updates
#mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=updates
baseurl=http://vault.centos.org/$releasever/updates/$basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-5

#additional packages that may be useful
[extras]
name=CentOS-$releasever – Extras
#mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=extras
baseurl=http://vault.centos.org/$releasever/extras/$basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-5

#additional packages that extend functionality of existing packages
[centosplus]
name=CentOS-$releasever – Plus
#mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=centosplus
baseurl=http://vault.centos.org/$releasever/centosplus/$basearch/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-5

#contrib – packages by Centos Users
[contrib]
name=CentOS-$releasever – Contrib
#mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=contrib
baseurl=http://vault.centos.org/$releasever/contrib/$basearch/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-5
    ```
  - 레포지토리 클린 및 갱신
    ```bash
yum clean all
yum repolist
    ```

- `Timeout Error`
  ### 해결

  - `/etc/yum.conf` 파일에 timeout 설정을 추가 또는 수정

  ```bash
* 혹시 설치 과정에 timeout이 발생하면 yum의 timeout 설정을 수정해 보자.
  아래와 같이 /etc/yum.conf 파일에 timeout 설정을 추가 또는 수정 한다.
[main]
keepcache=0
debuglevel=2
timeout=60
  ```
