+++
title = "PHP 파일 입출력 함수"
date = 2019-03-14T06:29:00Z
updated = 2026-07-21T06:47:00Z
categories = ["BACK-END"]
tags = ["PHP"]
toc = true

[extra]
source = "notion"
notion_id = "c60b6ad6-0337-4c3c-9b7a-0b8bdafcd67f"
notion_url = "https://app.notion.com/p/PHP-c60b6ad603374c3c9b7a0b8bdafcd67f"
+++

## 파일 읽기/쓰기

```php
$file = './readme.txt';
echo file_get_contents($file);              // 파일 읽어서 문자열 리턴
file_put_contents($file, 'coding everybody'); // 문자열을 파일에 저장

// 네트워크로 데이터 읽어오기
$homepage = file_get_contents('http://php.net/manual/en/function.file-get-contents.php');
```

## 파일 상태 확인

```php
file_exists($filename);    // 존재 여부 (t/f)
is_readable($filename);    // 읽기 가능 여부
is_writable($filename);    // 쓰기 가능 여부
```

## 디렉토리 제어

```php
getcwd();                      // 현재 디렉토리
chdir('../');                  // 디렉토리 변경
scandir($dir, 1);              // 디렉토리 탐색(정렬 방법 지정)

mkdir("jang", 0700);           // 디렉토리 1개 생성
mkdir("jang/1/2/3", 0700, true); // 하위 디렉토리까지 한번에 생성(recursive)
```
