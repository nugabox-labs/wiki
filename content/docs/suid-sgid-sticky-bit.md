+++
title = "SUID SGID Sticky bit"
date = 2022-09-02T14:47:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "DEV-OPS", "TECH"]
tags = ["LINUX", "BASH", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "ffa732cf-668e-4ccc-91c6-f48b97f048b1"
notion_url = "https://app.notion.com/p/SUID-SGID-Sticky-bit-ffa732cf668e4ccc91c6f48b97f048b1"
external_url = "https://blackmouse.tistory.com/31"
+++

## SUID / SGID / Sticky bit

| 비트 | 8진수 | ls 표시 |
| --- | --- | --- |
| SUID | 4 | `s`/`S` (소유자 x) |
| SGID | 2 | `s`/`S` (그룹 x) |
| Sticky | 1 | `t`/`T` (other x) |

소문자 = 실행권한 있음, 대문자 = 실행권한 없음(비트만 설정).

```bash
# 설정
chmod u+s file          # SUID
chmod g+s file          # SGID
chmod o+t dir           # Sticky
chmod 4755 file         # SUID+755
chmod 2755 file         # SGID+755
chmod 1777 dir          # Sticky+777 (/tmp 등)

# 제거: + 대신 -
chmod u-s file

# 점검
find / -perm -4000 -o -perm -2000 -print 2>/dev/null   # SUID/SGID
find / -perm -2 -print                                  # world-writable
find / -nouser -o -nogroup -print
find /home -name .rhosts -print
```

예: `/usr/bin/passwd`는 root SUID → 일반 유저가 `/etc/passwd` 수정 가능. `/tmp`는 sticky(`drwxrwxrwt`)로 소유자만 삭제 가능.
