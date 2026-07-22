+++
title = "Jeus 세션 무제한 설정"
date = 2022-04-14T04:36:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["WAS"]
toc = true

[extra]
source = "notion"
notion_id = "1ab6ec93-fba1-43ad-b88a-c54de66fb9c3"
notion_url = "https://app.notion.com/p/Jeus-1ab6ec93fba143adb88ac54de66fb9c3"
+++

## JEUSMain.xml

`$JEUS_HOME/config/<hostname>/JEUSMain.xml`

```xml
<session-server>
  <removal-to>-1</removal-to>
  <passivation-to>-1</passivation-to>
</session-server>
```

## WEBMain.xml

`$JEUS_HOME/config/<hostname>/<hostname>_<engine>/WEBMain.xml`

```xml
<context-group>
  <group-name>MyGroup</group-name>
  <session-config><timeout>-1</timeout></session-config>
</context-group>
```

## web.xml

```xml
<session-config><session-timeout>-1</session-timeout></session-config>
```
