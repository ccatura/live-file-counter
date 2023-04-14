@echo off

set /A prev=0

:COUNT
for /f %%A in ('dir "G:\My Drive\JTV\Work\*.jpg" ^| find "File(s)"') do set /A cnt=%%A

if %prev% NEQ %cnt% (
    color f0
    ping 127.0.0.1 -n 2 > nul
    color 0f
    set /A prev=%cnt%
)
cls

echo File count = %cnt%
ping 127.0.0.1 -n 3 > nul
goto :count

pause




