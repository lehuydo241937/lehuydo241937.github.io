# upload.ps1 - Automated Blog/Article Upload Script

# 1. Get commit message from user
$commitMessage = Read-Host -Prompt "Enter commit message (default: 'Add/Update content')"
if ([string]::IsNullOrWhiteSpace($commitMessage)) {
    $commitMessage = "Add/Update content"
}

Write-Host "--- Starting Upload Process ---" -ForegroundColor Cyan

# 2. Git Operations
Write-Host "Step 1: Committing source changes to main..." -ForegroundColor Yellow
git add .
git commit -m $commitMessage
git push origin main

# 3. Build and Deploy
Write-Host "Step 2: Building and deploying to gh-pages..." -ForegroundColor Yellow
npm run deploy

Write-Host "--- Process Complete! Your content should be live in a few minutes. ---" -ForegroundColor Green
