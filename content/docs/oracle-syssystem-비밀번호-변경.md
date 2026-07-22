+++
title = "Oracle SYS/SYSTEM 비밀번호 변경"
date = 2023-03-15T12:52:00Z
updated = 2026-07-22T01:28:00Z
categories = ["SERVER", "TECH"]
tags = ["Oracle", "DB", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "33aa472b-cea4-4dec-b916-2dbef40a5c6c"
notion_url = "https://app.notion.com/p/Oracle-SYS-SYSTEM-33aa472bcea44decb9162dbef40a5c6c"
external_url = "https://wookoa.tistory.com/234"
+++

오라클을 처음 셋팅하면 SYS 및 SYSTEM 계정의 비밀번호를 설정해야 한다. 간단한 방법으로 다시 설정할 수 있다. 다만, 이 방법은 데이터베이스에 'sqlplus / as sysdba'로 접근이 가능할때 유효하다.

## **SYS 및 SYSTEM 계정으로 접속**

1. cmd 창에서 SQLPlus 실행

2. 사용자명 입력: sys as sysdba

3. 비밀번호 입력: **아무런 입력 없이 엔터**

![image](/notion-assets/33aa472b-cea4-4dec-b916-2dbef40a5c6c/1.octet-stream)

## **접속한 계정의 비밀번호 변경**

4. 하기 명령어와 같이 비밀번호를 변경한다. 본인의 경우 패쓰워드는 'wookoa'로 지정했다.

ex) alter user sys identified by wookoa;

5. 변경된 계정으로 접근이 가능한지 접속해본다.

ex) conn sys/wookoa as sysdba

![image](/notion-assets/33aa472b-cea4-4dec-b916-2dbef40a5c6c/2.octet-stream)

한정적이긴 하지만 학습용으로는 충분히 활용이 가능하기에 유용한 방법이 될 듯 싶다.

SYS 및 SYSTEM과 같은 관리자 비밀번호는 꼭 잊어버리지 말자!
