+++
title = "RAID와 백업"
date = 2019-09-26T09:11:00Z
updated = 2026-07-21T06:47:00Z
categories = ["TECH"]
tags = ["TIP", "ETC"]
toc = true

[extra]
source = "notion"
notion_id = "55a821a1-0080-4d18-9f69-cc91bda0f12a"
notion_url = "https://app.notion.com/p/RAID-55a821a100804d189f69cc91bda0f12a"
+++

## 요지

- **RAID ≠ 백업**
- RAID: HDD 고장 시 시스템/데이터 보호·연속 운영
- 백업: 다른 저장소에 **독립 복사본** (원본 삭제·실수·사고에도 복구 가능)
- RAID1 미러링도 백업 아님 (한쪽에서 지우면 양쪽에서 사라짐)

## 한도

- RAID1: 1개 고장까지
- RAID5: 1개 / RAID6: 2개
- 한도 초과·레이드 붕괴 시 전체 유실 가능

## 실무

- NAS에서 원본 작업 시 → PC/외장/다른 NAS에 2차 백업
- 업무용: RAID1(또는 동급) + 백업
- 개인용: 용량 우선 시 RAID 없이 + 외장/PC 백업
