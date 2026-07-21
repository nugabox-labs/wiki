+++
title = "GitHub Private Repository 사용 방법"
date = 2021-04-09T04:14:00Z
updated = 2026-07-21T02:37:00Z
categories = ["DEV-OPS"]
tags = ["GIT/SVN"]
toc = true

[extra]
source = "notion"
notion_id = "93a57f91-1d05-4135-8641-e93719741879"
notion_url = "https://app.notion.com/p/GitHub-Private-Repository-93a57f911d0541358641e93719741879"
external_url = "https://kibua20.tistory.com/88"
+++

## SSH 방식 (권장)

```bash
ssh-keygen
cat ~/.ssh/id_rsa.pub   # 출력값을 GitHub에 등록
```

- 등록 위치: 특정 repo만 → Repo Settings > Deploy keys / 계정 전체 → Profile > Settings > SSH and GPG keys
- URL 형식: `git@github.com:[owner]/[repo].git`
- 현재 remote가 https인지 ssh인지 확인/전환

```bash
git remote -v
git remote set-url origin git@github.com:[owner]/[repo].git   # https → ssh
git remote set-url origin https://github.com/[owner]/[repo].git  # ssh → https
```

- Repository별로 SSH Key를 다르게 쓰려면 `~/.ssh/config`에 Host 별칭 등록

```javascript
Host project1.github.com
  Hostname github.com
  IdentityFile ~/.ssh/id_rsa.project1
```

## HTTPS 방식 (SSH가 방화벽 등으로 막힌 경우)

- Access Token 사용 (2FA 설정 시 필수, Password 대신 사용)

```bash
git clone https://[ID]:[ACCESS_TOKEN]@github.com/[ID]/[repo].git
```

Token 발급: GitHub Profile > Settings > Developer settings > Personal access tokens > Generate

- 매번 입력이 번거로우면 credential cache 사용

```bash
git config credential.helper store
git config --global credential.helper 'cache --timeout 7200'
```

원문: [https://kibua20.tistory.com/88](https://kibua20.tistory.com/88)
