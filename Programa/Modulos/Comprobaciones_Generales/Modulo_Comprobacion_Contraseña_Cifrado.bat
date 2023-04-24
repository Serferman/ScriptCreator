@echo off

REM ---------------------------------------------------------------------------------------------------------------
REM -------------------- Contraseña cifrada que posteriormente se guardará en el nuevo script ---------------------

SET "psCommand1=powershell -Command "$pword = read-host 'Introduce tu contraseña' -AsSecureString ; ^
     $PASSWORD = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword)) ; ^
     ConvertFrom-SecureString $pword ""

FOR /f "usebackq delims=" %%p IN (`%psCommand1%`) DO SET ENCRYPTED_PASSWORD=%%p

echo.

echo %ENCRYPTED_PASSWORD% 

REM ----------------- Final contraseña cifrada que posteriormente se guardará en el nuevo script ------------------
REM ---------------------------------------------------------------------------------------------------------------