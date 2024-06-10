# PlayAll

PlayAll은 안드로이드 단말기를 통해 다양한 악기(피아노, 기타, 드럼)를 연주할 수 있도록 만든 학습/연습용 앱입니다.

> **소속·과목**: 한국공학대학교 모바일 프로그래밍
> **진행 시기**: 2024년 1학기 (2024년 5~6월)
> **유형**: 강의 팀 프로젝트 (3인)

## 팀 구성 및 역할 분담

| 이름 | 담당 영역 | 주요 작업 |
| --- | --- | --- |
| 신동근 | 기타 (Guitar) | `GuitarActivity`, `EditChordActivity`, `CustomImageButton` |
| 강민수 | 피아노 (Piano) | `PianoActivity` ~ `PianoActivity4`, 음원(.ogg) 리소스 |
| 안병윤 | 드럼 (Drum) | `DrumActivity`, 드럼 관련 리소스 및 인터랙션 |

## 주요 기능

- **피아노**: 4종(`PianoActivity` ~ `PianoActivity4`)의 화면 구성으로 옥타브/레이아웃을 달리하여 연주 가능
- **기타**: 코드 편집 기능(`EditChordActivity`)을 갖춘 기타 모드
- **드럼**: 가로 모드 기반의 드럼 연주 화면
- **사용자 정의 버튼**: `CustomImageButton`을 활용한 커스텀 인터랙션

## 기술 스택

- 언어: Kotlin
- 빌드 도구: Gradle (Kotlin DSL, `build.gradle.kts`)
- 최소 SDK: 24 / 컴파일·타깃 SDK: 34
- View Binding 사용
- 라이브러리: AndroidX Core/AppCompat/Activity/ConstraintLayout, Material Components

## 프로젝트 구조

```
PlayAll/
├── app/
│   ├── src/main/
│   │   ├── java/com/example/playall/   # 액티비티 및 커스텀 뷰
│   │   ├── res/
│   │   │   ├── drawable/               # 키 이미지 등 리소스
│   │   │   └── raw/                    # 음원(.ogg)
│   │   └── AndroidManifest.xml
│   └── build.gradle.kts
├── build.gradle.kts                    # 루트 빌드 설정
├── settings.gradle.kts
└── gradle/                             # Gradle Wrapper
```

## 빌드 및 실행

1. Android Studio(권장: Hedgehog 이상)에서 프로젝트 폴더를 엽니다.
2. Gradle 동기화를 완료한 뒤 실제 단말기 또는 에뮬레이터를 선택합니다.
3. `Run` 버튼으로 빌드 및 실행합니다.

> `local.properties`는 SDK 경로 등 환경 정보를 포함하므로 저장소에 포함되지 않습니다. Android Studio가 최초 동기화 시 자동으로 생성합니다.

## 라이선스

한국공학대학교 모바일 프로그래밍 강의 과제로 3인이 협업하여 제출한 학습용 프로젝트이며, 별도 라이선스가 명시되어 있지 않습니다.
