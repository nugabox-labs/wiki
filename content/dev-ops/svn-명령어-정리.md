+++
title = "SVN 명령어 정리"
date = "2023-03-11T13:27:00.000Z"
updated = "2026-07-21T02:37:00.000Z"
categories = ["DEV-OPS"]
tags = ["GIT/SVN"]
toc = true

[extra]
source = "notion"
notion_id = "6d4344d2-27c8-4e26-9895-0435f1a4202d"
notion_url = "https://app.notion.com/p/SVN-6d4344d227c84e2698950435f1a4202d"
+++

## SVN 명령어

```bash
svn co [SVNURL] [체크아웃 대상]           # checkout
svn up                                     # update
svn commit [파일명] -m "메시지"            # commit
svn add [파일명]                           # 신규 파일 추가
svn delete [파일명]                        # 관리 목록에서 삭제
svn export [SVNURL] [저장경로]             # 원본 파일만 받기
svn export [URL] [저장경로] -r [리비전]    # 특정 리비전만 export
svn import [올릴대상] [SVNURL] -m "메시지" # import
svn --version                              # 버전 확인
svn status                                 # 변경 상태 확인
svn info                                   # repository URL 확인
svn log                                    # 로그 확인 (-v 옵션으로 상세)
svn blame [파일명]                         # 라인별 수정자 확인
```
