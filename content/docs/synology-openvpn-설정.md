+++
title = "Synology OpenVPN 설정"
date = 2019-10-04T01:04:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["SYNOLOGY", "NETWORK"]
toc = true

[extra]
source = "notion"
notion_id = "916bb7b1-a311-4829-81c4-ce78842e66c8"
notion_url = "https://app.notion.com/p/Synology-OpenVPN-916bb7b1a311482981c4ce78842e66c8"
external_url = "http://blog.naver.com/PostView.nhn?blogId=djjproject&logNo=220894542425"
+++

## Synology OpenVPN

1. 패키지 센터 → **VPN Server** 설치
1. 권한: DSM 계정에 OpenVPN 허용
1. OpenVPN: 서버 활성화 + **클라이언트의 서버 LAN 액세스 허용** → 적용 → **내보내기 구성**
1. `openvpn.ovpn`: `YOUR_SERVER_IP` → 공인IP/도메인, 포트 확인
1. `redirect-gateway` 줄
   - 주석 유지: 인터넷은 로컬, NAS LAN만 VPN
   - 주석 해제: 전체 트래픽 VPN
1. 공유기: **UDP 1194** 포트포워딩
1. 클라이언트: [OpenVPN](https://openvpn.net/community-downloads/) + 내보낸 3파일을 config 폴더에 복사 → GUI 연결
