+++
title = "Ubuntu Tomcat 부팅 자동 실행"
date = 2022-08-21T16:46:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER", "DEV-OPS"]
tags = ["WAS", "LINUX", "BASH"]
toc = true

[extra]
source = "notion"
notion_id = "92ea5d7f-1ada-4e87-8e18-9141ed6aa573"
notion_url = "https://app.notion.com/p/Ubuntu-Tomcat-92ea5d7f1ada4e878e189141ed6aa573"
external_url = "https://minddong.tistory.com/21"
+++

## Ubuntu 부팅 시 Tomcat (init.d)

```bash
sudo vim /etc/init.d/tomcat
```

```bash
#!/bin/bash
### BEGIN INIT INFO
# Provides:          tomcat
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: auto start Tomcat
### END INIT INFO

TOMCAT_HOME=/usr/local/apache-tomcat

case "$1" in
start)
  sh "$TOMCAT_HOME/bin/startup.sh"
  ;;
stop)
  sh "$TOMCAT_HOME/bin/shutdown.sh"
  ;;
restart)
  sh "$TOMCAT_HOME/bin/shutdown.sh"
  sh "$TOMCAT_HOME/bin/startup.sh"
  ;;
esac
exit 0
```

```bash
sudo chmod 755 /etc/init.d/tomcat
sudo update-rc.d tomcat defaults
sudo service tomcat restart
```

최신 Ubuntu는 `systemd` unit 권장.
