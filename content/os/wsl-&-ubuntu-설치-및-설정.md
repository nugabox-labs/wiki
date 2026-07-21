+++
title = "WSL & Ubuntu 설치 및 설정"
date = 2022-08-18T16:13:00Z
updated = 2026-07-21T02:37:00Z
categories = ["OS"]
tags = ["WINDOWS"]
toc = true

[extra]
source = "notion"
notion_id = "3038f4d4-b90e-4dc8-97c6-ea71cc3fca38"
notion_url = "https://app.notion.com/p/WSL-Ubuntu-3038f4d4b90e4dc897c6ea71cc3fca38"
+++

# 설치

## WSL 설치

- 필수: Windows 10 버전 2004 이상(빌드 19041+)

```powershell
wsl --install
```

- Ubuntu는 Microsoft Store에서 별도 설치

## Ubuntu 비밀번호 설정

```powershell
ubuntu config --default-user root
passwd <사용자명>
passwd root
ubuntu config --default-user <사용자명>
```

## Ubuntu 업데이트 및 패키지

```bash
sudo apt update && sudo apt upgrade

sudo apt install openssh-server
sudo service ssh start

sudo apt install openjdk-8-jre-headless
sudo apt install openjdk-8-jdk-headless
```

# 포트포워딩

WSL2는 이더넷 가상 어댑터로 연결되어 있어 로컬↔WSL 간 접근에는 WSL 어댑터 주소(예: 172.22.192.xx)를 거쳐야 함.

## 로컬 → WSL 내부

1. Linux에서 열린 포트 확인

```bash
netstat -ano | grep "LISTEN "
```

1. `wsl_ports.ps1`로 저장

```powershell
If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {   
  $arguments = "& '" + $myinvocation.mycommand.definition + "'"
  Start-Process powershell -Verb runAs -ArgumentList $arguments
  Break
}

$remoteport = bash.exe -c "ifconfig eth0 | grep 'inet '"
$found = $remoteport -match '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}';

if ( $found ) {
  $remoteport = $matches[0];
}
else {
  Write-Output "The Script Exited, the ip address of WSL 2 cannot be found";
  exit;
}

$ports = @(3000, 3001, 5000, 5500, 19000, 19002, 19006);  # 포워딩할 포트 추가/제거

Invoke-Expression "netsh interface portproxy reset";

for ( $i = 0; $i -lt $ports.length; $i++ ) {
  $port = $ports[$i];
  Invoke-Expression "netsh interface portproxy add v4tov4 listenport=$port connectport=$port connectaddress=$remoteport";
}

Invoke-Expression "netsh interface portproxy show v4tov4";
```

1. 관리자 권한 PowerShell에서 실행

```powershell
.\wsl_ports.ps1
# 실행 오류 시: Set-ExecutionPolicy RemoteSigned
```

1. 성공하면 Windows 작업 스케줄러에 등록해 부팅 시 자동 실행

## 외부 → 로컬

1. 로컬 열린 포트 확인

```powershell
netstat -ano | find "LISTEN"
```

1. Windows 방화벽 > 고급 보안이 포함된 Windows 방화벽 > 인바운드 규칙 > 새 규칙으로 TCP 포트 열기
