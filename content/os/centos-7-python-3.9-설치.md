+++
title = "CentOS 7 Python 3.9 설치"
date = 2024-03-19T02:05:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "BACK-END", "DEV-OPS"]
tags = ["PYTHON", "LINUX", "BASH"]
toc = true

[extra]
source = "notion"
notion_id = "1cdca1bc-6d0f-496c-8e0a-f5cdaad08c78"
notion_url = "https://app.notion.com/p/CentOS-7-Python-3-9-1cdca1bc6d0f496c8e0af5cdaad08c78"
external_url = "https://earthconquest.tistory.com/242"
+++

```bash
python --version
# Python 2.7.5 (CentOS 7 기본)

yum install gcc openssl-devel bzip2-devel libffi-devel -y

wget https://www.python.org/ftp/python/3.9.5/Python-3.9.5.tgz
tar -xvf Python-3.9.5.tgz
cd Python-3.9.5/
./configure --enable-optimizations
make altinstall

which python3.9
# /usr/local/bin/python3.9

vi /root/.bashrc
# alias python="/usr/local/bin/python3.9"
source /root/.bashrc

python -V
# Python 3.9.5
```
