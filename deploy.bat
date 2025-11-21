@echo off
echo ========================================
echo   Portfolio Deployment Script
echo ========================================
echo.

echo Checking if Git is initialized...
if not exist .git (
    echo Initializing Git repository...
    git init
    echo Git repository initialized.
) else (
    echo Git repository already exists.
)

echo.
echo Adding all files to Git...
git add .

echo.
echo Committing changes...
set /p commit_message="Enter commit message (or press Enter for default): "
if "%commit_message%"=="" set commit_message=Update portfolio

git commit -m "%commit_message%"

echo.
echo Checking for remote repository...
git remote -v | findstr origin >nul
if errorlevel 1 (
    echo No remote repository found.
    echo Please add your GitHub repository URL:
    set /p repo_url="Enter GitHub repository URL: "
    git remote add origin %repo_url%
    echo Remote repository added.
) else (
    echo Remote repository already configured.
)

echo.
echo Pushing to GitHub...
git branch -M main
git push -u origin main

echo.
echo ========================================
echo   Deployment completed!
echo ========================================
echo.
echo Your portfolio has been pushed to GitHub.
echo To enable GitHub Pages:
echo 1. Go to your repository on GitHub
echo 2. Click on Settings
echo 3. Scroll down to Pages section
echo 4. Select "GitHub Actions" as source
echo 5. Your site will be available at:
echo    https://yourusername.github.io/repository-name
echo.
pause