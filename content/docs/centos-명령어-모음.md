+++
title = "CentOS 명령어 모음"
date = 2021-03-03T05:05:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "DEV-OPS"]
tags = ["LINUX", "BASH"]
toc = true

[extra]
source = "notion"
notion_id = "4ecdbaea-c3c5-4510-8913-0c15a677fcf2"
notion_url = "https://app.notion.com/p/CentOS-4ecdbaeac3c5451089130c15a677fcf2"
+++

# 시스템 정보

```bash
whoami
uname -a
cat /etc/redhat-release
getconf LONG_BIT
uname -m
```

## CPU

```bash
cat /proc/cpuinfo
cat /proc/cpuinfo | grep "model name" | head -1
cat /proc/cpuinfo | grep "physical id"
```

## 메모리

```bash
free -m
cat /proc/meminfo
dmidecode -t 17
```

## 디스크

```bash
fdisk -l
df -h
du -sh *
smartctl -a /dev/sd*
smartctl -i /dev/sd*
cat /proc/mdstat
```

## PCI / 기타

```bash
lspci
lspci | grep -E 'RAID|Ethernet|VGA'
dmidecode -t TYPE   # bios,system,baseboard,processor,memory…
mount
lsusb
lsscsi
```

# 사용자·그룹

```bash
cat /etc/passwd
cat /etc/group
grep 계정명 /etc/passwd
groupadd 그룹명
useradd -g 그룹명 사용자명
useradd -m -d /path 사용자명
usermod -d /path 사용자명
passwd 사용자명
userdel 사용자명
```

# 검색

```bash
find [경로] -name [파일명]
grep -r '찾을문자' [경로] [--include '*.확장자']
find [경로] -name '*.확장자' | xargs grep -rn --color=auto 2>/dev/null '찾을문자'
```

# wget 자주 쓰는 옵션

```bash
wget -b URL                    # 백그라운드
wget -c URL                    # 이어받기
wget -O file URL               # 저장 파일명
wget -P /path URL              # 저장 디렉터리
wget --limit-rate=1m URL
wget -r -l 5 -k -p URL         # 재귀+링크변환+페이지 리소스
wget --spider -F -i bookmarks.html
```
