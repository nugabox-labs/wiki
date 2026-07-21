+++
title = "윤도우10 FTP 서버 설정 (IIS)"
date = 2023-03-11T13:57:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS"]
tags = ["WINDOWS"]
toc = true

[extra]
source = "notion"
notion_id = "237e8ee3-2c7e-4db7-9bec-c6b395c5b424"
notion_url = "https://app.notion.com/p/10-FTP-IIS-237e8ee32c7e4db79becc6b395c5b424"
external_url = "https://gabrielyj.tistory.com/188"
+++

## 윈도우10 FTP 서버 설정 (IIS)

1. 제어판 > 프로그램 및 기능 > Windows 기능 켜기/끄기 > 인터넷 정보 서비스 > FTP 서버(FTP 서비스) + 웹 관리 도구(IIS 관리 콘솔) 체크
1. IIS 관리자 > 내 컴퓨터 우클릭 > FTP 사이트 추가 (사이트 이름, 저장소 디렉토리 지정)
1. IP는 고정 IP 선택 가능, 포트는 기본 **21**, 필요 시 '자동으로 FTP 사이트 시작' 체크, SSL 인증서는 있으면 추가
1. 익명 접속 대신 FTP 전용 Windows 계정 생성 권장 — 기본 선택, 액세스 허용은 '선택되지 않음'
1. `Win+R` > `netplwiz` > 계정 추가 > 생성한 계정 편집 > 그룹에 **IIS\_IUSRS** 등록
1. IIS 관리자 > 해당 사이트 > FTP 권한 부여 규칙 > 허용 규칙 추가 > 지정된 사용자에 계정 입력, 읽기/쓰기 권한 부여
1. `ftp://localhost/` 로 접속 후 로그인

관련: [윈도우10 FTP 서버 만들기](https://app.notion.com/p/8538ec22f67542f492d931d1a84eefb6)

원문: [https://gabrielyj.tistory.com/188](https://gabrielyj.tistory.com/188)
