+++
title = "SSL 발급·갱신 acme.sh"
date = 2021-06-28T05:49:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["SYNOLOGY", "WEB"]
toc = true

[extra]
source = "notion"
notion_id = "227de564-cdb8-404a-a744-d79b1aae40b8"
notion_url = "https://app.notion.com/p/SSL-acme-sh-227de564cdb8404aa744d79b1aae40b8"
external_url = "https://app.notion.com/p/8dc3900ca6704fbdb260f5f62eb64260"
+++

> 해외 ACME 검증 중에는 방화벽 일시 해제 후 작업 종료 시 원복.

> 1차·2차·와일드카드(`*.example.com`) 발급 가능. 아래는 DNS 수동(TXT) 와일드카드 예.

# acme.sh 설치

```bash
curl https://get.acme.sh | sh
source ~/.bashrc
# root 사용 시
cd /root && chown root:root acme.sh && chmod +x acme.sh
```

# Synology

SSH(관리자) → `sudo su -` 후 동일 절차. DSM HTTPS는 별도 시놀로지 인증서 페이지 참고.

# DNS 수동 발급·갱신

```bash
cd /root
./acme.sh --issue --force -d '*.example.com' --dns \
  --yes-I-know-dns-manual-mode-enough-go-ahead-please
# 출력 TXT(_acme-challenge.example.com)를 네임서버에 등록
nslookup   # set type=txt → _acme-challenge.example.com

./acme.sh --renew --force -d '*.example.com' --dns \
  --yes-I-know-dns-manual-mode-enough-go-ahead-please
```

발급 파일 복사 예:

```bash
cp /root/.acme.sh/*.example.com/*.example.com.key /path/to/ssl/
cp /root/.acme.sh/*.example.com/*.example.com.cer /path/to/ssl/
cp /root/.acme.sh/*.example.com/ca.cer /path/to/ssl/
```

# 적용

### Apache (`ssl.conf` 등)

```javascript
SSLEngine on
SSLCertificateFile /etc/httpd/conf/ssl/example.com.cer
SSLCertificateKeyFile /etc/httpd/conf/ssl/example.com.key
SSLCertificateChainFile /etc/httpd/conf/ssl/ca.cer
```

### Synology DSM

제어판 → 보안 → 인증서 → 추가 → 기존 교체 → 개인키/인증서/중간(ca.cer) 가져오기 → 웹서버 재시작 → 방화벽 원복.
