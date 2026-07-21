+++
title = "Tomcat 세션 클러스터링 (mod_jk+AJP, LB-WEB-WAS)"
date = 2023-09-25T09:56:00Z
updated = 2026-07-21T02:37:00Z
categories = ["SERVER"]
tags = ["WEB", "WAS"]
toc = true

[extra]
source = "notion"
notion_id = "10e5df95-98fb-4cae-8c93-95dbb7367e10"
notion_url = "https://app.notion.com/p/Tomcat-mod_jk-AJP-LB-WEB-WAS-10e5df9598fb4cae8c9395dbb7367e10"
external_url = "https://www.didim365.com/blog/20200526-blog-2/"
+++

## Tomcat 세션 클러스터링 (mod\_jk + AJP)

세션 클러스터링: WAS 2대 이상에서 동일 세션을 유지·복제하는 구성

### 방법 ① 1대 서버에 Tomcat 2개 (테스트/이중화 아님)

1. Tomcat 복사 후 포트 변경(+1): `tomcat2/conf/server.xml`에서 Server/Connector/AJP 포트 각각 8006/8081/8010으로
1. Apache `workers.properties`에 로드밸런서 등록

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

1. `vhosts.conf`: `JkMount /*.do loadbalancer`, `JkMount /*.jsp loadbalancer`
1. 각 tomcat `server.xml`의 `<Engine>`에 `jvmRoute="tomcat1"`(또는 tomcat2) 추가

### 방법 ② LB 1대 + WEB 2대 + WAS 2대 (실제 이중화)

- WEB(Apache) 2대 각각 [workers.properties](http://workers.properties/)에 두 WAS의 실제 IP:AJP포트 등록, `lbfactor` 배분
- httpd.conf에 mod\_jk 설정 추가(JkWorkersFile, JkLogFile 등)
- WAS(Tomcat) 2대 각각 `jvmRoute` 설정 + Cluster 설정(아래 공통)

### 공통: Cluster 설정 (각 Tomcat의 server.xml)

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
  <Deployer className="org.apache.catalina.ha.deploy.FarmWarDeployer"
            tempDir="/tmp/war-temp/" deployDir="/tmp/war-deploy/" watchDir="/tmp/war-listen/" watchEnabled="false"/>
  <ClusterListener className="org.apache.catalina.ha.session.JvmRouteSessionIDBinderListener"/>
  <ClusterListener className="org.apache.catalina.ha.session.ClusterSessionListener"/>
</Cluster>
```

- 각 WAS의 `Receiver` port는 서로 겹치지 않게(4000, 4001, 4010...) 지정
- 프로젝트 `web.xml`에 `<distributable/>` 태그 필수(`</web-app>` 바로 위)

⚠️ **Tomcat 8.x**: `MessageDispatch15Interceptor` 옵션은 라이브러리가 제거되어 에러 발생 — 빼도 클러스터링은 정상 동작

### 동작 확인

- 세션 카운터를 세션에 저장하는 테스트 JSP로 접속 → `Current Session ID`의 접미사(`.tomcat1`/`.tomcat2`)로 어느 노드가 응답했는지 확인
- 해당 노드를 중지하고 새로고침 → 세션ID는 유지된 채 접미사만 다른 노드로 바뀌면 클러스터링 성공

원문: [https://www.didim365.com/blog/20200526-blog-2/](https://www.didim365.com/blog/20200526-blog-2/)
