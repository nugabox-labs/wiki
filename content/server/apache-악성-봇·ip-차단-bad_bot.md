+++
title = "Apache 악성 봇·IP 차단 bad_bot"
date = 2021-03-13T05:46:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["WEB"]
toc = true

[extra]
source = "notion"
notion_id = "40d25dff-8c6f-4595-ad06-b4f16ca10e90"
notion_url = "https://app.notion.com/p/Apache-IP-bad_bot-40d25dff8c6f4595ad06b4f16ca10e90"
external_url = "https://app.notion.com/p/7e457c3fd23943d8892e485bbd019a6f"
+++

## 개요

다수 VirtualHost에 공통 적용할 악성 봇(UA)·IP 차단을 별도 conf로 분리.

리스트: [bad-bot-blocker](https://github.com/bluedragonz/bad-bot-blocker/blob/master/.htaccess)

## 1) bad\_bot.conf UA 차단

경로 예: `conf/extra/bad_bot.conf` 또는 `/etc/httpd/conf.d/`

```javascript
SetEnvIfNoCase User-Agent "^MJ12bot" bad_bot
SetEnvIfNoCase User-Agent "SemrushBot" bad_bot
SetEnvIfNoCase User-Agent "Baiduspider" bad_bot
SetEnvIfNoCase User-Agent "Yandex" bad_bot
# …필요 시 목록 추가
```

Baidu/Yandex는 트래픽 vs 검색노출 정책에 따라 허용 검토.

## 2) httpd-hosts.deny.conf IP 차단

```javascript
SetEnvIf remote_addr 192.0.2.10 hosts_deny
```

`/etc/hosts.deny` → Apache conf 동기화 예:

```bash
mkdir -p /root/script/ip_log
cat /etc/hosts.deny | grep ALL | awk '{print $2}' | sort -u \
  > /root/script/ip_log/etc_hosts_deny.log
sed "s/^/SetEnvIf remote_addr /" /root/script/ip_log/etc_hosts_deny.log \
  | sed "s/$/ hosts_deny/" \
  > /usr/local/apache2.4/conf/extra/httpd-hosts.deny.conf
systemctl reload httpd
```

crontab 예(4시간마다):

```javascript
00 */4 * * * /root/script/apache_ipdeny_hosts_deny_cron.sh > /dev/null 2>&1
```

## 3) VirtualHost Directory 적용

```javascript
<Directory "/path/to/docroot">
    Include conf/extra/bad_bot.conf
    Include conf/extra/httpd-hosts.deny.conf
    SetEnvIf MM_COUNTRY_CODE ^(CN) BlockCountry
    <RequireAll>
        Require all granted
        Require not env BlockCountry
        Require not env bad_bot
        Require not env hosts_deny
    </RequireAll>
</Directory>
```

```bash
systemctl reload httpd
```

차단 시 access 403 + error `AH01630: client denied by server configuration`
