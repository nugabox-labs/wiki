+++
title = "SVN 용어 정리"
date = 2023-03-11T13:47:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS", "DEV-OPS"]
tags = ["GIT/SVN", "WINDOWS"]
toc = true

[extra]
source = "notion"
notion_id = "cbe918e0-34cb-484b-b3d6-a00aba558fa0"
notion_url = "https://app.notion.com/p/SVN-cbe918e034cb484bb3d6a00aba558fa0"
external_url = "https://revf.tistory.com/145"
+++

## SVN 용어

**기본**

- `repository` : 소스 저장소, 버전별 관리
- `checkout` : 저장소에서 최신 소스 내려받기(이후 커밋/업데이트 가능)
- `import` : 소스를 저장소에 처음 넣기
- `export` : 버전 정보 없이 소스만 추출
- `revision` : 커밋할 때마다 증가하는 버전 번호

**저장 구조**

- `trunk` : 현재 개발 중인 메인 소스
- `branches` : 테스트/프로토타입 등 분리 작업용
- `tags` : 배포 시점 버전 스냅샷

**작업**

- `commit` : 수정한 소스를 저장소에 올림
- `update` : 저장소의 변경사항을 내려받음
- `update to revision` : 특정 버전으로 되돌림/이동
- `merge` : 동시 수정분 합치기 (merge 후 코드 확인 필수)
- `synchronize with repository` : 로컬과 저장소 비교
- `show history` : 변경 이력 확인

원문: [https://revf.tistory.com/145](https://revf.tistory.com/145)
