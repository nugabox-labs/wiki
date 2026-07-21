+++
title = "Indy SDK 빌드 및 설치"
date = 2022-03-31T02:58:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "DEV-OPS", "TECH"]
tags = ["BLOCKCHAIN", "DID", "LINUX", "BASH"]
toc = true

[extra]
source = "notion"
notion_id = "0bcc58b8-b904-4fa0-9326-82298e4b8c20"
notion_url = "https://app.notion.com/p/Indy-SDK-0bcc58b8b9044fa0932682298e4b8c20"
external_url = "http://trvoid.blogspot.com/2020/05/indy-sdk.html"
+++

## Indy SDK 빌드·설치 (Ubuntu)

참고: [indy-sdk Ubuntu build](https://github.com/hyperledger/indy-sdk/blob/master/docs/build-guides/ubuntu-build.md)

```bash
# C/Rust
sudo apt-get install -y make g++
curl https://sh.rustup.rs -sSf | sh
rustc --version

# 의존성
sudo apt-get update && sudo apt-get install -y \
  build-essential pkg-config cmake libssl-dev \
  libsqlite3-dev libzmq3-dev libncursesw5-dev

# libsodium (apt 미제공 시)
cd /tmp && \
  curl https://download.libsodium.org/libsodium/releases/old/unsupported/libsodium-1.0.14.tar.gz | tar -xz && \
  cd /tmp/libsodium-1.0.14 && ./configure --disable-shared && make && sudo make install && \
  rm -rf /tmp/libsodium-1.0.14

# libindy
cd $HOME && git clone https://github.com/hyperledger/indy-sdk.git
cd ./indy-sdk/libindy && cargo build

# 로컬 풀 (Docker)
cd $HOME/indy-sdk
docker build -f ci/indy-pool.dockerfile -t indy_pool .
docker run -itd -p 9701-9708:9701-9708 indy_pool

# 테스트
cd $HOME/indy-sdk/libindy
RUST_TEST_THREADS=1 cargo test
# RUST_TEST_THREADS=1 TEST_POOL_IP=10.0.0.2 cargo test

# indy-cli
cd $HOME/indy-sdk/cli/
RUSTFLAGS=" -L ../libindy/target/debug" cargo build
echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/indy-sdk/libindy/target/debug" >> ~/.bashrc
sudo ldconfig && source ~/.bashrc
./target/debug/indy-cli
```
