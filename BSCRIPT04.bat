@echo off
setlocal enabledelayedexpansion

set "Main_dir=C:"
set "Archives_dir=D:\Archive_files"
echo checking if you have archives.
if not exist "%Archives_dir%" (
    echo You don't have an archive directory.
    mkdir "%Archives_dir%"
    echo %Archives_dir% has been created.
)  
pause

:: this is looping to the file and disecting the date for the following function of identifying what to move
for %%f in (*.txt) do (
    for /F "tokens=1,2,3 delims=/" %%A in ('forfiles /m "%%f" /c "cmd /c echo Date Created:@fdate"') do (
        set "month=%%A"
        set "day=%%B"
        set "year=%%C"
    )
    echo %%f !month!/!day!/!year!
)
:: Get user parameter for the Archiving the files
:: it was nas clarified what year to day for files to move
echo Enter the file date you want to move format: MM/DD/YYYY 00/00/0000
echo If nothing show please change the dir or cant find .txt 
    set /p "Olderfile=Date: "
    for /f "tokens=1-3 delims=/" %%a in ("%Olderfile%") do (
        set "By_month=%%a"
        set "By_day=%%b"
        set "By_year=%%c"
    )

::go through the files and move if True
echo moving files to %Archives_dir%
for %%f in (*.txt) do (
    if !year! leq !By_year! (
        move "%%f" "%Archives_dir%"
        set /a move_files+=1
        if !month! leq !By_month! (
            move "%%f" "%Archives_dir%"
            set /a move_files+=1
            if !day! leq !By_day! (
                move "%%f" "%Archives_dir%"
                set /a move_files+=1
            ) 
        ) 
    )
)
pause 
echo sorting files check %Archives_dir% contents
echo File Name    Size
for /F "tokens=*" %%f in ('dir /b /s /o-s "%Archives_dir%\*.txt"') do (
    set "filename=%%~nf"
    set "filesize=%%~zf"
    echo !filename!=!filesize!bytes
)
::deleting
set /p "delete=Do you want to delete these files? (y/n) "
if "%delete%" == "y" (
    rem parameter for removing the files
    echo Enter the minimum file size in bytes
    set /p "Min_size=Size: "

    rem getting the bytes size
    for /F "tokens=*" %%f in ('dir /b /s /o-s "%Archives_dir%\*.txt"') do (
        set "filesize=%%~zf"
        echo %%f=!filesize! bytes
        rem check if its Higher bytes before getting deleted
        if !filesize! GEQ !Min_size! (
            echo Deleting "%%f"
            del "%%f"
        )
    )  
) else (
    echo No files deleted.
)   
pause
exit
endlocal