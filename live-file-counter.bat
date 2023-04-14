@echo off

set /P goal=Goal quantity? 
set /A prev=0

:COUNT
for /f %%A in ('dir "G:\My Drive\JTV\Work\*.jpg" ^| find "File(s)"') do set /A cnt=%%A

cls
set /A diff=%goal%-%cnt%
echo %diff% more shots until goal of %goal%
echo %cnt% images

if %prev% NEQ %cnt% (
    color f0
    ping 127.0.0.1 -n 1 > nul
    color 0f
    ping 127.0.0.1 -n 1 > nul
    color f0
    ping 127.0.0.1 -n 2 > nul
    color 0f
    set /A prev=%cnt%
)

ping 127.0.0.1 -n 4 > nul
goto :count

pause




