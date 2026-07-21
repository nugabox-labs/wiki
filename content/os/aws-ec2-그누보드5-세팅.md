+++
title = "AWS EC2 그누보드5 세팅"
date = 2023-04-16T15:20:00Z
updated = 2026-07-21T06:47:00Z
categories = ["OS", "SERVER", "BACK-END"]
tags = ["LINUX", "PHP", "DB", "MySQL"]
toc = true

[extra]
source = "notion"
notion_id = "a04a336d-b99c-45b9-9bf5-7d8a38c7371a"
notion_url = "https://app.notion.com/p/AWS-EC2-5-a04a336db99c45b99bf57d8a38c7371a"
external_url = "https://github.com/gnuboard/gnuboard5"
+++

## AWS EC2 + XAMPP + 그누보드5

EC2(프리티어 t2.micro 등) → SSH → XAMPP(Apache/MariaDB) → 그누보드5.

### 1. 인스턴스·접속

1. EC2 시작: AMI·유형·키페어(.pem)·스토리지(≥30GB gp2)·보안그룹
1. 인바운드: SSH(22)·HTTP(80)·HTTPS(443)
1. SSH: `ec2-user` + 키페어 (PuTTY면 .pem→.ppk 변환)

### 2. XAMPP

그누보드5: PHP 7.2+ · MySQL/MariaDB 5.0+ → XAMPP 7.x 권장.

- 다운로드: [apachefriends](https://www.apachefriends.org/download.html) / [SourceForge 아카이브](https://sourceforge.net/projects/xampp/files/XAMPP%20Linux/)

```bash
chmod +x xampp-linux-x64-7.4.33-0-installer.run
sudo ./xampp-linux-x64-7.4.33-0-installer.run   # Developer Files: n
cd /opt/lampp && sudo ./xampp start
netstat -anp | grep LISTEN   # 80/443/3306
# PATH
echo 'PATH=$PATH:/opt/lampp/bin' >> ~/.bash_profile && source ~/.bash_profile
```

빈 계정 정리:

```sql
mysql -uroot mysql
DELETE FROM user WHERE user='';
FLUSH PRIVILEGES;
```

### 3. DB·유저 (그누보드)

```sql
CREATE DATABASE g5db CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
CREATE USER 'g5user'@'localhost' IDENTIFIED BY 'password';
GRANT ALL ON g5db.* TO 'g5user'@'localhost';
FLUSH PRIVILEGES;
```

### 4. 그누보드5 설치

- 소스: [github.com/gnuboard/gnuboard5](https://github.com/gnuboard/gnuboard5) / [sir.kr PDS](https://sir.kr/g5_pds)

```bash
cd /opt/lampp
sudo mv htdocs htdocs_org && sudo mkdir htdocs && sudo chown ec2-user:ec2-user htdocs
tar zxvf gnuboard5.*.tar.gz -C /opt/lampp/htdocs
# config.php — G5_DB_CHARSET 를 utf8mb4 로
mkdir -p /opt/lampp/htdocs/data && chmod 707 /opt/lampp/htdocs/data
```

브라우저 `http://퍼블릭IP/` → 라이선스 → DB(g5db/g5user)·관리자 정보 입력 → 설치 완료.
