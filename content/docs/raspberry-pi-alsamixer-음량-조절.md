+++
title = "Raspberry Pi alsamixer 음량 조절"
date = 2021-07-16T07:50:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "374e679b-965e-4e2a-8122-1de09d21c7ae"
notion_url = "https://app.notion.com/p/Raspberry-Pi-alsamixer-374e679b965e4e2a81221de09d21c7ae"
external_url = "https://overit.tistory.com/entry/RaspberryPi-%EC%9D%8C%EB%9F%89%EC%A1%B0%EC%A0%88"
+++

## alsamixer 음량

```bash
alsamixer
```

- 방향키로 볼륨 조절, `Esc` 종료

## 설정 저장 (재부팅 초기화 방지)

```bash
sudo alsactl store
```
