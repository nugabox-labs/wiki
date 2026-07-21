+++
title = "Docker 명령어 치트시트"
date = 2025-04-29T23:40:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "TECH"]
tags = ["TIP", "LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "e860da48-fcf7-41ee-859a-9012d7d3468e"
notion_url = "https://app.notion.com/p/Docker-e860da48fcf741ee859a9012d7d3468e"
external_url = "https://app.notion.com/p/0d7e0652f59141f1bce446f8745a4dc6"
+++

### 이미지

```bash
docker pull nginx
docker pull nginx:stable-perl
docker image ls
docker image rm <ID|name>
docker image rm -f <ID|name>
docker image rm $(docker images -q)
```

### 컨테이너

```bash
docker create nginx
docker start <name|id>
docker run nginx
docker run -d nginx
docker run -d --name my-web nginx
docker run -d -p 4000:80 nginx
docker ps
docker ps -a
docker stop <name|id>
docker kill <name|id>
docker rm <name|id>
docker rm -f $(docker ps -qa)
docker logs <name|id>
docker logs --tail 10 <name|id>
docker logs -f <name|id>
docker exec -it <name|id> bash
```

### 볼륨

```bash
docker run -v /host/path:/container/path -d mysql
```

### Dockerfile 예 (Spring Boot)

```docker
FROM openjdk:17-jdk
COPY build/libs/*SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]
```

```bash
./gradlew clean build
docker build -t hello-server .
docker run -d -p 8080:8080 hello-server
```

### Compose

```bash
docker compose up
docker compose up -d
docker compose up --build -d
docker compose ps
docker compose logs
docker compose pull
docker compose down
```

Compose 네트워크에서는 DB 호스트를 `localhost`가 아니라 **서비스명**으로 (`jdbc:mysql://my-db:3306/...`).
