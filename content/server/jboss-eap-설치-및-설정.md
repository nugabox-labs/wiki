+++
title = "JBoss EAP 설치 및 설정"
date = "2021-04-06T00:18:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["SERVER"]
tags = ["WAS"]
toc = true

[extra]
source = "notion"
notion_id = "5cefc368-a346-4dab-b0df-ba9046225c8e"
notion_url = "https://app.notion.com/p/JBoss-EAP-5cefc368a3464dabb0dfba9046225c8e"
+++

- CONTENTS


![image](/notion-assets/5cefc368-a346-4dab-b0df-ba9046225c8e/7.png)

## 다운로드 및 설치

---

- JBoss EAP 6 설치 지원 환경 : [http://www.opennaru.com/jboss/jboss-eap6-supported-configurations/](http://www.opennaru.com/jboss/jboss-eap6-supported-configurations/)
- 다운로드 페이지 : [https://developers.redhat.com/products/eap/download?referrer=jbd](https://developers.redhat.com/products/eap/download?referrer=jbd)
- 설치는 yum repository를 이용한 패키지 설치, GUI 환경 설치, Zip 압축 파일 설치 방법 등이 있다.
- 해당 버전 ZIP File 다운로드 후 서버에 업로드하여 압축 해제 : `unzip jboss-eap-6.4.0.zip`

## 설정

---

### 관리자 생성

- `JBOSS_HOME/bin/add-user.sh`

### 외부 접속가능하게 설정

- JBoss는 별도의 IP를 성정하지 않고 구동하면 바인딩 IP주소가 127.0.0.1 이므로 외부접속이 불가하다. 외부 접근이 가능하려면 아래의 파일을 변경 후 구동해야 한다.

```bash
<interface name="management">
    <inet-address value="${jboss.bind.address.management:127.0.0.1}"/>
</interface>
<interface name="public">
    <inet-address value="${jboss.bind.address:127.0.0.1}"/>
</interface>
```

부분을 아래와 같이 변경한다.

```bash
<interface name="management">
    <any-address/>
</interface>
<interface name="public">
    <any-address/>
</interface>
```

- 웹에서 확인
  http://IP:8080/

  http://IP:9990/management

## 서버 실행

---

### 스탠드얼론 모드 서버 실행

- Stnadalone 모드에서 **기본 프로파일을 읽어 **인스턴스 실행 
  `JBOSS_HOME/bin/standalone.sh`
- **특정 프로파일을 읽어** 인스턴스 실행 : `-c` 옵션
  `JBOSS_HOME/bin/standalone.sh -c=standalone.xml`

  `JBOSS_HOME/bin/standalone.sh -c=standalone-full-ha.xml`
- **외부 접속 가능한 IP 설정 후** 인스턴스 실행 
  :`-b` 옵션으로 IP 바인드가 가능하고 관리도구도 `-bmanagement`로 바인드

  `JBOSS_HOME/bin/standalone.sh -c=standalone.xml -b=0.0.0.0 -bmanagement=0.0.0.0` 
- **동일 머신에서 여러 개의 인스턴스 실행**
  : 시스템 프로퍼티 jboss.socket.binding.port 에 의해 포트 오프셋(offset) 지정 가능

  `JBOSS_HOME/bin/standalone.sh -c=standalone.xml -b=0.0.0.0 -bmanagement=0.0.0.0 -Djboss.socket.binding.port-offset=100` 

### 도메인 모드 서버 실행

`JBOSS_HOME/bin/domain.sh -c=domain.xml —host-config=host.xml -b=0.0.0.0 -bmanagement=0.0.0.0`
