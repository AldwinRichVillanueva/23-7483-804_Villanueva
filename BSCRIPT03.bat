@echo off
setlocal ENABLEDELAYEDEXPANSION
:menu
cls
echo Bscript03
echo 1. Ipconfig
echo 2. Task list
echo 3. Task kill
echo 4. Check disk
echo 5. Formating
echo 6. Defrag
echo 7. Find
echo 8. Attrib
echo 9. Leave
set /p insert=Type the number or the name: 

if "%insert%" == "1" goto ipconfig_menu
if "%insert%" == "2" goto tasklist_menu
if "%insert%" == "3" goto taskkill_menu
if "%insert%" == "4" goto Checkdisk_menu
if "%insert%" == "5" goto format_menu
if "%insert%" == "6" goto defrag_menu
if "%insert%" == "7" goto find_menu
if "%insert%" == "8" goto attrib_menu
if "%insert%" == "9" goto leave


:ipconfig_menu
cls
echo Ipconfig Options
echo 1. Display only the IP address, subnet mask, and default gateway for each adapter bound to TCP/IP.
echo 2. Display full configuration information.
echo 3. Release the IPv4 address for the specified adapter.
echo 4. Release the IPv6 address for the specified adapter.
echo 5. Renew the IPv4 address for the specified adapter.
echo 6. Renew the IPv6 address for the specified adapter.
echo 7. Purge the DNS Resolver cache.
echo 8. Refresh all DHCP leases and re-register DNS names.
echo 9. Display the contents of the DNS Resolver Cache.
echo 0. Other options
choice /c 1234567890 /m "Choose"

if errorlevel 10 goto menu
if errorlevel 9 ipconfig /displaydns
if errorlevel 8 ipconfig /registerdns
if errorlevel 7 ipconfig /flushdns
if errorlevel 6 ipconfig /renew6
if errorlevel 5 ipconfig /renew
if errorlevel 4 ipconfig /release6
if errorlevel 3 ipconfig /release
if errorlevel 2 ipconfig /all
if errorlevel 1 ipconfig
pause


:other
cls
echo Other Ipconfig Options
echo 1. Display the contents of the DNS Resolver Cache.
echo 2. Displays all the DHCP class IDs allowed for the adapter.
echo 3. Modifies the DHCP class ID.
echo 4. Displays all the IPv6 DHCP class IDs allowed for the adapter.
echo 5. Modifies the IPv6 DHCP class ID.
echo 6. Back to menu
choice /c 123456 /m "Choose"
if errorlevel 6 goto menu
if errorlevel 5 ipconfig /setclassid6
if errorlevel 4 ipconfig /showclassid6
if errorlevel 3 ipconfig /setclassid
if errorlevel 2 ipconfig /showclassid
if errorlevel 1 ipconfig /displaydns
pause

:tasklist_menu
tasklist
pause

echo 1.task kill
echo 2.back to menu
choice /c 12 /m "Choose"
if errorlevel 2 goto menu
if errorlevel 1 goto taskkill_menu

:taskkill_menu
cls
echo Task Kill Options
echo 1. Kill a task by PID.
echo 2. Kill a task by name.
choice /c 12 /m "Choose"
if errorlevel 2 goto menu
if errorlevel 1 (
    set /p pid=Enter PID: 
    taskkill /PID %pid%
    pause
    goto taskkill_menu
)

:Checkdisk_menu
cls
echo Check Disk Options
set /p drive=Enter the drive letter: 
chkdsk %drive%: /f
pause
goto menu

:format_menu
cls
echo Format Options
set /p drive=Enter the drive letter: 
format %drive%: /fs:NTFS
pause
goto menu

:defrag_menu
cls
echo Defrag Options
set /p drive=Enter the drive letter: 
defrag %drive%:
pause
goto menu

:find_menu
cls
echo Find Options
set /p drive=Enter the drive letter: 
dir %drive%:\ /s /b
pause
goto menu

:attrib_menu
cls
echo Attrib Options
set /p file=Enter the file name: 
attrib %file%
pause
goto menu

:leave
echo Thanks for using
exit /bs
