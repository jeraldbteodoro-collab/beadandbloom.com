<#
Helper: Push this repo to GitHub.
Usage:
  .\push-to-github.ps1 -RemoteUrl "https://github.com/your-username/your-repo.git" [-Branch main]

Notes:
- Requires `git` available in PATH and network access to GitHub.
- This script only prepares and pushes; Actions will run to publish to Pages.
#>

param(
  [Parameter(Mandatory=$true)] [string]$RemoteUrl,
  [string]$Branch = 'main'
)

if (-not (Test-Path -Path .git)) {
  git init
  git checkout -b $Branch
}

try {
  git add -A
  git commit -m "Prepare site for GitHub Pages" -q
} catch {
  Write-Host "No changes to commit or git commit failed." -ForegroundColor Yellow
}

try {
  git remote remove origin -ErrorAction SilentlyContinue
} catch {}
git remote add origin $RemoteUrl
git push -u origin $Branch

Write-Host "Pushed to $RemoteUrl on branch $Branch. Workflow will deploy to GitHub Pages." -ForegroundColor Green
