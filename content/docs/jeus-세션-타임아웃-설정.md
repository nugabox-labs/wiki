+++
title = "JEUS 세션 타임아웃 설정"
date = 2025-03-04T00:00:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "BACK-END", "TECH"]
tags = ["JAVA", "WAS", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "1acaac4e-32a5-80dd-8866-f7754ef6b32f"
notion_url = "https://app.notion.com/p/JEUS-1acaac4e32a580dd8866f7754ef6b32f"
+++

세션 무제한(`-1`) 예시. 기본 타임아웃은 보통 30분.

## 1. JEUSMain.xml

`$JEUS_HOME/config/<hostname>/JEUSMain.xml`

```xml
<session-server>
  <removal-to>-1</removal-to>
  <passivation-to>-1</passivation-to>
</session-server>
```

## 2. WEBMain.xml

`$JEUS_HOME/config/<hostname>/<hostname>_<servlet_engine>/WEBMain.xml`

```xml
<context-group>
  <group-name>MyGroup</group-name>
  <session-config>
    <timeout>-1</timeout>
  </session-config>
</context-group>
```

## 3. web.xml

`WEB-INF/web.xml`

```xml
<session-config>
  <session-timeout>-1</session-timeout>
</session-config>
```
