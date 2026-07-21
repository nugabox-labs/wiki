+++
title = "Ubuntu Node.js nvm 설치"
date = 2022-07-17T14:10:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "BACK-END", "DEV-OPS", "TECH"]
tags = ["LINUX", "Node.js", "BASH", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "48981425-e095-49d3-b97f-085301ed0828"
notion_url = "https://app.notion.com/p/Ubuntu-Node-js-nvm-48981425e09549d3b97f085301ed0828"
external_url = "https://codechacha.com/ko/linux-install-nodejs-lts-version/"
+++

## Ubuntu Node.js (nvm)

```bash
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
# 또는
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
# 터미널 재시작 후
nvm

nvm ls-remote          # 설치 가능 버전 (LTS)
nvm install 12.13.0
nvm ls                 # 설치·현재(->)
nvm use 12.18.1
```
