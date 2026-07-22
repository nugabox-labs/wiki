+++
title = "GitLab CI/CD vs Jenkins"
date = 2024-01-17T02:34:00Z
updated = 2026-07-21T06:47:00Z
categories = ["TECH"]
tags = ["GIT", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "68b82ef6-ec92-4533-8f64-bcdcfe1c6972"
notion_url = "https://app.notion.com/p/GitLab-CI-CD-vs-Jenkins-68b82ef6ec9245338f64bcdcfe1c6972"
external_url = "https://insight.infograb.net/blog/2023/08/10/gitlab-jenkins-comparision/"
+++

## GitLab CI/CD vs Jenkins

| 항목 | GitLab CI/CD | Jenkins |
| --- | --- | --- |
| 설치 | GitLab 설치 시 즉시 사용 | 설치·플러그인 구성 복잡 |
| 설정 | `.gitlab-ci.yml` (GitOps) | GUI + Groovy/Jenkinsfile |
| 확장 | Docker Runner | 방대한 플러그인 |

### 언제 무엇을

- **GitLab CI**: 이미 GitLab 사용, 코드·파이프라인 단일 관리, 플러그인 제작 여력 없을 때
- **Jenkins**: 이미 Jenkins 관행이 굳음, GUI·플러그인으로 대규모 맞춤 파이프라인 필요할 때

### Jenkins 주의

권한 세분화 한계, Groovy 진입장벽, Git 서비스와 깊은 통합은 API로도 한계.
