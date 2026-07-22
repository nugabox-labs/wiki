+++
title = "CentOS Node.js 설치"
date = 2022-05-11T07:03:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "BACK-END"]
tags = ["LINUX", "Node.js"]
toc = true

[extra]
source = "notion"
notion_id = "f7680f46-ac80-4287-83b3-3e13c9e63375"
notion_url = "https://app.notion.com/p/CentOS-Node-js-f7680f46ac80428783b33e13c9e63375"
external_url = "https://lucidmaj7.tistory.com/282"
+++

## yum (EPEL)

```bash
yum install epel-release
yum -y install nodejs
node -v && npm -v
```

## NodeSource (특정 버전)

```bash
yum install -y gcc-c++ make
curl -sL https://rpm.nodesource.com/setup_18.x | bash -
yum install -y nodejs
```

## 바이너리

```bash
wget https://nodejs.org/dist/v18.x.x/node-v18.x.x-linux-x64.tar.xz
tar xf node-v*.tar.xz && mv node-v* /usr/local/lib/node
echo 'export PATH=/usr/local/lib/node/bin:$PATH' >> /etc/bashrc && source /etc/bashrc
```

## n 패키지

```bash
npm install -g n
n lts   # 또는 n 18.x
node --version
```
