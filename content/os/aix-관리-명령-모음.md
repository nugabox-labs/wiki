+++
title = "AIX 관리 명령 모음"
date = 2020-10-30T10:21:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "29d29a34-bece-4697-b5c8-b3e4a8d9e6e9"
notion_url = "https://app.notion.com/p/AIX-29d29a34bece4697b5c8b3e4a8d9e6e9"
external_url = "https://oracle.tistory.com/108"
+++

## 자주 쓰는 원라이너

```bash
# ESTABLISHED IP 집계
netstat -an | grep ESTABLISHED | awk '{print $2}' | cut -f1-4 -d. | sort | uniq -c

du -sk *          # 현재 dir
du -x             # 같은 FS만
df -m | awk '{print $1,$7}'

# FS 사용률 90%+
df -Pk | awk 'int($2)!=0' | grep -v Mounted | awk 'int($3*100/$2)>89 {print $5,$6}'

# 메모리(AIX vmstat 근사)
vmstat 1 3 | tail -1 | awk '{u=$3*4096/1024/1024; f=$4*4096/1024/1024} END{printf "used %.0f MB free %.0f MB\n",u,f}'

# CPU
sar 1 2 | tail -1 | awk '{printf "%.0f\n", int($2+$3)}'
```

## AIX 점검 요약

```bash
oslevel -r; bootinfo -K; lsdev -Cc processor; lsps -a
df -Pk; lsvg; lspv; ifconfig -a; netstat -rn; errpt; lslpp -l
```

## tar/compress

```bash
tar -cvf archive.tar *
compress archive.tar      # → .Z
gzip archive.tar          # → .gz
```
