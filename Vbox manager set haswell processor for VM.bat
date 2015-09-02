@echo off
Title = "Setting VM to Haswell Processor"

echo.
echo.
echo cd..\..\program files\oracle\virtualbox
cd C:\program files\oracle\virtualbox
echo.
ECHO ..............success!
ECHO.
:start
ECHO.
ECHO 1. Press enter to kill VirtualBox
ECHO 2. Type lowercase 'no' to skip killing VirtualBox
ECHO 3. Type lowercase 'exit' to Exit
echo.

set /p choice= Type your choice here:
rem if not '%choice%'=='' set choice=%choice:~0;1%

if '%choice%'=='' goto hello
if '%choice%'=='no' goto bye
if '%choice%'=='exit' goto end


ECHO\n
goto start
:hello
taskkill /f /im virtualbox.exe
echo.
ECHO ..............success!
echo.
echo Now trying to modify the virtual machine for Haswell processors
echo.
set /p var= Enter the name of your VirtualBox Machine:
vboxmanage modifyvm "%var%" --cpuidset 00000001 000106e5 02100800 0098e3fd bfebfbff
echo.
ECHO ..............success!
echo.
goto start

:bye
echo.
ECHO You chose not to kill current VirtualBox Process.
echo.
echo Now trying to modify the virtual machine for Haswell processors
echo.
set /p var= Enter the name of your VirtualBox Machine:
vboxmanage modifyvm "%var%" --cpuidset 00000001 000106e5 02100800 0098e3fd bfebfbff
echo.
ECHO ..............success! 
echo.
goto start

:end
echo.
echo.
echo Exiting
Exit
::SuperCodingPanda