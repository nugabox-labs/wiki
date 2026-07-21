+++
title = "맥 명령어 모음 (root 접근/폴더 숨기기/정렬기본값)"
date = 2021-08-10T07:04:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS"]
tags = ["MACOS"]
toc = true

[extra]
source = "notion"
notion_id = "cf997fce-d8ba-4606-9eb9-1980c0079c50"
notion_url = "https://app.notion.com/p/root-cf997fced8ba46069eb91980c0079c50"
+++

## root 접근하기

**초기 root 비밀번호 생성**

```bash
sudo -s
passwd root      # 비밀번호 설정
exit
su -             # root 비밀번호 입력하여 접근
```

**root 비밀번호 분실 시**

```bash
sudo passwd root
```

**SSH/FTP에서 root로 바로 접근 안 될 때** (시놀로지 등 보안 강화로 직접 로그인 차단된 경우)

```bash
sudo -i -u root
```

## 폴더 숨기기/해제

```bash
chflags hidden 폴더명     # 숨기기
chflags nohidden 폴더명   # 해제
```

- 숨김파일 보기 단축키: `Cmd + Shift + .`

## 폴더 정렬 기본값 세팅

- Finder는 폴더 정렬 방식을 `.DS_Store` 파일에 저장. 이 파일이 있으면 "기본값으로 사용" 설정을 바꿔도 적용 안 됨 → 먼저 삭제 필요

```bash
rm .DS_Store                                  # 현재 폴더만
find . -name ".DS_Store" -depth -exec rm {} \;  # 하위 폴더 전체
```

1. 터미널에서 홈 디렉토리로 이동 후 위 find 명령 실행
1. Finder에서 `Cmd + J` → 원하는 정렬 방식 선택 후 "기본값으로 설정" 클릭
