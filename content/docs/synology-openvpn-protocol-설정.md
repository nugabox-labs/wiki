+++
title = "Synology OpenVPN Protocol 설정"
date = 2024-02-29T01:37:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["SYNOLOGY", "NETWORK"]
toc = true

[extra]
source = "notion"
notion_id = "473839a2-6e9a-44da-98e8-e6717dd4d315"
notion_url = "https://app.notion.com/p/Synology-OpenVPN-Protocol-473839a26e9a44da98e8e6717dd4d315"
external_url = "https://m.blog.naver.com/mythee1/221964242953"
+++

## Synology VPN Server (OpenVPN)

- OpenVPN 서버 활성화
- 프로토콜: UDP / 포트: `1194`
- 암호: `AES-256-CBC` + `SHA512` 권장
- 압축(comp-lzo): 비권장
- 적용 후 **내보내기 구성** → Zip 다운로드

## 방화벽 / 라우터

- DSM 방화벽: UDP `1194` 허용
- 공유기 포트포워딩: UDP `1194`

## 클라이언트 (`VPNConfig.ovpn`)

```
remote YOUR_DDNS_OR_IP 1194
redirect-gateway def1
dhcp-option DNS DNS_IP
auth-user-pass
auth-nocache
remote-cert-tls server
```

- `Comp-Lzo` 있으면 제거
- Config 경로(Windows): `C:\Program Files\OpenVPN\config`
- 클라이언트: [https://openvpn.net/community-downloads/](https://openvpn.net/community-downloads/)
