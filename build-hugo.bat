@REM
 @REM This file is licensed under the GPLv3 License.
 @REM Copyright © 2025 kelson8
 @REM
 @REM [https://www.gnu.org/licenses/gpl-3.0.txt]
@REM

@REM Set this to either http or https
set "protocol=http"
@REM Set the bind IP
set "bindIP=192.168.1.109"
@REM Set the port to run this with
set "port=8081"

@REM --buildDrafts can be added to include drafts in the build if needed.

.\hugo.exe --baseURL %protocol%://%bindIP%:%port%