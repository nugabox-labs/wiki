+++
title = "macOS Homebrew MySQL 설치"
date = 2019-10-31T16:51:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS", "SERVER"]
tags = ["DB", "MySQL", "MACOS"]
toc = true

[extra]
source = "notion"
notion_id = "714dc0e1-14b4-4c50-94e2-ba15c26f01fa"
notion_url = "https://app.notion.com/p/macOS-Homebrew-MySQL-714dc0e114b44c5094e2ba15c26f01fa"
external_url = "https://devyurim.github.io/data%20base/mysql/2018/08/13/mysql-1.html"
+++

## macOS Homebrew MySQL

```bash
brew install mysql
brew services start mysql
mysql -u root
mysql_secure_installation
```

Workbench: `brew install --cask mysql-workbench` (구: `brew cask install`)

### Workbench + MySQL 8 `caching_sha2_password`

```sql
ALTER USER 'root'@'localhost'
  IDENTIFIED WITH mysql_native_password BY '비밀번호';
```
