# prod: notion-sync(Node) -> hwaro build(공식 이미지) -> nginx 정적 서빙.
# NOTION_TOKEN/NOTION_DB_ID는 "sync" 스테이지에서만 ARG/ENV로 존재하며,
# 이후 스테이지는 그 결과물(content/)만 COPY --from으로 넘겨받으므로
# 최종 이미지 레이어에는 토큰이 남지 않는다.

FROM node:20-alpine AS sync
WORKDIR /site
COPY package.json package-lock.json ./
RUN npm ci --omit=dev
COPY scripts ./scripts
COPY content ./content
ARG NOTION_TOKEN
ARG NOTION_DB_ID
ENV NOTION_TOKEN=${NOTION_TOKEN}
ENV NOTION_DB_ID=${NOTION_DB_ID}
RUN npm run sync

FROM ghcr.io/hahwul/hwaro:latest AS build
WORKDIR /site
COPY config.toml ./
COPY templates ./templates
COPY static ./static
COPY archetypes ./archetypes
COPY --from=sync /site/content ./content
RUN hwaro build --minify -o public

FROM nginx:alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /site/public /usr/share/nginx/html
EXPOSE 80
