@echo off
setlocal enableextensions
set "target_path=%~1"
set "allowed_subnet=192.168.1.0/24"  REM Change this to your subnet

for /R "%target_path%" %%a in (*.exe) do (
    rem Allow the program for the specified subnet
    netsh advfirewall firewall add rule name="Allowed with Batchfile %%a" dir=out program="%%a" remoteip=%allowed_subnet% action=allow
    
    rem Block the program for all other traffic
    netsh advfirewall firewall add rule name="Blocked with Batchfile %%a" dir=out program="%%a" action=block
)
