+++
title = "SVN 용어"
date = 2023-03-11T13:47:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "DEV-OPS"]
tags = ["GIT/SVN", "WINDOWS"]
toc = true

[extra]
source = "notion"
notion_id = "cbe918e0-34cb-484b-b3d6-a00aba558fa0"
notion_url = "https://app.notion.com/p/SVN-cbe918e034cb484bb3d6a00aba558fa0"
external_url = "https://revf.tistory.com/145"
+++

**기본**

- `repository` — 소스 저장소, 버전 관리
- `checkout` — 최신 소스 내려받기
- `import` — 소스를 저장소에 처음 넣기
- `export` — 버전 정보 없이 소스만 추출
- `revision` — 커밋마다 증가하는 버전 번호

**저장 구조**

- `trunk` — 메인 개발
- `branches` — 분리 작업
- `tags` — 배포 스냅샷

**작업**

- `commit` — 수정분 업로드
- `update` — 저장소 변경 내려받기
- `update to revision` — 특정 버전으로 이동
- `merge` — 동시 수정분 합치기 (합친 뒤 코드 확인)
- `synchronize with repository` — 로컬↔저장소 비교
- `show history` — 변경 이력
