+++
title = "Hyperledger Indy Node Docs"
date = 2024-01-29T01:31:00Z
updated = 2026-07-21T06:47:00Z
categories = ["TECH"]
tags = ["DID", "BLOCKCHAIN"]
toc = true

[extra]
source = "notion"
notion_id = "d473c7b8-444b-4e03-a28b-14a390786d46"
notion_url = "https://app.notion.com/p/Hyperledger-Indy-Node-Docs-d473c7b8444b4e03a28b14a390786d46"
+++

## 개요

원장별 txn 정의. 제네시스로 초기 NODE/NYM 등 시드. 공통 구조: 메타·서명·payload.

## Domain 원장

- `NYM` · `ATTRIB` · `SCHEMA` · `CLAIM_DEF`
- `REVOC_REG_DEF` · `REVOC_REG_ENTRY`
- `TXN_AUTHOR_AGREEMENT` · `TXN_AUTHOR_AGREEMENT_AML`

## Pool 원장

- `NODE` (노드 추가/갱신)

## Config 원장

- `POOL_UPGRADE` · `POOL_CONFIG`
- `AUTH_RULE` · `AUTH_RULES` · `GET_AUTH_RULE`
- `NODE_UPGRADE`

## Actions

원장 기록 외 액션 txn.

클라이언트 Write/Read/Action request·reply 형식.

## 공통

Request 공통 헤더·서명 · Write 전용 필드 · Write/Read reply 구조(GET\_TXN 예외).

## Write

`NYM` · `ATTRIB` · `SCHEMA` · `CLAIM_DEF` · `NODE` · `POOL_UPGRADE` · `POOL_CONFIG` · `AUTH_RULE`/`AUTH_RULES` · `REVOC_REG_DEF`/`REVOC_REG_ENTRY` · `TRANSACTION_AUTHOR_AGREEMENT`(+AML) · `NODE_UPGRADE`

## Read

`GET_NYM` · `GET_ATTR` · `GET_SCHEMA` · `GET_CLAIM_DEF` · `GET_TXN` · `GET_REVOC_REG`/`_DEF`/`_DELTA` · `GET_AUTH_RULE` · `GET_TXN_AUTHOR_AGREEMENT`(+AML)

## Action

`POOL_RESTART` 등(원장 미기록 제어).

Indy SDK 일반 작업 How-to 요약. 순서대로 진행.

1. Write a DID and Query Its Verkey
1. Rotate a Key
1. Save a Schema and Cred Def
1. Issue a Credential
1. Negotiate a Proof
1. Send a Secure Message

## 1. Write DID / Query Verkey

- 전제: indy 개발 VM
- Step1: 언어별 템플릿을 `write_did.EXT`로 저장
- Step2: genesis transactions + identity wallet 생성
- Step3: steward(seed)·trust anchor DID를 wallet에 채움 (steward는 genesis와 동일 seed)
- Step4: trust anchor DID/verkey를 원장에 기록
- Step5: 원장 쿼리로 확인
- Step6: 데모 실행

## 2. Rotate a Key

- Write DID 결과 위에 진행
- `replace_keys_start` → 원장 업데이트(서명=기존 key) → `replace_keys_apply`로 wallet 확정
- 이후 원장에서 verkey 재조회

## 3. Save Schema and Cred Def

- Schema 예: name/version + `attrNames`(age, sex, height, name)
- Credential Definition: schema 참조, 발급자(trust anchor), 서명방식 CL, 해지 옵션
- steward가 schema를 원장에 제출하는 흐름 확인

## 4. Issue a Credential

- holder identity + link secret 생성
- 협상: offer → request(link secret 결합) → credential 발급
- 레거시 용어 `claim` ≈ `credential`

## 5. Negotiate a Proof

- verifier가 proof request(JSON) 전송
- holder가 wallet에서 후보 credential 검색 → prover로 proof 생성
- verifier가 `verifier_verify_proof`로 검증

## 6. Send a Secure Message

