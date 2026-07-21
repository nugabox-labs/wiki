+++
title = "PhpStorm 맥 단축키"
date = "2019-04-09T06:54:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["BACK-END"]
tags = ["PHP"]
toc = true

[extra]
source = "notion"
notion_id = "9106c283-64e6-449c-8489-f7538a19e1cf"
notion_url = "https://app.notion.com/p/PhpStorm-9106c28364e6449c8489f7538a19e1cf"
+++

## 기호: ⌘command ⌃control ⇧shift ⌥option(alt) ⎋esc ⏎return ⇥tab

## 파일/이동

```javascript
⌘O        클래스 찾기
⌘⇧O       파일 찾기 (⇧⇧도 유사)
⌘E        최근 파일
⌘L        지정 라인으로 이동
⌘B        메소드 선언으로 이동
⌘⌥B       메소드 구현으로 이동
⌘F12      현재 클래스 필드/메소드 목록
⌘⇧[ / ]   에디터 탭 좌/우 이동
```

## Layout

```javascript
⌘1  Project view    ⌘3  Find view
⌘4  Run view        ⌘9  Version Control
⇧⎋  현재 Layout 닫기
```

## 리팩터

```javascript
⌘⌥M  메서드 분리     ⌘⌥C  상수 분리
⌘⌥F  필드 분리       ⌘⌥V  지역변수 분리
⇧F6  rename         ⌘F6  시그니처 변경
```

## 편집

```javascript
⌥⏎        Quick fix
⌘Del      한 줄 삭제
⌘D        한 줄 복사
⌘/        줄 주석      ⌘⌥/  블록 주석
⌥↑ / ⌥↓   선택 영역 확장/축소
⌘⇧↑ / ↓   라인 상하 이동(포맷팅 없이) / ⇧⌥↑↓도 동일
⌘⇧8       column selection mode
⌘⇧U       대소문자 토글
⌘⇧F       전체 문자열 검색
⌥⌘L       코드 포맷팅(Reformat)
⌃⇧J       라인 합치기
⌘⇧V       최근 복사 목록
⌘,        환경설정 / ⌘;  프로젝트 설정
```

## 실행/디버깅

```javascript
⌘F9   컴파일          ⌘R   실행(재실행)
⌘F2   실행 종료        ⌃R   최근 실행 다시
⌃⌥R   커서 위치 실행(테스트 메소드 실행 등)   ⌃D/⌃⌥D  디버그 모드 동일
```

## 버전관리(VCS)

```javascript
⌘K     커밋 (⌃⏎로 확정)
⌥⇧N    Task 추가        ⌥⇧C  Recent Changes
⌃V     Local History (SVN 없이도 이력 확인)
```

## Live Template(코드 스니펫) 만들기

- 코드 드래그 선택 → Tools > Save as Live Template → 단축키/설명 지정 (환경설정 > Live Templates에서도 편집 가능)
