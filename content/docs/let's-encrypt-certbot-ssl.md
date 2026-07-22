+++
title = "Let's Encrypt Certbot SSL"
date = 2021-03-31T02:42:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER"]
tags = ["LINUX", "WEB"]
toc = true

[extra]
source = "notion"
notion_id = "3a60c944-3b99-440c-9b3b-c34c04d48ae2"
notion_url = "https://app.notion.com/p/Let-s-Encrypt-Certbot-SSL-3a60c9443b99440c9b3bc34c04d48ae2"
+++

## certbot (webroot)

```bash
certbot certonly --webroot -w /path/to/public_html \
  --email admin@example.com --agree-tos --rsa-key-size 4096 \
  -d example.com
```

## certbot-auto (레거시 CentOS 6)

```bash
./certbot-auto certonly --webroot -w /path/to/public_html \
  --server https://acme-v02.api.letsencrypt.org/directory \
  --email admin@example.com --agree-tos -d example.com
```

> ACME v01 deprecated. v02 권장.
