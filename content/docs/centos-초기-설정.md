+++
title = "CentOS 초기 설정"
date = 2020-10-23T05:29:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "d69770b8-d16d-4bb7-ab31-d560da6eb8ee"
notion_url = "https://app.notion.com/p/CentOS-d69770b8d16d4bb7ab31d560da6eb8ee"
external_url = "https://wiki.centos.org/kr/Download"
+++

> 체크리스트: CentOS 초기 설정 체크리스트 · 명령어: CentOS 명령어 모음

## 필수 패키지

```bash
yum -y install net-tools bind-utils wget elinks nmap psmisc telnet
yum -y install vim yum-utils sysstat pstree gcc gcc-c++
yum -y install man man-pages epel-release
```

## 타임존·시간 동기화

```bash
ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime
# 또는
timedatectl set-timezone Asia/Seoul

# CentOS 6: ntpd / CentOS 7+: timedatectl set-ntp y
# CentOS 8+: chrony (`/etc/chrony.conf` → time.bora.net 등)
hwclock -w
```

## Profile (히스토리 시각)

```bash
sed -i "/HISTSIZE=1000/a\HISTTIMEFORMAT='%F %T ---'" /etc/profile
```

## 네트워크 (`ifcfg-eth0`)

```bash
vim /etc/sysconfig/network-scripts/ifcfg-eth0
# ONBOOT=yes / IPADDR / PREFIX / GATEWAY / DNS1·DNS2
# CentOS 6: service network restart
# CentOS 7: systemctl restart network
```

## ulimit (`/etc/security/limits.conf`)

```
* soft nofile 65535
* hard nofile 65535
```

재부팅 후 `ulimit -a` / `ulimit -aH` 확인. → 리눅스 ulimit 확인·설정

## Hostname

```bash
# CentOS 6: /etc/sysconfig/network → HOSTNAME=…
hostnamectl set-hostname 호스트명 --static   # CentOS 7+
```

## SELinux

```bash
setenforce 0                    # 임시
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
reboot                          # 영구
```

## 계정

```bash
groupadd 그룹명
useradd -g 그룹명 사용자명
passwd 사용자명
userdel lp; userdel uucp; userdel nuucp   # 불필요 계정 예
```

## 보안·SSH·방화벽

- 방화벽: Firewalld / iptables 개별 글 참고
- SSH 포트: SSH 포트 변경

```bash
vim /etc/ssh/sshd_config   # Port …
systemctl restart sshd
```

## virbr0 제거

```bash
systemctl stop libvirtd && systemctl disable libvirtd
ip link set virbr0 down
ip link delete virbr0
```

## crontab

```bash
crontab -e
# 0 2 * * * /Backup/bin/daily.sh >/dev/null 2>&1
```

→ crontab 예제·로깅

## xrdp (선택)

```bash
yum install epel-release xrdp tigervnc-server
systemctl enable --now xrdp
firewall-cmd --permanent --add-port=3389/tcp && firewall-cmd --reload
```
