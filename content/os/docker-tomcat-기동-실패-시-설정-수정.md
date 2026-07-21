+++
title = "Docker Tomcat 기동 실패 시 설정 수정"
date = 2021-10-02T07:32:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER", "TECH"]
tags = ["WAS", "ISSUE", "LINUX", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "67ee3cdc-9efe-4ac5-aef9-f9a5f0f54cfb"
notion_url = "https://app.notion.com/p/Docker-Tomcat-67ee3cdc9efe4ac5aef9f9a5f0f54cfb"
+++

## Docker Tomcat: 기동 실패 시 설정 수정

### 증상

`docker run` 후 Tomcat `server.xml` 경로 오류로 컨테이너가 바로 죽음.

```bash
docker run --name tomcat8 -i -t -d -p 8088:8080 tomcat-set1
docker logs -t <CONTAINER_ID>
```

### 정지 컨테이너 파일 수정 (호스트로 복사)

```bash
docker ps -a
docker cp <CONTAINER_ID>:/usr/local/tomcat/ /home/ubuntu/
# 호스트에서 수정 후
docker cp tomcat/ <CONTAINER_ID>:/usr/local/
docker container restart tomcat8
```

### 자주 쓰는 run / 접속

```bash
docker run --name tomcat8 -v $PWD/upload/images/:/upload/images/ -i -t -d -p 80:8080 tomcat-set1
docker exec -u 0 -it tomcat8 bash
apt-get update && apt-get install -y nano
```

### 설정 포인트

- `conf/tomcat-users.xml` — manager 역할/계정
- `webapps/manager/META-INF/context.xml` — RemoteAddrValve IP
- `webapps/manager/WEB-INF/web.xml` — multipart max size (SizeLimitExceededException)
- `conf/server.xml` — Context docBase, JNDI Resource

```bash
docker commit tomcat8 my-tomcat-image
```
