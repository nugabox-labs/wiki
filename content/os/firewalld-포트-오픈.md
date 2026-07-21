+++
title = "firewalld 포트 오픈"
date = "2019-04-11T07:39:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "f8c6e7eb-7da0-48f8-b571-ca35ac0c4a4d"
notion_url = "https://app.notion.com/p/firewalld-f8c6e7eb7da048f8b571ca35ac0c4a4d"
+++

## firewalld (CentOS 7+)

설정: `/etc/firewalld/zones/public.xml`

```bash
# 영구 포트 오픈 → reload
firewall-cmd --permanent --zone=public --add-port=8080/tcp
firewall-cmd --permanent --zone=public --remove-port=3306/tcp
firewall-cmd --reload

# 임시(재부팅·reload 시 소멸) — --permanent 없이
firewall-cmd --zone=public --add-port=8080/tcp

firewall-cmd --state
firewall-cmd --get-active-zones
firewall-cmd --zone=public --list-all

systemctl enable --now firewalld
# 중지: systemctl stop firewalld && systemctl disable firewalld
```

iptables(CentOS 6) → [iptables 포트](https://app.notion.com/p/4ba8bf0ff1314f9ca55928d397ca5499)
