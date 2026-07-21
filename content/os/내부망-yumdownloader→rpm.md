+++
title = "내부망 yumdownloader→rpm"
date = 2019-03-19T02:43:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "83b11c79-0a35-4b6a-83da-77239c629f98"
notion_url = "https://app.notion.com/p/yumdownloader-rpm-83b11c790a354b6a83da77239c629f98"
external_url = "https://m.blog.naver.com/elerve/220331451156"
+++

## 내부망 RPM 설치 (외부에서 내려받아 반입)

```bash
# 외부망
yum list-security --security
yumdownloader --resolve 패키지명

# 내부망으로 *.rpm 복사 후
rpm -Uvh pkg1.rpm pkg2.rpm ...
```

ISO local repo → ISO local yum repository
