+++
title = "Win10 + Linux Mint 듀얼부팅"
date = 2020-03-09T18:02:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX", "WINDOWS"]
toc = true

[extra]
source = "notion"
notion_id = "b6753d06-9af2-4881-84d7-2b40895363e3"
notion_url = "https://app.notion.com/p/Win10-Linux-Mint-b6753d069af2488184d72b40895363e3"
external_url = "https://deneb21.tistory.com/349"
+++

## 준비

1. Linux Mint ISO (Cinnamon/MATE/Xfce) + Rufus로 부팅 USB
1. Windows: 디스크 관리 → C: 볼륨 축소 → 미할당 공간 확보

## Mint 설치

1. USB 부팅 → Install → 한국어
1. 파티션: **기타** → 미할당에 `/` (ext4). 필요 시 swap(논리)
1. 부트로더: 기본 디스크에 GRUB 설치
1. 재부팅 → GRUB에서 Mint / Windows 선택

## (선택) EasyBCD로 Windows 부트매니저 우선

1. Windows 부팅 → [EasyBCD](https://neosmart.net/EasyBCD/) 설치
1. 새 부팅 추가: Type=Linux/BSD, Drive=Mint 파티션
1. 부트 메뉴 수정 → Default·타임아웃 저장
1. BCD 백업/수리 → 부트 파일 재생산

## GRUB 타임아웃 줄이기 (Mint에서)

```bash
sudo nano /etc/default/grub
# GRUB_TIMEOUT=0
sudo update-grub
# 구버전: /boot/grub/grub.cfg 의 set timeout=0 (재생성 시 덮어씀)
```
