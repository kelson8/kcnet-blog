@REM This is a basic script to run hugo for Windows with a specific protocol, ip, and port.

@REM Set this to either http or https
set "protocol=http"
@REM Set the bind IP
set "bindIP=192.168.1.109"
@REM Set the port to run this with
@REM set "port=1313"
set "port=8081"

.\hugo.exe server -D --bind %bindIP% --baseURL %protocol%://%bindIP% --port=%port% --disableFastRender