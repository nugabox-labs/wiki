+++
title = "Go 설치 CentOS 7"
date = 2019-10-22T18:13:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END"]
tags = ["GO"]
toc = true

[extra]
source = "notion"
notion_id = "2ce74576-0c6b-4690-86e2-0a7de483e3da"
notion_url = "https://app.notion.com/p/Go-CentOS-7-2ce745760c6b469086e20a7de483e3da"
external_url = "https://dejavuqa.tistory.com/321"
+++

## 설치 (CentOS 7)

```bash
cat /etc/os-release
sudo yum update

wget https://dl.google.com/go/go1.11.5.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.11.5.linux-amd64.tar.gz

export PATH=$PATH:/usr/local/go/bin
source ~/.bash_profile
go version
```

## Gin 샘플 빌드·실행

```bash
mkdir -p ~/go/src
git clone https://github.com/dejavuwing/learningGin.git

cd learningGin/
go run server.go

cd ~/go
go install ./src/learningGin/   # → ~/go/bin/learningGin
./bin/learningGin &             # 기본 8080
```
