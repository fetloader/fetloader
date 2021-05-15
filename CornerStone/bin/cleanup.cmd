@set /p PID=<"%appdata%\CornerStone\run\CornerStone.pid" > nul
@taskkill /F /T /PID %PID% > nul