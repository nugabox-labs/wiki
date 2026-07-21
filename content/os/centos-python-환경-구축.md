+++
title = "CentOS Python 환경 구축"
date = 2021-05-20T07:31:00Z
updated = 2026-07-21T05:33:00Z
categories = ["OS", "BACK-END"]
tags = ["LINUX", "PYTHON"]
toc = true

[extra]
source = "notion"
notion_id = "0bd10266-fec2-4be2-a232-a39b6c8446f5"
notion_url = "https://app.notion.com/p/CentOS-Python-0bd10266fec24be2a232a39b6c8446f5"
external_url = "https://www.python.org/ftp/python/"
+++

CentOS 6.x는 repo 지원 종료 → 소스 컴파일 설치.

## 필수 패키지

```bash
yum -y install gcc gcc-c++ openssl openssl-devel zlib zlib-devel libffi-devel
```

## 컴파일 설치 (3.6.9 예)

다운로드: [python.org/ftp/python](https://www.python.org/ftp/python/)

```bash
wget https://www.python.org/ftp/python/3.6.9/Python-3.6.9.tgz
tar zxvf Python-3.6.9.tgz
```

### (선택) OpenSSL 컴파일 설치 시

`Modules/Setup.dist`에서 `_socket`/`_ssl` 주석 해제, `SSL=/usr/local/openssl` 경로 맞추기.

### configure · make

```bash
cd Python-3.6.9
./configure --enable-optimizations --prefix=/usr/local/python3.6 \
  --with-ensurepip=yes \
  CFLAGS="-I/usr/local/ssl/include" LDFLAGS="-L/usr/local/ssl/lib"

grep -c processor /proc/cpuinfo   # 코어 수
make -j $(nproc)
make altinstall
/usr/local/python3.6/bin/python3.6 -V
```

### 링크 (필요 시)

```bash
which python3.6
cd /usr/bin
ln -s /usr/local/python3.6/bin/python3.6 python3.6
```

## yum 설치 (CentOS 7)

IUS: [repo.ius.io](https://repo.ius.io/)

```bash
yum install -y https://repo.ius.io/ius-release-el7.rpm
yum install -y python36u python36u-libs python36u-devel python36u-pip
python3 -V
```

> CentOS 7.9 repo 기본 상한 ≈ Python 3.6.

## 가상환경 (virtualenv)

root/sudo로 전역 pip 설치는 지양. 사용자 Home에서 관리.

```bash
pip3 install virtualenv
virtualenv myenv
source myenv/bin/activate
pip install 패키지
deactivate
```

## Troubleshooting

### Segmentation Fault

```bash
python3 -m pip install sentencepiece
```
