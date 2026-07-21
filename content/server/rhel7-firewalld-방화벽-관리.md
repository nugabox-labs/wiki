+++
title = "RHEL7 firewalld 방화벽 관리"
date = 2020-02-18T16:55:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["DB", "Oracle"]
toc = true

[extra]
source = "notion"
notion_id = "b2f7fb51-aed0-4f6e-a142-10c7b9ea248d"
notion_url = "https://app.notion.com/p/RHEL7-firewalld-b2f7fb51aed04f6ea14210c7b9ea248d"
+++

## RHEL7 방화벽(firewalld) 관리

**firewalld 중지/비활성화**

```bash
systemctl status firewalld.service
systemctl stop firewalld.service
systemctl disable firewalld.service
```

**firewalld 시작/활성화**

```bash
systemctl status firewalld.service
systemctl start firewalld.service
systemctl enable firewalld.service
```

**포트 추가**

```bash
firewall-cmd --get-default-zone           # 기본 zone 확인
firewall-cmd --get-active-zone            # 활성 zone 확인
firewall-cmd --list-ports                 # 열린 포트 확인

firewall-cmd --permanent --zone=public --add-port=9999/tcp   # 영구 추가
firewall-cmd --reload                      # 적용
firewall-cmd --state                       # 방화벽 상태 확인
firewall-cmd --list-ports                  # 추가 확인
```

원문: [https://ksmk.tistory.com/59](https://ksmk.tistory.com/59)
