+++
title = "Hyperledger Indy SDK Docs"
date = 2024-01-29T01:37:00Z
updated = 2026-07-21T06:47:00Z
categories = ["TECH"]
tags = ["DID", "BLOCKCHAIN"]
toc = true

[extra]
source = "notion"
notion_id = "5d940e41-107d-4163-bcd8-2e1471c8a304"
notion_url = "https://app.notion.com/p/Hyperledger-Indy-SDK-Docs-5d940e41107d4163bcd82e1471c8a304"
+++

SSI·검증가능 credential용 Indy SDK 입문.

## Walkthrough 흐름 (Alice 시나리오)

1. Trust Anchor 자격: Faber·Acme·Thrift·Government (Steward NYM 기반)
1. Indy Nodes Pool 연결
1. Steward Verinym 소유권
1. Steward가 기관 onboarding (connection + Verinym)
1. Credential Schema / Definition 설정
1. Alice: Transcript 발급 → 취업(Acme) → 대출(Thrift) → 퇴사·해지

기관 connection 요약: DID 생성 → NYM 기록 → nonce connection request/response → anon\_crypt/decrypt.

Indy SDK 핵심: Revocation · Wallets

## Revocation

- **누산기(accumulator)**: 해지되지 않은 credential 요소의 곱. 해지=요소 제거(나누기)
- **tails file**: 공개 고정 이진(거대 소수 요소 배열). credential마다 인덱스
- 사전: schema → credential definition → revocation registry(+tails URI/해시) → 누산기 갱신 txn
- proof = primary + **proof of non-revocation**(private×witness로 누산기 도출, ID 비노출)
- 누산기 변경 시 **witness delta**로 조정(prover만 tails 필요). issuer는 연락 없이 일괄 해지·복구 가능

## Wallets

기본 구현: 강화 SQLCipher(HMAC-SHA256, PBKDF2 100K/10, page 2K).

credential JSON:

```json
{"key": "<passphrase>", "rekey": "<new>"}
```

- key 생략/`""` → 비암호 SQLite3
- rekey로 암호 추가·제거·회전(신규 지갑 생성 시 rekey 오류)

플랫폼: Ubuntu / Mac / Windows / RHEL / Android(LibIndy·Libnullpay)

## Ubuntu 16.04

- Rust·rustup 설치
- 의존성:

```bash
apt-get update && apt-get install -y build-essential pkg-config cmake \
  libssl-dev libsqlite3-dev libzmq3-dev libncursesw5-dev
```

- libsodium 1.0.14 소스 빌드(apt 미지원):

```bash
cd /tmp && curl https://download.libsodium.org/libsodium/releases/old/libsodium-1.0.14.tar.gz | tar -xz
cd /tmp/libsodium-1.0.14 && ./configure --disable-shared && make && make install
```

- libindy:

```bash
git clone https://github.com/hyperledger/indy-sdk.git
cd indy-sdk/libindy && cargo build   # 정적 sodium: --features sodium_static
RUST_TEST_THREADS=1 cargo test       # Docker 풀 사용 시 TEST_POOL_IP=...
```

- indy-cli(선택): `cd cli && RUSTFLAGS=" -L ../libindy/target/debug" cargo build`
- `LD_LIBRARY_PATH`에 libindy target 경로 추가 후 `ldconfig`

## Mac

자동화: `libindy/mac.build.sh`

수동: brew(pkg-config, libsodium<1.0.15 URL formula, automake, autoconf, cmake, openssl, zeromq) → env(`PKG_CONFIG_ALLOW_CROSS`, `OPENSSL_DIR` Cellar) → `cargo build` → `LIBRARY_PATH`/`DYLD_LIBRARY_PATH`.

ulimit -n 부족 시 전체 `cargo test` IOError 가능.

## Windows / RHEL / Android

각 플랫폼 가이드 참조(생략 유지).

Indy SDK 디자인 문서 인덱스:

- 001 Indy CLI
- 002 Anoncreds
- 003 Wallet Storage
- 004 Payment Interface
- 005 DKMS
- 006 CLI plugins
- 007 CLI Payments
- 008 State Proof pluggable parsing
- 009 Wallet Export/Import
- 010 CLI Wallet Export/Import
- 011 Wallet Query Language

사전: [MAINTAINERS](https://github.com/hyperledger/indy-sdk/blob/master/MAINTAINERS.md)

## Release Workflow

구성: Libindy · wrappers(Python/Java/ObjC/.Net) · Indy CLI

채널: master(개발) · rc · stable(rc 태그)

- 소비자는 master 빌드 비권장(indy-node stable과 불일치 가능)
- 버전 SemVer `{major}.{minor}.{patch}` · RC=`rcN` · master=`stable+build`
- 흐름: fork PR→master CI→merge CD→rc 분기·버전 bump→rc CD·승인→stable 이동·태그→rc→master merge

## Signing Commits (DCO)

```bash
git commit -s -m "msg"
git log --show-signature
# 이전 커밋: rebase -i 후 각 pick 다음
# exec git commit --amend --no-edit -s
```

## Test Design

수락: 기능·설치성·상호운용·문서. High→Alpha / +Medium→Beta / +Low→Production.

Ubuntu 설치성: pool 기동 → `ubuntu_acceptance.dockerfile` 빌드 → Java/Python sample 실행.
