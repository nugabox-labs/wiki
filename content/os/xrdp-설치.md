+++
title = "xrdp 설치"
date = 2020-10-27T13:44:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "e73b4756-8cd3-4458-aaf3-1d72090d68ac"
notion_url = "https://app.notion.com/p/xrdp-e73b47568cd34458aaf31d72090d68ac"
external_url = "https://m.blog.naver.com/PostView.nhn?blogId=jkssleeky&logNo=220813507540"
+++

## CentOS xrdp (RDP)

```bash
yum install epel-release
yum -y install xrdp tigervnc-server
systemctl enable --now xrdp
firewall-cmd --permanent --add-port=3389/tcp && firewall-cmd --reload
# SELinux EXEC 실패 시
chcon -t bin_t /usr/sbin/xrdp /usr/sbin/xrdp-sesman
systemctl restart xrdp
vncpasswd   # VNC 세션 암호(필요 시)
```
