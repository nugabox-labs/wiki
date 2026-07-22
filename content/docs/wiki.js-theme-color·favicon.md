+++
title = "Wiki.js theme-color·favicon"
date = 2024-07-02T05:58:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "BACK-END", "TECH"]
tags = ["WEB", "Node.js", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "48c67fe7-b556-4c86-a449-d5a810b73961"
notion_url = "https://app.notion.com/p/Wiki-js-theme-color-favicon-48c67fe7b5564c86a449d5a810b73961"
external_url = "https://tmux.men/en/wikijs"
+++

## theme-color / TileColor / safari-pinned-tab

```bash
docker exec -it wikijs vi /wiki/server/views/master.pug
```

`meta(name='theme-color')`, `msapplication-TileColor`, `link(rel='mask-icon' ... color='')` 의 `content`/`color` 값 수정.

## Favicon

호스트 `assets`를 `/wiki/assets`에 마운트해 PNG 교체.

```yaml
services:
  wiki:
    image: ghcr.io/requarks/wiki:2
    volumes:
      - $HOME/Docker/wikijs/assets:/wiki/assets
```
