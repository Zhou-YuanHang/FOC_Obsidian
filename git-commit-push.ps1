param(
    [string]$Message = "",
    [switch]$NoPush
)

#Requires -Version 5.1

$ErrorActionPreference = "Stop"

Write-Host ("=" * 50) -ForegroundColor Cyan
Write-Host "  Git One-Click Commit + Push" -ForegroundColor Cyan
Write-Host ("=" * 50) -ForegroundColor Cyan

# check repo status
Write-Host "[1/4] Checking repository status..." -ForegroundColor Yellow
$null = git status --short 2>&1
if (-not $?) {
    Write-Host "[ERROR] Not a git repository" -ForegroundColor Red
    exit 1
}

# check remote
$remote = git remote 2>&1
if ($LASTEXITCODE -ne 0 -or -not $remote) {
    Write-Host "[ERROR] No remote 'origin' configured" -ForegroundColor Red
    exit 1
}

# check for changes (including untracked)
$status = git status --porcelain 2>$null
if (-not $status) {
    Write-Host "[INFO] Working tree clean, nothing to commit." -ForegroundColor Green
    exit 0
}

# show current status
Write-Host "[STATUS] Changes to commit:"
git status --short | ForEach-Object { Write-Host "    $_" -ForegroundColor Gray }

# stage all
Write-Host "[2/4] Staging all changes..." -ForegroundColor Yellow
git add -A
if ($LASTEXITCODE -ne 0) {
    Write-Host "[ERROR] git add failed" -ForegroundColor Red
    exit 1
}

# commit message
if (-not $Message) {
    $dt = Get-Date -Format "yyyy-MM-dd HH:mm"
    $Message = "daily sync $dt"
}
Write-Host "[3/4] Committing: $Message" -ForegroundColor Yellow
git commit -m $Message
if ($LASTEXITCODE -ne 0) {
    Write-Host "[ERROR] git commit failed" -ForegroundColor Red
    exit 1
}

# push
if ($NoPush) {
    Write-Host "[INFO] Push skipped (-NoPush flag)" -ForegroundColor DarkYellow
} else {
    Write-Host "[4/4] Pushing to remote..." -ForegroundColor Yellow
    git push origin
    if ($LASTEXITCODE -ne 0) {
        Write-Host "[ERROR] git push failed, check network or authentication" -ForegroundColor Red
        exit 1
    }
}

Write-Host ("=" * 50) -ForegroundColor Cyan
Write-Host "  DONE!" -ForegroundColor Green
Write-Host "  Message: $Message" -ForegroundColor Green
if (-not $NoPush) {
    Write-Host "  Push: OK" -ForegroundColor Green
}
Write-Host ("=" * 50) -ForegroundColor Cyan
