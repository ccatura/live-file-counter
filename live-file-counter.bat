@echo off

set /P goal=Goal quantity? 
set /A prev=0

:COUNT
for /f %%A in ('dir "G:\My Drive\JTV\Work\*.*" ^| find "File(s)"') do set /A cnt=%%A


set /A diff=%goal%-%cnt%
if %prev% NEQ %cnt% (
    cls
    echo %diff% more shots until goal of %goal%.
    echo|set /p= Images shot today: 
    forfiles /P "G:\My Drive\JTV\Work" /M "*" /D +0 /C "cmd /C if @isdir==FALSE echo _" | find /C "_"
    echo Total images     : %cnt%

    color f0
    ping 127.0.0.1 -n 1 > nul
    color 0f
    ping 127.0.0.1 -n 1 > nul
    color f0
    ping 127.0.0.1 -n 2 > nul
    color 0f
    set /A prev=%cnt%
)

ping 127.0.0.1 -n 3 > nul
goto :count

pause




