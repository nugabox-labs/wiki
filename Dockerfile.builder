# 운영 빌더: notion-sync + hwaro build를 scripts/build-loop.sh로
# 주기적으로 반복 실행해 public/ 볼륨을 최신 상태로 유지한다.
# NOTION_TOKEN/NOTION_DB_ID는 컨테이너 런타임 환경변수로만 존재하고
# 이미지 레이어에는 전혀 기록되지 않는다(빌드 인자로 넘기지 않음).
# nginx는 별도 서비스에서 이 볼륨을 그대로 서빙하므로, 이 이미지를
# 다시 빌드하지 않아도 Notion 콘텐츠는 다음 주기에 자동 반영된다.
# (templates/static/config.toml 변경은 이 이미지를 재빌드해야 반영됨.)

FROM ghcr.io/hahwul/hwaro:latest

RUN apt-get update \
    && apt-get install -y --no-install-recommends nodejs npm \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /site
COPY package.json package-lock.json ./
RUN npm ci --omit=dev
COPY scripts ./scripts
COPY config.toml ./
COPY templates ./templates
COPY static ./static
COPY archetypes ./archetypes
COPY content ./content
RUN chmod +x ./scripts/build-loop.sh

ENTRYPOINT ["./scripts/build-loop.sh"]
