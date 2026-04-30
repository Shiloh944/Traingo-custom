# Traingo Custom

개인 사용을 위해 수정한 SRT/KTX 예매 보조 도구입니다.

이 저장소는 [lapis42/srtgo](https://github.com/lapis42/srtgo)를 기반으로 한 개인 수정본입니다.

## 변경 사항

- Windows 실행용 `run.bat` 추가
- 텔레그램 설정 입력 방식을 일반 터미널 입력으로 변경
- 메뉴에 로그인/텔레그램/카드 설정 상태 표시 추가
- 예매 대기 중 `Ctrl-C` 취소 처리 개선
- 열차 선택 화면의 긴 안내 문구로 인한 화면 깨짐 완화

## 실행 방법

### Windows

Python을 설치한 뒤 `run.bat`을 실행합니다.

Python 설치 시 `Add python.exe to PATH` 옵션을 체크해야 합니다.

처음 실행하면 자동으로 가상환경을 만들고 필요한 패키지를 설치합니다.

### WSL/Linux

```bash
python3 -m venv .venv
.venv/bin/pip install -e .
.venv/bin/srtgo
```

## 설정

- 로그인 정보, 텔레그램 설정, 카드 정보는 코드 저장소가 아니라 실행 환경의 keyring에 저장됩니다.
- GitHub에는 계정 정보, 카드 정보, 텔레그램 토큰이 올라가지 않습니다.
- 텔레그램 토큰은 비밀번호처럼 취급해야 하며 외부에 공유하지 마세요.

## 원본 프로젝트

- Original project: https://github.com/lapis42/srtgo
- This project includes code from [SRT](https://github.com/ryanking13/SRT) by ryanking13 and [korail2](https://github.com/carpedm20/korail2) by carpedm20.

## License

원본 프로젝트의 MIT License를 따릅니다. 자세한 내용은 [LICENSE](LICENSE)를 참고하세요.

## Notice

본 프로그램의 사용에 따른 책임은 사용자에게 있습니다. 예매 서비스의 이용약관과 공정한 예매 문화를 준수하세요.
