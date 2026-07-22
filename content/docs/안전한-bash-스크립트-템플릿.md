+++
title = "안전한 Bash 스크립트 템플릿"
date = 2022-10-07T05:50:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "DEV-OPS", "TECH"]
tags = ["LINUX", "BASH", "TIP"]
toc = true

[extra]
source = "notion"
notion_id = "99d6e8d1-5bb9-4d68-8f57-01e09631caec"
notion_url = "https://app.notion.com/p/Bash-99d6e8d15bb94d688f5701e09631caec"
external_url = "https://velog.io/@roeniss/%EA%B0%84%EA%B2%B0%ED%95%98%EA%B3%A0-%EC%95%88%EC%A0%84%ED%95%9C-Bash-%EC%8A%A4%ED%81%AC%EB%A6%BD%ED%8A%B8-%ED%85%9C%ED%94%8C%EB%A6%BF"
+++

```bash
#!/usr/bin/env bash
set -Eeuo pipefail
trap cleanup SIGINT SIGTERM ERR EXIT

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

usage() {
  cat <<EOF
Usage: $(basename "${BASH_SOURCE[0]}") [-h] [-v] [-f] -p param_value arg1 [arg2...]
EOF
  exit
}

cleanup() {
  trap - SIGINT SIGTERM ERR EXIT
}

setup_colors() {
  if [[ -t 2 ]] && [[ -z "${NO_COLOR-}" ]] && [[ "${TERM-}" != "dumb" ]]; then
    NOFORMAT='\033[0m' RED='\033[0;31m' GREEN='\033[0;32m'
  else
    NOFORMAT='' RED='' GREEN=''
  fi
}

msg() { echo >&2 -e "${1-}"; }
die() { msg "$1"; exit "${2-1}"; }

parse_params() {
  flag=0; param=''
  while :; do
    case "${1-}" in
      -h|--help) usage ;;
      -v|--verbose) set -x ;;
      --no-color) NO_COLOR=1 ;;
      -f|--flag) flag=1 ;;
      -p|--param) param="${2-}"; shift ;;
      -?*) die "Unknown option: $1" ;;
      *) break ;;
    esac
    shift
  done
  args=("$@")
  [[ -z "${param-}" ]] && die "Missing required parameter: param"
  [[ ${#args[@]} -eq 0 ]] && die "Missing script arguments"
}

parse_params "$@"
setup_colors
# script logic here
```

핵심: `set -Eeuo pipefail`, `trap cleanup`, `script_dir`, stderr용 `msg()`.
