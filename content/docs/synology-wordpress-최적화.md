+++
title = "Synology WordPress 최적화"
date = 2019-09-26T17:57:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER", "BACK-END"]
tags = ["SYNOLOGY", "WEB", "PHP"]
toc = true

[extra]
source = "notion"
notion_id = "e34e5eda-cc36-400a-903c-e0a88cfbebc1"
notion_url = "https://app.notion.com/p/Synology-WordPress-e34e5edacc36400a903ce0a88cfbebc1"
external_url = "https://sublog.me/2016/11/05/시놀로지-nas로-워드프레스-운영-5개월-그간의-최적화/"
+++

## Synology WP 최적화 요약

1. **HTTPS** 먼저 (Let's Encrypt) → 그다음 WP 패키지
1. **PHP 7+** (Web Station)
1. **URL에서 ****`/wordpress`**** 제거**: WP 사이트주소 수정 → `index.php`·`.htaccess`를 `web/`로 복사 → `index.php`의 require 경로에 `/wordpress/` 유지 → Permalinks 저장
1. **php.ini**: `memory_limit`, `max_execution_time` 상향
1. **MariaDB my.cnf**: `innodb_buffer_pool_size` 등 캐시 상향 후 재시작
1. Web Station: PHP cache on
1. `.htaccess`: DEFLATE/Expires/Cache-Control, `Options -Indexes`, `wp-config.php` deny
1. 플러그인: Minify, EWWW Image Optimizer, WP Super Cache, Async JS/CSS, Use Google Libraries, DB cleanup
