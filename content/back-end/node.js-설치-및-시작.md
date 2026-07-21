+++
title = "Node.js 설치 및 시작"
date = "2019-11-01T06:19:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["BACK-END"]
tags = ["Node.js"]
toc = true

[extra]
source = "notion"
notion_id = "7c65a280-137d-4d07-a9a8-ca2a0ffa987a"
notion_url = "https://app.notion.com/p/Node-js-7c65a280137d4d07a9a8ca2a0ffa987a"
+++

## 설치 여부 확인

```bash
rpm -qa | grep nodejs
rpm -qa npm
node -v
```

## 설치 (CentOS/RHEL 계열)

```bash
yum install -y gcc-c++ make       # 의존성 패키지
# NodeSource 등에서 최신 저장소 추가 스크립트 실행 후
yum install nodejs                # nodejs 설치
yum install npm                   # npm (목록에 없으면 epel 저장소 추가 필요)
```

## 자주 쓰는 패키지 설치

```bash
npm install request
npm install --save express
npm install --save socket.io
```

관련: [리눅스 node.js 설치](https://nirsa.tistory.com/193), [리눅스 CentOS NodeJS 웹서버](https://app.notion.com/p/5d0057587e3e48f3853121a9ebdf6985) (모두 이 페이지로 통합)
