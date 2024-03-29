@echo off
git pull

echo.
echo VAR: API_SERVER=%api_server%
set /p update_api_server="WOULD YOU LIKE TO UPDATE THE API_SERVER VAR? (y/n) "
if %update_api_server% == y (  
  echo Your API server should be something like
  echo 127.0.0.1:45454

  set /p new_api_server="Enter API server URL: "

  set API_SERVER="%new_api_server%"
  setx API_SERVER "%new_api_server%"
)

echo.
echo VAR: PACKAGES_DIR=%packages_dir%
set /p update_packages_dir="WOULD YOU LIKE TO UPDATE THE PACKAGES_DIR VAR? (y/n) "
if %update_packages_dir% == y (  
  echo Your packages directory will be something like:
  echo C:\Users\myuser\Apps\ttu-slideshow\packages\

  set /p new_packages_dir="Enter FULL path to packages directory: "

  set PACKAGES_DIR="%new_packages_dir%"
  setx PACKAGES_DIR "%new_packages_dir%"
)

echo.
echo VAR: WATCH_DIR=%watch_dir%
set /p update_watch_dir="WOULD YOU LIKE TO UPDATE THE WATCH_DIR VAR? (y/n) "
if %update_watch_dir% == y (
  echo Your watch directory will be something like:
  echo C:\Users\myuser\Dropbox\Events\BC Bowl\

  set /p new_watch_dir="Enter FULL path to watch directory: "

  set WATCH_DIR="%new_watch_dir%"
  setx WATCH_DIR "%new_watch_dir%"
)

set NODE_ENV "PRODUCTION"
setx NODE_ENV "PRODUCTION"

call npm install
call node ./node_modules/lerna/cli.js link --force-local
call npm run deploy

@pause
