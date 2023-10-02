@echo off

@REM set "pathStarted=%__CD__:~,-1%"
set /P folder=Folder? 
if [%folder%] EQU [] (
    set folder=C:\Users\ccatura\Work
)
set /P goal=Goal quantity? 
set /A prev=0

:COUNT
for /f %%A in ('dir "%folder%\*.*" ^| find "File(s)"') do set /A cnt=%%A


set /A diff=%goal%-%cnt%
if %prev% NEQ %cnt% (
    cls
    echo %diff% more shots until goal of %goal%.
    echo|set /p= Images shot today: 
    forfiles /P "%folder%" /M "*" /D +0 /C "cmd /C if @isdir==FALSE echo _" | find /C "_"
    call:countskus %folder%
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
exit





















:countskus
@echo off

set theTempFile=c:\temp\temp1.txt
set theSKUSList=c:\temp\The_Skus.txt

:: If the SKU text file exists, then delete it
del %theSKUSList%

set theDir=%1

:: This is the path to where you want the sku list to come from
dir "%theDir%\*.*" /o:n /a-d /b >%theTempFile%

:: Reads tempfile, parses data and eventually writes it to The_Skus file
set /a count=0
setlocal EnableDelayedExpansion
for /f %%a in (%theTempFile%) do (
    set bbb=%%~na

    for /f "delims=_" %%b in ("!bbb!") do set bbb=%%b
    @REM echo !bbb!

    :: This next line only writes a sku if it hasn't previously been written, otherwise skips it
    if !ccc! NEQ !bbb! echo !bbb!>>%theSKUSList%&set /a count = !count!+1

    set ccc=!bbb!
)
    echo Unique SKUs      : !count! 
setlocal DisableDelayedExpansion

del %theTempFile%
exit /B 0