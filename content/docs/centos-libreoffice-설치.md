+++
title = "CentOS LibreOffice 설치"
date = 2021-05-26T06:02:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "TECH"]
tags = ["LINUX", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "4ca8c1c3-4994-4dc9-87bb-5413ab388675"
notion_url = "https://app.notion.com/p/CentOS-LibreOffice-4ca8c1c349944dc987bb5413ab388675"
external_url = "http://hugrypiggykim.com/2016/09/05/centos-libreoffice-%EC%84%A4%EC%B9%98/"
+++

참조: [Tecmint](http://www.tecmint.com/install-libreoffice-on-rhel-centos-fedora-debian-ubuntu-linux-mint/)

```bash
# 1) 패키지 다운로드 (공식 tar.gz)
wget https://download.documentfoundation.org/libreoffice/stable/<ver>/rpm/x86_64/LibreOffice_<ver>_Linux_x86-64_rpm.tar.gz

# 2) 기존 버전 제거
sudo yum remove libreoffice*
# 또는: sudo dnf remove libreoffice*

# 3) 압축 해제·설치
tar -xvf LibreOffice_*_Linux_x86-64_rpm.tar.gz
cd LibreOffice_*/RPMS
sudo yum localinstall *.rpm
# 또는: sudo dnf install *.rpm

libreoffice --version
```