- 명령: `read` / `prep` / `quit`
- init: wallet·DID·verkey 생성 후 상대 DID/verkey 교환
- `auth_crypt`로 암호화 파일 작성 → 상대가 `auth_decrypt`로 수신
- 변조·anon\_crypt 실험 가능

`POOL_UPGRADE`로 전체 pool 자동 업그레이드(패키지 설치·마이그레이션). TRUSTEE만 송신, Config 원장·합의 필요.

## 모드

- **non-forced(기본)**: 원장 기록 후 순차 업그레이드(합의 유지). 호환 변경에 사용
- **forced**: 원장 기록 여부와 무관, 동시 업그레이드 가능. 비호환 변경 시

## NODE\_UPGRADE

각 노드가 `in_progress` → `success`/`fail` 두 번 기록(Config 원장·합의).

## node-control-tool

Ubuntu `indy-node-control`(root). 시각 도달 시: 서비스 중지 → apt 업그레이드 → 데이터 백업 → migration → 서비스 시작 → control 재시작. 실패 시 백업 복원·버전 롤백.

## Migrations

`data/migration`(Ubuntu: `data/migration/deb`). [README](https://github.com/hyperledger/indy-node/blob/master/data/migrations/README.md)

## Forced 시점

원장/state 포맷 변경(루트해시·재작성), 버전 없는 Request/Reply/Message 변경

권장: Docker. 자체망은 노드마다 설치·초기화·기동.

## 설치 (Ubuntu deb)

```bash
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CE7709D068DB5E88
sudo bash -c 'echo "deb https://repo.sovrin.org/deb xenial stable" >> /etc/apt/sources.list'
sudo apt-get update && sudo apt-get install indy-node
# 테스트: pip install indy-node (+ create_dirs.sh)
```

## 초기화

- `/etc/indy`에 `NETWORK_NAME={name}` (제네시스와 일치)
- 키: ed25519 전송 + BLS
- `/var/lib/indy/{network_name}/`에 `pool_transactions_genesis` · `domain_transactions_genesis`
- iptables 클라이언트 연결 제한 권장

## 키·테스트망

```bash
# deb
init_indy_node Alpha 0.0.0.0 9701 0.0.0.0 9702 [--seed ...]
# pip (NETWORK_NAME 설정 후)
init_indy_keys --name Alpha [--seed ...] [--force]
generate_indy_pool_transactions --nodes 4 --clients 5 --nodeNum 1 \
  [--ips 'ip1,ip2,...'] [--network=sandbox]
```

## 기동

```bash
start_indy_node Alpha 0.0.0.0 9701 0.0.0.0 9702
# 포트1: node-node / 포트2: node-client
```

로컬 4노드: `--nodeNum 1 2 3 4` 후 Node1…4를 9701-9708로 각각 기동. 원격은 `--ips`로 IP 목록 동일 지정 후 nodeNum만 다르게.

## Node 준비

1. 기존망 제네시스를 새 노드에 복사:

```
/var/lib/indy/network_name/pool_transactions_genesis
/var/lib/indy/network_name/domain_transactions_genesis
```

1. 키·별칭·포트 초기화:

```bash
sudo su - indy -c "init_indy_node NewNode 0.0.0.0 9701 0.0.0.0 9702 0000000000000000000000000NewNode"
```

1. 제네시스 확인 후 서비스 시작(최초 기동 시 제네시스를 원장에 1회만 반영):

```bash
sudo systemctl start indy-node
sudo systemctl status indy-node
sudo systemctl enable indy-node
```

## Pool에 추가

1. Trustee가 필요 시 Steward 추가(Steward만 Validator 추가, Steward당 1노드)
1. Steward로 Indy CLI `ledger node` 실행 — alias, blskey, blskey\_pop, target(Verification key→base58), IP/port, `services=VALIDATOR`
1. verkey→NYM: `TestNetworkSetup.getNymFromVerkey(...)` (indy-plenum)

## 검증

`systemctl restart indy-node` 후 catch-up 완료 확인

indy-node helper 스크립트:

- `init_indy_keys` — CurveZMQ Node 키 초기화/회전
- `init_bls_keys` — BLS·State Proof용 BLS 키 초기화/회전
- `read_ledger` — 지정 원장 트랜잭션 JSON 읽기
- `validator-info` — Node 상태 모니터링
- `generate_indy_pool_transactions` — 테스트 Pool 키·제네시스 생성
- `clear_node` — Node 데이터 전부 정리

클라이언트 포트 동시 **연결(connection)** 수 제한 권장(클라이언트 수 제한이 아님).

- open file descriptors 한도 방지
- ZeroMQ TCP별 큐로 인한 메모리 폭증 방지

root 필요.

## raw iptables

deb 설치 시 `/etc/indy/indy.env`의 `NODE_CLIENT_PORT`·`CLIENT_CONNECTIONS_LIMIT` 사용:

```bash
iptables -I INPUT -p tcp --syn --dport 9702 -m connlimit \
  --connlimit-above 500 --connlimit-mask 0 -j REJECT --reject-with tcp-reset
```

- `dport` 제한 포트 / `connlimit-above` 초과 시 TCP reset / `connlimit-mask 0` = 전체

## 스크립트

- `setup_iptables <port> <limit>`
- `setup_indy_node_iptables` — env에서 포트·limit 읽어 wrapper (`init_indy_node` 이후)

```bash
# deb
setup_indy_node_iptables
# pip
setup_iptables 9702 500
```

## Plugin Manager

indy-node는 조건 충족 시 Plugin Manager로 이벤트를 만들고, `indynotifier*` pip 패키지를 로드한다. 각 패키지는 `send_message`를 노출해야 한다.

코드: [notifier\_plugin\_manager.py](https://github.com/hyperledger/indy-plenum/blob/master/plenum/server/notifier_plugin_manager.py#L23)

### Events

- `nodeRequestSpike` → NodeRequestSuspiciousSpike
- `clusterThroughputSpike` → ClusterThroughputSuspiciousSpike
- `clusterLatencyTooHigh` → ClusterLatencyTooHigh
- `nodeUpgradeScheduled` / `nodeUpgradeComplete` / `nodeUpgradeFail`
- `poolUpgradeCancel`

## Email Plugin

전제: [localhost](http://localhost/) SMTP (`sudo apt-get install sendmail`)

```bash
echo "Subject: sendmail test" | sendmail -v youremail@example.com -f alert@noreply.com
pip3 install indynotifieremail
```

`indy_config.py`: `SpikeEventsEnabled=True`

`/etc/indy/indy.env`:

- `INDY_NOTIFIER_EMAIL_RECIPIENTS` (필수) — `user@a.com event1 event2,user2@b.com`
- `INDY_NOTIFIER_EMAIL_SENDER` (선택, 기본 `alert@noreply.com`)
- `INDY_NOTIFIER_SILENCE_TIMEOUT` (선택) — 동일 주제 메일 쿨다운(기본 1h). 업그레이드 메일은 항상 발송.

## AWS SNS Plugin

전제: SNS Topic + Sovrin Validator.

```bash
pip3 install sovrinnotifierawssns
```

자격증명: `AWS_ACCESS_KEY_ID` / `AWS_SECRET_ACCESS_KEY` 또는 `~/.aws/credentials`

리전: `AWS_DEFAULT_REGION` 또는 `~/.aws/config`

필수: `SOVRIN_NOTIFIER_AWSSNS_TOPICARN`

Validator 홈 `/home/sovrin/` — credential은 `/home/sovrin/.aws`, env는 `/home/sovrin/.sovrin/sovrin.env`에 두고 `sudo systemctl restart sovrin-node.service`.

## 브랜치

- `master` — 최신·기본 PR 대상
- `stable` — 최신 릴리즈 · hotfix는 stable+master
- `release-*` / `hotfix-*` — RC

## CI

PR마다 flake8 + 단위/통합(Jenkins `Jenkinsfile.ci`, public). 로컬: `pip install flake8 && flake8 .`

## CD·아티팩트

`Jenkinsfile.cd`(Sovrin). master=`devN`, release/hotfix=`rcN`, stable=정식.

- PyPI: 개발용 / 프로덕션은 deb
- 프로덕션: `repo.sovrin.org` xenial **stable** deb만
- 플랫폼: Ubuntu 16.04 x86\_64 · fpm 패키징 · PEP440+SemVer · `__version__.json` · `bump_version.sh` · dependency 버전 엄격([setup.py](http://setup.py/))

## Feature Release 요약

1. RC: stable→`release-X.Y.Z` · `rc-X.Y.Z.rcN`에서 bump·PR
1. Acceptance: RC 파이프라인 → PyPI rc · deb rc 채널 · 시스템테스트 → stable용 release PR(머지 전 승인)
1. Publish: PyPI X.Y.Z · stable deb · 태그 `vX.Y.Z`
1. 다음 사이클: master에 `X'.Y'.Z'.dev0` bump

Hotfix: `hotfix-X.Y.Z`, 보통 master merge 없이 stable 수정만.

## 시스템 경로 (Ubuntu)

- config: `/etc/indy`
- 데이터(원장·제네시스·키): `/var/lib/indy`
- 로그: `/var/log/indy`
- 서비스에 `/home` 사용 금지

## 다중 네트워크

- 현재망: `/etc/indy`의 `NETWORK_NAME=`
- 망별: `/var/lib/indy/{network_name}` · `/var/log/indy/{network_name}`
- 확장 config: `/etc/indy/{network_name}`

## 권한·분리

- 개인키는 서비스 유저(indy)만 읽기
- node ↔ client 폴더 공유 금지
- 클라이언트(libindy): `~/.indy_client` (유저별)
- 동일 머신에 node+client·다중 유저 client 가능

## 일반

- 큰 기능 전 design 폴더에 설계(md/PlantUML)
- 테스트 포함(TDD) · docs 갱신(특히 txn/request 형식)
- 점진 리팩터 · TODO/FIXME · Jira 티켓

## 코드 품질

- PEP 8 · flake8(CI 실패) · snake/camel · `_` private · docstring/타입 주석
- ABC·composition 선호 · 깊은 계층·`type(instance)==` 금지 · 다형성
- SoC·낮은 커플링 · 긴 함수/클래스 분해 · early return
- 콜백 대신 asyncio · Actor 모델·성능 고려

## 테스트

- TDD · 단위 테스트 · module-level fixture 지양
- 가능하면 indy-sdk 사용(불가 시 IS Jira + TODO)
- `txnPoolNodeSet` 사용(`nodeSet` deprecated)
- fixture는 conftest로 · 실서비스와 동일 폴더 구조(tmp 하위)

스크립트: [dev-setup](https://github.com/hyperledger/indy-node/tree/master/dev-setup) (현재 Ubuntu 위주)

전제: Python 3.5 · venv 권장 · pytest · libindy/libindy-crypto/libsodium 등

## Ubuntu 16.04 빠른 설정

1. `dev-setup/ubuntu` 스크립트 확보
1. `setup-dev-python.sh` → `source ~/.bashrc`
1. `setup-dev-depend-ubuntu16.sh`
1. indy-plenum·indy-node fork
1. `init-dev-project.sh <github-name> <venv-name>` → `workon <venv-name>`
1. (선택) PyCharm: 공통 venv · Project Dependencies 상호 의존 · pytest

## 의존성 요약

- Python: deadsnakes PPA / yum python3.5
- libsodium: Ubuntu16 `libsodium18` 등
- libindy-crypto·RocksDB≥5.8.8·libindy: `repo.sovrin.org` deb

## 테스트

```bash
virtualenv -p python3.5 <env> && source <env>/bin/activate
pip install -e .[tests]   # plenum·node 모두 -e
pytest .
```
