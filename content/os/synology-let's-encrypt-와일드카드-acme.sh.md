+++
title = "Synology Let's Encrypt 와일드카드 acme.sh"
date = 2020-05-26T06:26:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["SYNOLOGY"]
toc = true

[extra]
source = "notion"
notion_id = "8531888f-42f9-4650-b04b-085d9967e9dd"
notion_url = "https://app.notion.com/p/Synology-Let-s-Encrypt-acme-sh-8531888f42f94650b04b085d9967e9dd"
external_url = "https://app.notion.com/p/7bef2282c6734aa1854e233b492b8067"
+++

> DSM UI Let's Encrypt는 [Synology Let's Encrypt SSL](https://app.notion.com/p/7bef2282c6734aa1854e233b492b8067)

## 사전 조건

- 공유기에서 80·443 → NAS 포워딩
- SAN(주제 대체 이름) 주소가 실제 접속 가능해야 함(와일드카드는 예외)
- 발급 중 방화벽을 default로 (해외 검증 봇)
- 발급 후 포트·방화벽 원복

## 와일드카드 — [acme.sh](https://github.com/acmesh-official/acme.sh) (DNS manual)

```bash
wget https://raw.githubusercontent.com/acmesh-official/acme.sh/master/acme.sh
chmod a+x acme.sh

./acme.sh --issue --dns --force -d '*.example.com' \
  --yes-I-know-dns-manual-mode-enough-go-ahead-please
# 출력 TXT를 DNS에 등록: _acme-challenge.example.com

nslookup
> set type=txt
> _acme-challenge.example.com

./acme.sh --renew --dns --force -d '*.example.com' \
  --yes-I-know-dns-manual-mode-enough-go-ahead-please
```

## 인증서 복사·DSM 등록

```bash
cp /root/.acme.sh/'*.example.com'/* /volume1/ssl_backup/
```

DSM → 제어판 → 보안 → 인증서 → 가져오기

- 개인키: `domain.key`
- 인증서: `domain.cer`
- 중간: `ca.cer`

## porkbun 등 레지스트라 SSL

Domain Management → SSL → Edit → (필요 시 revoke) → 재발급 → Download SSL Bundle

## 기존 파일로 가져오기

- private.key / domain.cert / intermediate.cert
