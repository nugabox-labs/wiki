+++
title = "Tomcat 세션 클러스터링 mod_jk"
date = 2023-09-25T09:56:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER"]
tags = ["WEB", "WAS"]
toc = true

[extra]
source = "notion"
notion_id = "10e5df95-98fb-4cae-8c93-95dbb7367e10"
notion_url = "https://app.notion.com/p/Tomcat-mod_jk-10e5df9598fb4cae8c9395dbb7367e10"
external_url = "https://www.didim365.com/blog/20200526-blog-2/"
+++

## 개요

WAS 2대 이상에서 동일 세션을 유지·복제. sticky + Cluster 복제.

## ① 1대 서버 Tomcat 2개 (테스트)

1. Tomcat 복사 후 `server.xml` 포트 +1 (예: Server 8006 / HTTP 8081 / AJP 8010)
1. Apache `workers.properties`

```javascript
worker.list=loadbalancer
worker.loadbalancer.type=lb
worker.loadbalancer.balanced_workers=tomcat1,tomcat2
worker.loadbalancer.sticky_session=1

worker.tomcat1.type=ajp13
worker.tomcat1.host=localhost
worker.tomcat1.port=8009
worker.tomcat1.lbfactor=1

worker.tomcat2.type=ajp13
worker.tomcat2.host=localhost
worker.tomcat2.port=8010
worker.tomcat2.lbfactor=1
```

1. `JkMount /*.do loadbalancer`, `JkMount /*.jsp loadbalancer`
1. 각 `<Engine jvmRoute="tomcat1">` / `tomcat2`

## ② LB + WEB 2 + WAS 2 (이중화)

- WEB별 `workers.properties`에 WAS IP:AJP, `lbfactor` 배분
- httpd에 mod\_jk (JkWorkersFile, JkLogFile 등)
- WAS별 `jvmRoute` + 아래 Cluster

## Cluster (`server.xml`)

```xml
<Cluster className="org.apache.catalina.ha.tcp.SimpleTcpCluster" channelSendOptions="8">
  <Manager className="org.apache.catalina.ha.session.DeltaManager"
           expireSessionsOnShutdown="false" notifyListenersOnReplication="true"/>
  <Channel className="org.apache.catalina.tribes.group.GroupChannel">
    <Membership className="org.apache.catalina.tribes.membership.McastService"
                address="228.0.0.4" port="45564" frequency="500" dropTime="3000"/>
    <Receiver className="org.apache.catalina.tribes.transport.nio.NioReceiver"
              address="auto" port="4000" autoBind="100" selectorTimeout="5000" maxThreads="6"/>
    <Sender className="org.apache.catalina.tribes.transport.ReplicationTransmitter">
      <Transport className="org.apache.catalina.tribes.transport.nio.PooledParallelSender"/>
    </Sender>
    <Interceptor className="org.apache.catalina.tribes.group.interceptors.TcpFailureDetector"/>
  </Channel>
  <Valve className="org.apache.catalina.ha.tcp.ReplicationValve"
         filter=".*\.gif|.*\.js|.*\.jpeg|.*\.jpg|.*\.png|.*\.htm|.*\.html|.*\.css|.*\.txt"/>
  <Valve className="org.apache.catalina.ha.session.JvmRouteBinderValve"/>
  <ClusterListener className="org.apache.catalina.ha.session.ClusterSessionListener"/>
</Cluster>
```

- Receiver port는 WAS별 중복 금지
- `web.xml`에 `<distributable/>` 필수
- Tomcat 8+: `MessageDispatch15Interceptor` 제거

## 확인

세션 테스트 JSP → Session ID 접미사(`.tomcat1`/`.tomcat2`) 확인 → 노드 중지 후 접미사만 바뀌면 성공.
