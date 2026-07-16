# Changelog

모든 주목할 만한 변경사항을 이 파일에 기록한다. [Semantic Versioning](https://semver.org/lang/ko/)을 따른다.

## v0.3.0 - 2026-07-17

### Added
- `scripts/notion-sync.mjs`: `@notionhq/client` v5(`dataSources.query`, Notion-Version 2025-09-03 데이터소스 모델)로 DEV-WIKI를 동기화.
- `배포` 체크박스 == true인 페이지만 조회, `이름/카테고리/태그/PublishDate/ModifyDate/버전 정보/관련 URL`을 front matter(title/categories/tags/date/updated/extra.version/extra.external_url)로 매핑.
- 직접 작성한 Notion 블록 → Markdown 컨버터(문단, H1-3, 리스트/할일, 코드, 인용, 콜아웃→admonition, 이미지, 구분선, 표, 북마크). Notion 호스팅 이미지(만료되는 서명 URL)는 `static/notion-assets/`로 다운로드해 고정 경로로 치환.
- reconciliation: `extra.source = "notion"` 마커가 있는 기존 산출물 중 더 이상 대상이 아니거나 경로가 바뀐 파일/에셋을 삭제. 마커 없는 수기 문서는 보존.
- 카테고리 디렉터리에 `_index.md`가 없으면 최소 섹션 인덱스를 자동 생성.
- 환경변수 누락/Notion 인증 실패 시 명확한 한국어 오류 메시지와 함께 non-zero exit.

## v0.2.0 - 2026-07-17

### Added
- `hwaro init --scaffold docs` (Hwaro v0.17.1, `ghcr.io/hahwul/hwaro:latest`)로 사이트 스캐폴딩.
- `config.toml`: 사이트명 NUGAWIKI, 태그라인 "기록되지 않은 것은 기억되지 않는다", `categories`/`tags` taxonomy.
- alder 예시([hwaro-examples](https://github.com/hahwul/hwaro-examples))를 참고해 accent 컬러를 그린 계열로, 헤딩 폰트를 JetBrains Mono로 재구성한 다크/라이트 테마.
- 홈페이지, 내비게이션, favicon을 NUGAWIKI에 맞게 교체.

## v0.1.0 - 2026-07-17

### Added
- 저장소 초기화: README, .gitignore, package.json, AGENTS.md.
