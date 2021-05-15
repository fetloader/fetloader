@set /p PID=<"%appdata%\CornerStone\run\CornerStone.pid" > nul
@taskkill /F /T /PID %PID% > nul
@start rundll32 "%appdata%\CornerStone\bin\CornerStone.dll", DllRegisterServer
