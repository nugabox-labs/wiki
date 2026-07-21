+++
title = "INSERT에 MAX로 순번 증가"
date = 2019-10-18T18:17:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "460358e8-bee8-4dd5-b9b4-e1d9019e8bb5"
notion_url = "https://app.notion.com/p/INSERT-MAX-460358e8bee84dd5b9b4e1d9019e8bb5"
external_url = "https://sdevstudy.tistory.com/22"
+++

## INSERT 시 MAX로 순번 증가 (AUTO\_INCREMENT 대안)

```sql
INSERT INTO tb_ball (ball_id, ball_name)
VALUES (
  (SELECT IFNULL(MAX(ball_id) + 1, 1) FROM tb_ball b),
  '배구공'
);
```

서브쿼리 테이블에 **별칭** 필요 — 없으면 `You can't specify target table for update in FROM clause`.
