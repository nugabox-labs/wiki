+++
title = "Let's Encrypt Certbot SSL"
date = "2021-03-31T02:42:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["OS", "SERVER"]
tags = ["LINUX", "WEB"]
toc = true

[extra]
source = "notion"
notion_id = "3a60c944-3b99-440c-9b3b-c34c04d48ae2"
notion_url = "https://app.notion.com/p/Let-s-Encrypt-Certbot-SSL-3a60c9443b99440c9b3bc34c04d48ae2"
+++

## certbot-auto (webroot)

```bash
./certbot-auto certonly \
  --server https://acme-v01.api.letsencrypt.org/directory \
  --rsa-key-size 4096 --agree-tos \
  --email admin@example.com \
  --webroot -w /path/to/public_html \
  -d example.com
```

> ACME v01은 deprecated. 현재는 `certbot` + `https://acme-v02.api.letsencrypt.org/directory` 권장.

## 참고 (CentOS 6 / Python 2.7 환경)

- SCL: [https://sangchul.kr/478](https://sangchul.kr/478)
- Python 2.7: [https://chhanz.github.io/linux/2019/01/09/rhel6-python27/](https://chhanz.github.io/linux/2019/01/09/rhel6-python27/)
- Let's Encrypt on CentOS6: [https://dreamsea77.tistory.com/255](https://dreamsea77.tistory.com/255)
- 사용법 변경: [https://www.enteroa.com/2021/01/08/lets-encrypt-사용-방법-변경/](https://www.enteroa.com/2021/01/08/lets-encrypt-사용-방법-변경/)
- 인증서 생성: [http://blog.naver.com/PostView.nhn?blogId=hsunryou&logNo=221586856226](http://blog.naver.com/PostView.nhn?blogId=hsunryou&logNo=221586856226)
