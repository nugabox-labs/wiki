+++
title = "xcp-ng ISO 저장소 생성·갱신"
date = 2021-05-06T05:01:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "579faa07-d49b-4c25-b453-d6c899789e7b"
notion_url = "https://app.notion.com/p/xcp-ng-ISO-579faa07d49b4c25b453d6c899789e7b"
external_url = "https://alwaysu012.tistory.com/m/49"
+++

## ISO SR 생성

```bash
xe sr-create name-label=<name> type=iso \
  device-config:location=<iso_dir> \
  device-config:legacy_mode=true \
  content-type=iso

# 예
mkdir -p /ISO_Storage
xe sr-create name-label=ISO_Storage type=iso \
  device-config:location=/ISO_Storage \
  device-config:legacy_mode=true content-type=iso
```

## 확인·스캔

```bash
xe sr-list name-label=ISO_Storage
# SFTP 등으로 ISO 업로드 후
xe sr-scan uuid=<sr-uuid>
```
