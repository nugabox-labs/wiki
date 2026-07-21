+++
title = "IPTIME 공유기 허브모드로 변경하기"
date = "2019-09-26T18:08:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["SERVER"]
tags = ["NETWORK"]
toc = true

[extra]
source = "notion"
notion_id = "eaafdb48-79b1-4502-af3c-8adc9759b3b7"
notion_url = "https://app.notion.com/p/IPTIME-eaafdb4879b14502af3c8adc9759b3b7"
external_url = "https://m.blog.naver.com/PostView.nhn?blogId=michaelrodri&logNo=120184371244"
+++

## IPTIME 공유기 허브모드 전환 (다중 네트워크 환경에서 IP 충돌 방지용)

**사전 준비**: 허브모드 전환 전 펌웨어 업그레이드 및 공유기 초기화 권장 (내부 로그로 인한 IP 충돌 메시지 방지)

**개념**: 공유기 = 허브 + DHCP서버. 허브모드 전환 = DHCP서버만 중지 → 단순 허브로 동작. WAN 포트는 사용 불가(모델에 따라 LAN 전환 지원하는 경우도 있음, 예: Q304/Q504)

**절차**

1. 공유기 관리 페이지 접속 → 원클릭 허브모드 메뉴가 있으면 바로 전환 (없으면 내부 네트워크 설정 > DHCP 서버 중지)
1. WAN 포트에 꽂혀있던 상위 공유기 연결선을 LAN 1~4 포트 중 하나로 이동
1. PC에서 IP 갱신

```shell
ipconfig /release
ipconfig /renew
```

1. 관리 페이지 재접속 시 기본 IP(예: 192.168.0.1)로 안 들어가지면, PC의 IPv4 설정을 공유기 DHCP 범위 내 임의 IP로 수동 설정 후 접속 → 설정 확인 후 다시 자동(DHCP)으로 되돌림
1. **매번 수동 설정하는 게 번거로우면**: 허브모드 공유기의 내부 IP 대역을 상위 공유기 대역에 맞게 변경 (예: 192.168.0.1 → 192.168.194.200) → 이후 상위 공유기 DHCP로 자동 할당된 IP에서도 바로 접속 가능
1. IP 변경 시에는 하위 공유기의 WAN선을 빼고 초기화(리셋 버튼 10초) 후 설정하는 것이 깔끔함(연결된 채로 하면 IP 충돌 메시지가 뜰 수 있음). 설정 완료 후 랜선 재연결

**여러 대 연결 시**: 최상위 공유기를 제외한 나머지는 모두 허브모드로 전환하고 끝자리 IP만 다르게 설정. 상위 공유기 설정을 못 만질 경우 DHCP 범위 내 101~240 사이 주소 사용 권장(양 끝 번호는 대개 이미 사용 중)

원문: [https://m.blog.naver.com/PostView.nhn?blogId=michaelrodri&logNo=120184371244](https://m.blog.naver.com/PostView.nhn?blogId=michaelrodri&logNo=120184371244)
