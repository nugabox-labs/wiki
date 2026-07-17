# 운영 빌더: notion-sync + hwaro build를 scripts/build-loop.sh로
# 주기적으로 반복 실행해 public/ 볼륨을 최신 상태로 유지한다.
# NOTION_TOKEN/NOTION_DB_ID는 컨테이너 런타임 환경변수로만 존재하고
# 이미지 레이어에는 전혀 기록되지 않는다(빌드 인자로 넘기지 않음).
# nginx는 별도 서비스에서 이 볼륨을 그대로 서빙하므로, 이 이미지를
# 다시 빌드하지 않아도 Notion 콘텐츠는 다음 주기에 자동 반영된다.
# (templates/static/config.toml 변경은 이 이미지를 재빌드해야 반영됨.)
#
# Node/npm은 apt(nodejs/npm 패키지)로 설치하지 않는다 — Debian에서
# 이 패키지들은 eslint/webpack 등 수천 개의 무관한 node-* 패키지를
# 함께 끌어와 저사양 호스트에서 극도로 느려진다. 대신 공식
# node:20-slim(Debian 기반, glibc 호환) 이미지에서 바이너리만 복사한다.

FROM node:20-slim AS node
FROM ghcr.io/hahwul/hwaro:latest

COPY --from=node /usr/local/bin/node /usr/local/bin/node
COPY --from=node /usr/local/lib/node_modules /usr/local/lib/node_modules
RUN ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm \
    && ln -s /usr/local/lib/node_modules/npm/bin/npx-cli.js /usr/local/bin/npx

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
