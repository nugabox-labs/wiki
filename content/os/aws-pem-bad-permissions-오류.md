+++
title = "AWS pem bad permissions 오류"
date = 2021-11-15T08:41:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "DEV-OPS", "TECH"]
tags = ["LINUX", "BASH", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "c9f2ba48-6c21-4757-bc34-8fd466cb8939"
notion_url = "https://app.notion.com/p/AWS-pem-bad-permissions-c9f2ba486c214757bc348fd466cb8939"
external_url = "https://blog.gilbok.com/aws-when-bad-permissions-error-occurs-about-pem-file/"
+++

## 증상

`.pem` 권한이 너무 열려 `bad permissions` / `are too open`

```bash
ssh -v -i <your>.pem ec2-user@<your-instance-public-dns>
chmod 400 <your>.pem
```
