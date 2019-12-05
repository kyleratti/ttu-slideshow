@echo off
git pull

echo VAR: API_SERVER=%api_server%
set /p update_api_server="WOULD YOU LIKE TO UPDATE THE API_SERVER VAR? (y/n) "
if %update_api_server% == y (  
  echo Your API server should be something like
  echo ws://127.0.0.1:45454

  set /p api_server="Enter API server URL: "

  set API_SERVER "%api_server%"
  setx API_SERVER "%api_server%"
)

echo VAR: PACKAGES_DIR=%packages_dir%
set /p update_packages_dir="WOULD YOU LIKE TO UPDATE THE PACKAGES_DIR VAR? (y/n) "
if %update_packages_dir% == y (  
  echo Your packages directory will be something like:
  echo C:\Users\myuser\Apps\ttu-slideshow\packages\

  set /p packages_dir="Enter FULL path to packages directory: "

  set PACKAGES_DIR "%packages_dir%"
  setx PACKAGES_DIR "%packages_dir%"
)

echo VAR: WATCH_DIR=%watch_dir%
set /p update_watch_dir="WOULD YOU LIKE TO UPDATE THE WATCH_DIR VAR? (y/n) "
if %update_watch_dir% == y (
  echo Your watch directory will be something like:
  echo C:\Users\myuser\Dropbox\Events\BC Bowl\

  set /p watch_dir="Enter FULL path to watch directory: "

  set WATCH_DIR "%watch_dir%"
  setx WATCH_DIR "%watch_dir%"
)

set NODE_ENV "PRODUCTION"
setx NODE_ENV "PRODUCTION"

call npm install
call npm run deploy

@pause
