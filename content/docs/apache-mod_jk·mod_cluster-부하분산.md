+++
title = "Apache mod_jk·mod_cluster 부하분산"
date = 2023-09-12T01:38:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["WEB", "WAS"]
toc = true

[extra]
source = "notion"
notion_id = "008c93c1-dd69-4dd7-8720-259bf2fa3142"
notion_url = "https://app.notion.com/p/Apache-mod_jk-mod_cluster-008c93c1dd694dd78720259bf2fa3142"
external_url = "http://www.epari.net/@architecture/vlink/b/cd"
+++

## 1. VirtualHost — `/etc/httpd/conf/httpd.conf`

```javascript
SetEnvIf Request_URI "favicon.ico" dontlog=1
ServerSignature Off
ServerTokens ProductOnly

<IfModule mod_headers.c>
 Header unset X-Powered-By
 Header unset Server
</IfModule>

<IfModule security2_module>
  SecRuleEngine on
  ServerTokens Full
  ServerSignature Off
  SecServerSignature "MyTest-WS"
</IfModule>

IncludeOptional conf.d/*.conf

<VirtualHost *:80>
   ServerName myweb.example.com
   ServerAlias www.myweb.example.com
   DocumentRoot /var/www/html
   DirectoryIndex index.do index.html index.htm index.jsp index.php
   JkMountFile conf.d/uriworkermap.properties
   JkMount /* wlb_common
   KeepAliveTimeout 80
   MaxKeepAliveRequests 0

   <Location /jkstatus>
     JkMount jkstatus
     <RequireAll>
      Require all granted
      Require env MY_APP_NO_AUTH
     </RequireAll>
   </Location>

   ErrorLog logs/myweb-error_log
   CustomLog logs/myweb-access_log common env=!dontlog
</VirtualHost>
```

## 2. mod\_jk.conf

```javascript
LoadModule jk_module modules/mod_jk.so
JkWorkersFile conf.d/workers.properties
JkLogFile logs/mod_jk.log
JkLogLevel info
JkLogStampFormat "[%a %b %d %H:%M:%S %Y]"
JkOptions +ForwardKeySize +ForwardURICompatUnparsed -ForwardDirectories
JkRequestLogFormat "%w %V %T"
JkShmFile run/jk.shm
```

## 3. mod\_cluster.conf

```javascript
LoadModule advertise_module modules/mod_advertise.so
LoadModule manager_module modules/mod_manager.so
LoadModule cluster_slotmem_module modules/mod_cluster_slotmem.so
MemManagerFile /var/cache/httpd

<IfModule manager_module>
  Listen 192.168.10.1:18847
  Maxhost 80
  ManagerBalancerName mycluster

  <VirtualHost 192.168.10.1:18847>
    ServerAdvertise on
    AdvertiseFrequency 5
    AdvertiseGroup 224.0.1.105:23364
    ProxyPass / balancer://mycluster stickysession=JSESSIONID|jsessionid nofailover=on
    ProxyPassReverse / balancer://mycluster
    ProxyPreserveHost on
    EnableMCPMReceive
    <Location /mcm>
      SetHandler mod_cluster-manager
    </Location>
  </VirtualHost>
</IfModule>
```

## 4. [uriworkermap.properties](http://uriworkermap.properties/)

```javascript
/common/ =wlb_common
/common/* =wlb_common
/jkstatus =jkstatus
/jkstatus/* =jkstatus
/common/*.js =wlb_common
/common/*.jsp =wlb_common
/common/*.do =wlb_common
```

## 5. [workers.properties](http://workers.properties/) (요약)

```javascript
worker.list=jkstatus, wlb_common

worker.template.type=ajp13
worker.template.ping_mode=A
worker.template.ping_timeout=100000
worker.template.socket_timeout=600
worker.template.connect_timeout=600000
worker.template.prepost_timeout=600000
worker.template.recovery_options=4
worker.template.reply_timeout=30000
worker.template.fail_on_status=-404,-500,503,504

worker.S01-Node01.reference=worker.template
worker.S01-Node01.host=192.168.20.1
worker.S01-Node01.port=8009
worker.S01-Node01.lbfactor=1
# S01-Node02:8109 / S02-Node01:8009 / S02-Node02:8109 동일 패턴

worker.jkstatus.type=status
worker.wlb_common.type=lb
worker.wlb_common.method=S
worker.wlb_common.session_cookie=JSESSIONID
worker.wlb_common.sticky_session=True
worker.wlb_common.sticky_session_force=False
worker.wlb_common.balance_workers=S01-Node01, S01-Node02, S02-Node01, S02-Node02
```

## 서버 헤더 숨김 (JBoss)

```javascript
# env.properties
org.apache.coyote.http11.Http11Protocol.SERVER="MyTest-WS"
```
