#!/usr/bin/env node
// 카테고리 폴더(content/os 등)에 있던 Notion 동기화 글을 content/docs/로 옮긴다.
// 구 URL 리다이렉트는 nginx(nginx.conf)가 처리한다. 일회성 마이그레이션.

import { access, mkdir, readdir, readFile, rename, writeFile } from "node:fs/promises";
import path from "node:path";

const ROOT = process.cwd();
const CONTENT = path.join(ROOT, "content");
const DOCS = path.join(CONTENT, "docs");
const SOURCE_DIRS = ["os", "server", "back-end", "front-end", "dev-ops", "tech"];

async function exists(p) {
  try {
    await access(p);
    return true;
  } catch {
    return false;
  }
}

async function main() {
  await mkdir(DOCS, { recursive: true });

  const indexMd = `+++
title = "docs"
description = "위키 문서"
sort_by = "date"
weight = 50
paginate = 20

[extra]
source = "docs-section"
+++
`;
  await writeFile(path.join(DOCS, "_index.md"), indexMd, "utf8");

  const used = new Set();
  let moved = 0;
  let skipped = 0;

  for (const dir of SOURCE_DIRS) {
    const absDir = path.join(CONTENT, dir);
    let entries;
    try {
      entries = await readdir(absDir);
    } catch {
      continue;
    }
    for (const name of entries) {
      if (!name.endsWith(".md") || name === "_index.md") continue;
      const src = path.join(absDir, name);
      const content = await readFile(src, "utf8");
      if (!/source\s*=\s*"notion"/.test(content)) {
        skipped++;
        continue;
      }

      const oldSlug = name.replace(/\.md$/, "");
      let destName = name;
      if (used.has(destName) || (await exists(path.join(DOCS, destName)))) {
        const idMatch = content.match(/notion_id\s*=\s*"([^"]+)"/);
        const suffix = (idMatch?.[1] || "dup").replace(/-/g, "").slice(0, 8);
        destName = `${oldSlug}-${suffix}.md`;
      }
      used.add(destName);
      const dest = path.join(DOCS, destName);

      await rename(src, dest);
      moved++;
      if (destName !== name) {
        console.log(`[migrate-to-docs] 충돌 회피: ${dir}/${name} → docs/${destName}`);
      }
    }
  }

  console.log(`[migrate-to-docs] 완료: ${moved}건 이동, ${skipped}건 건너뜀.`);
}

main().catch((err) => {
  console.error("[migrate-to-docs] 실패:", err.message);
  process.exit(1);
});
