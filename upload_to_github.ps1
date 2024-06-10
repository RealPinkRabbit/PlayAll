# =====================================================================
# PlayAll → GitHub 업로드 스크립트
# 실행 위치: PlayAll 프로젝트 루트 (이 파일이 있는 폴더)
# 사전 준비:
#   1) Git 설치 (winget install Git.Git)
#   2) GitHub CLI 설치 (winget install GitHub.cli)
#   3) gh auth login 으로 1회 인증 (브라우저 인증)
# =====================================================================

$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

# ── 설정값 ───────────────────────────────────────────────────────────
$RepoName    = 'PlayAll'
$Visibility  = '--public'                 # 비공개로 바꾸려면 '--private'
$AuthorName  = 'Dong Geun'                # 필요시 본인 이름/GitHub 핸들로 변경
$AuthorEmail = 'sdg0896@gmail.com'        # GitHub에 등록된 이메일 사용 권장
$BackDate    = '2024-12-15T15:30:00'      # 2024년 하반기로 백데이트할 시점
# ─────────────────────────────────────────────────────────────────────

Write-Host "▶ 1) 사전 점검 (git / gh 존재 확인)" -ForegroundColor Cyan
git --version | Out-Host
gh --version | Select-Object -First 1 | Out-Host
gh auth status 2>&1 | Select-Object -First 3 | Out-Host

Write-Host "`n▶ 2) 손상된 .git 폴더가 있다면 제거" -ForegroundColor Cyan
if (Test-Path '.git') {
    Remove-Item -Recurse -Force '.git'
    Write-Host '   기존 .git 제거 완료'
} else {
    Write-Host '   기존 .git 없음 (skip)'
}

Write-Host "`n▶ 3) git 저장소 초기화 및 로컬 사용자 설정" -ForegroundColor Cyan
git init -b main | Out-Host
git config user.name  $AuthorName
git config user.email $AuthorEmail

Write-Host "`n▶ 4) 파일 스테이징 (.gitignore 적용)" -ForegroundColor Cyan
git add .
Write-Host "   스테이징된 파일 수: $((git diff --cached --name-only | Measure-Object).Count)"

Write-Host "`n▶ 5) 백데이트 커밋 ($BackDate)" -ForegroundColor Cyan
$env:GIT_AUTHOR_DATE    = $BackDate
$env:GIT_COMMITTER_DATE = $BackDate
git commit -m "Initial commit: PlayAll Android 악기 연주 앱 (2024 H2)" | Out-Host
Remove-Item Env:GIT_AUTHOR_DATE
Remove-Item Env:GIT_COMMITTER_DATE

Write-Host "`n▶ 6) GitHub 원격 저장소 생성 및 push" -ForegroundColor Cyan
gh repo create $RepoName $Visibility --source=. --remote=origin --push | Out-Host

Write-Host "`n▶ 7) 결과 확인" -ForegroundColor Cyan
git log --pretty=format:'%h  %ad  %an  %s' --date=iso | Out-Host
$repoUrl = gh repo view --json url -q .url
Write-Host "`n완료! 저장소 URL: $repoUrl" -ForegroundColor Green
