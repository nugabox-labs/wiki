#!/usr/bin/env bash
# NUGAWIKI 배포/개발 라이프사이클 스크립트.
#
#   ./compose.sh up            운영(prod) 컨테이너 빌드 + 기동 (docker-compose.yml)
#   ./compose.sh down          운영 컨테이너 정지 + 제거
#   ./compose.sh --dev up      개발(dev) 컨테이너 빌드 + 기동, 바인드 마운트 + 라이브 리로드 (docker-compose.dev.yml)
#   ./compose.sh --dev down    개발 컨테이너 정지 + 제거
#
# 운영 모드는 빌드된 이미지 기반으로 동작하며, 코드/콘텐츠 변경 후에는
# `./compose.sh down && ./compose.sh up`으로 재빌드해야 반영된다.
# 개발 모드는 소스를 바인드 마운트하므로 저장 즉시 반영된다.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

usage() {
  cat <<'EOF'
사용법: ./compose.sh [--dev] up|down

  up            운영 컨테이너 빌드 + 기동 (docker-compose.yml)
  down          운영 컨테이너 정지 + 제거
  --dev up      개발 컨테이너 빌드 + 기동, 라이브 리로드 (docker-compose.dev.yml)
  --dev down    개발 컨테이너 정지 + 제거
EOF
}

log() { echo "[compose.sh] $*"; }
err() { echo "[compose.sh] $*" >&2; }

MODE="prod"
ACTION=""

for arg in "$@"; do
  case "$arg" in
    --dev)
      MODE="dev"
      ;;
    up|down)
      if [[ -n "$ACTION" ]]; then
        err "up/down은 한 번만 지정할 수 있습니다."
        usage
        exit 1
      fi
      ACTION="$arg"
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      err "알 수 없는 인자: $arg"
      usage
      exit 1
      ;;
  esac
done

if [[ -z "$ACTION" ]]; then
  err "up 또는 down 중 하나를 지정해야 합니다."
  usage
  exit 1
fi

if [[ "$MODE" == "dev" ]]; then
  COMPOSE_FILE="docker-compose.dev.yml"
else
  COMPOSE_FILE="docker-compose.yml"
fi

if [[ ! -f "$COMPOSE_FILE" ]]; then
  err "$COMPOSE_FILE 파일을 찾을 수 없습니다."
  exit 1
fi

if ! command -v docker >/dev/null 2>&1; then
  err "docker 명령을 찾을 수 없습니다. Docker Desktop이 설치·실행 중인지 확인하세요."
  exit 1
fi

if [[ "$ACTION" == "up" && ! -f .env ]]; then
  err "경고: .env 파일이 없습니다. NOTION_TOKEN/NOTION_DB_ID 없이 진행하면 notion-sync가 실패하거나(운영) 건너뜁니다(개발)."
  err "  cp .env.example .env 로 만든 뒤 값을 채워주세요."
fi

log "모드=$MODE 액션=$ACTION ($COMPOSE_FILE)"

if [[ "$ACTION" == "up" ]]; then
  docker compose -f "$COMPOSE_FILE" up -d --build
  log "기동 완료. 로그 확인: docker compose -f $COMPOSE_FILE logs -f"
else
  docker compose -f "$COMPOSE_FILE" down
  log "정지·제거 완료."
fi
