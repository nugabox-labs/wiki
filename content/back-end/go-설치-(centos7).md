+++
title = "Go 설치 (CentOS7)"
date = 2019-10-22T18:13:00Z
updated = 2026-07-21T02:37:00Z
categories = ["BACK-END"]
tags = ["GO"]
toc = true

[extra]
source = "notion"
notion_id = "2ce74576-0c6b-4690-86e2-0a7de483e3da"
notion_url = "https://app.notion.com/p/Go-CentOS7-2ce745760c6b469086e20a7de483e3da"
external_url = "https://dejavuqa.tistory.com/321"
+++

## Go 설치 (CentOS 7)

```bash
cat /etc/os-release        # 버전 확인
sudo yum update

wget https://dl.google.com/go/go1.11.5.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.11.5.linux-amd64.tar.gz

export PATH=$PATH:/usr/local/go/bin
source ~/.bash_profile

go version
```

## 샘플 프로젝트 빌드/실행 (Gin 예제)

```bash
mkdir -p ~/go/src
git clone https://github.com/dejavuwing/learningGin.git

cd learningGin/
go run server.go            # 바로 실행 테스트

cd ~/go
go install ./src/learningGin/   # 빌드 → ~/go/bin/learningGin 생성

./bin/learningGin &          # 백그라운드 실행 (기본 8080 포트)
```

원문: [https://dejavuqa.tistory.com/321](https://dejavuqa.tistory.com/321)
