+++
title = "GitLab 설치"
date = 2025-01-20T05:32:00Z
updated = 2026-07-21T02:37:00Z
categories = ["DEV-OPS"]
tags = ["GIT/SVN"]
toc = true

[extra]
source = "notion"
notion_id = "181aac4e-32a5-8007-99ee-c2294dbaf6ea"
notion_url = "https://app.notion.com/p/GitLab-181aac4e32a5800799eec2294dbaf6ea"
+++

## Docker로 GitLab 설치

```bash
docker pull gitlab/gitlab-ee:16.11.9-ce.0
```

- EE 설치가 무료이며 CE 기능 전부 포함 → EE로 설치

### docker run 옵션

- `--restart=always` 필수
- 포트: `-P 4000:80 -P 4001:443 -P 4022:4022` (Local:Container = 4000:80, 4001:443, 4022:4022, SSH포트는 아래 env로 변경 가능)
- 볼륨(선택): `-V /volume1/docker/gitlab-17.7/config:/etc/gitlab:rw -V .../data:/var/opt/gitlab:rw -V .../logs:/var/log/gitlab:rw`

### GITLAB\_OMNIBUS\_CONFIG 환경변수

```bash
external_url 'http://gitlab.example.com';   # HTTPS면 Let's Encrypt 자동 발급되므로 주의

# PostgreSQL 연동(선택)
gitlab_rails['db_adapter'] = 'postgresql';
gitlab_rails['db_host'] = 'example.com';
gitlab_rails['db_port'] = 5432;
gitlab_rails['db_username'] = 'gitlab';
gitlab_rails['db_password'] = 'password!';
gitlab_rails['db_database'] = 'gitlabhq_production';

mattermost['enable'] = false;                     # Mattermost 비활성화(선택)
gitlab_rails['gitlab_shell_ssh_port'] = 4022       # SSH 포트 변경(선택)
```

### 초기 접속

- 계정: `root`
- 비밀번호: 컨테이너 내 `/etc/gitlab/initial_root_password`
