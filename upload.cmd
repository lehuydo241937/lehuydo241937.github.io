@echo off
echo --- Starting Upload Process ---

:: 1. Get commit message from user
set /p commitMessage="Enter commit message (Press Enter for default 'Add/Update content'): "
if "%commitMessage%"=="" set commitMessage=Add/Update content

:: 2. Git Operations
echo Step 1: Committing source changes to main...
git add .
git commit -m "%commitMessage%"
git push origin main

:: 3. Build and Deploy
echo Step 2: Building and deploying to gh-pages...
call npm run deploy

echo --- Process Complete! Your content should be live in a few minutes. ---
pause
