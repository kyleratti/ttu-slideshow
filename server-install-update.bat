@echo off
echo Your packages directory will be something like:
echo C:\Users\myuser\Apps\ttu-slideshow\packages\
set /p packages_dir="Enter FULL path to packages directory:"
echo Your watch directory will be something like:
echo C:\Users\myuser\Dropbox\Events\BC Bowl\
set /p watch_dir="Enter FULL path to watch directory: "
setx PACKAGES_DIR="%packages_dir%"
setx WATCH_DIR="%watch_dir%"
setx NODE_ENV="PRODUCTION"
npm install
npm run deploy
@pause
