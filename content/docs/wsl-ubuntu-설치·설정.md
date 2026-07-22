+++
title = "WSL Ubuntu 설치·설정"
date = 2022-08-18T16:13:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS"]
tags = ["WINDOWS", "LINUX"]
toc = true

[extra]
source = "notion"
notion_id = "3038f4d4-b90e-4dc8-97c6-ea71cc3fca38"
notion_url = "https://app.notion.com/p/WSL-Ubuntu-3038f4d4b90e4dc897c6ea71cc3fca38"
+++

## WSL 설치

- Windows 10 2004+(빌드 19041+)

```powershell
wsl --install
```

- Ubuntu는 Microsoft Store에서 설치

## Ubuntu 사용자·비밀번호

```powershell
ubuntu config --default-user root
passwd <사용자명>
passwd root
ubuntu config --default-user <사용자명>
```

## 패키지

```bash
sudo apt update && sudo apt upgrade
sudo apt install openssh-server openjdk-8-jre-headless openjdk-8-jdk-headless
sudo service ssh start
```

## 포트포워딩 (WSL2)

WSL2는 가상 이더넷(예: 172.22.192.x) 경유. 로컬↔WSL은 그 IP로 접근.

### 로컬 → WSL

```bash
netstat -ano | grep "LISTEN "
```

`wsl_ports.ps1` (관리자 PowerShell):

```powershell
If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
  $arguments = "& '" + $myinvocation.mycommand.definition + "'"
  Start-Process powershell -Verb runAs -ArgumentList $arguments
  Break
}
$remoteport = bash.exe -c "ifconfig eth0 | grep 'inet '"
$found = $remoteport -match '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}'
if ( $found ) { $remoteport = $matches[0] }
else { Write-Output "WSL 2 IP not found"; exit }
$ports = @(3000, 3001, 5000, 5500, 19000, 19002, 19006)
Invoke-Expression "netsh interface portproxy reset"
foreach ($port in $ports) {
  Invoke-Expression "netsh interface portproxy add v4tov4 listenport=$port connectport=$port connectaddress=$remoteport"
}
Invoke-Expression "netsh interface portproxy show v4tov4"
```

```powershell
.\wsl_ports.ps1
# 오류 시: Set-ExecutionPolicy RemoteSigned
```

부팅 자동 실행: 작업 스케줄러에 등록.

### 외부 → 로컬

```powershell
netstat -ano | find "LISTEN"
```

Windows 방화벽 → 고급 → 인바운드 규칙 → 새 규칙(TCP 포트).
