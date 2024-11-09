@ setlocal enableextensions 
set "target_path=%~1"
for /R "%target_path%" %%a in (*.exe) do (
    netsh advfirewall firewall add rule name="Blocked with Batchfile %%a" dir=out program="%%a" action=block
)
