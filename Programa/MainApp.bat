@echo off
chcp 65001 > nul
cls

SET PORCENTAJE=%%
SET "Presentacion=%ComSpec% /C echo ________▄▄▄▄▄▄▄▄▄███████████████▄  MENÚ  ▄███████████████▄▄▄▄▄▄▄▄▄________ & echo ▀▀▀▀▀▀▀▀▀▀▀▀▀███████████▀▀ PARÁMETROS GENERALES ▀▀███████████▀▀▀▀▀▀▀▀▀▀▀▀▀ & echo."
                                                                                                                     
%Presentacion%

call .\Modulos\Comprobaciones_Preguntas\Modulo_Comprobacion_Pregunta_Cantidad_Carpetas.bat
REM ESTE SCRIPT DEVUELVE UNA VARIABLE LLAMADA ------- %CANTIDAD_CARPETAS% ------
REM echo %CANTIDAD_CARPETAS%

echo.
cls

%Presentacion%

call .\Modulos\Comprobaciones_Preguntas\Modulo_Comprobacion_Pregunta_Nombre_Nuevo_Script.bat
REM ESTE SCRIPT DEVUELVE UNA VARIABLE LLAMADA --------- %NOMBRE_ARCHIVO% -------
REM echo %NOMBRE_ARCHIVO%

echo.
cls

%Presentacion%

REM -------------- Definición de la extensión del archivo creado ---------------
SET RUTA_LOCAL_CREACION_SCRIPT=.\%NOMBRE_ARCHIVO%.bat 

call .\Modulos\Comprobaciones_Generales\Modulo_Comprobacion_IP.bat
REM ESTE SCRIPT DEVUELVE UNA VARIABLE LLAMADA ----------- %RUTA_RED% -----------
REM echo %RUTA_RED% 
timeout 3 > nul

echo.
cls

%Presentacion%

call .\Modulos\Comprobaciones_Preguntas\Modulo_Comprobacion_Pregunta_Usuario.bat
REM ESTE SCRIPT DEVUELVE UNA VARIABLE LLAMADA ------------ %USUARIO% -----------
REM echo %USUARIO%

echo.
cls

%Presentacion%

call .\Modulos\Comprobaciones_Generales\Modulo_Comprobacion_Contraseña_Cifrado.bat
REM ESTE SCRIPT DEVUELVE UNA VARIABLE LLAMADA -------- %PASSWORD% --------
REM echo %PASSWORD%
timeout 3 > nul

echo.
cls

REM ----------------------------------------------------------------------------

echo @echo off > %RUTA_LOCAL_CREACION_SCRIPT%
echo net use * /delete /yes ^> ^nul >> %RUTA_LOCAL_CREACION_SCRIPT%
@echo. >> %RUTA_LOCAL_CREACION_SCRIPT%

echo SET ENCRYPTED_PASSWORD=%ENCRYPTED_PASSWORD% >> %RUTA_LOCAL_CREACION_SCRIPT%
echo SET FILTRED_ENCRYPTED_PASSWORD=%%ENCRYPTED_PASSWORD: =%% >> %RUTA_LOCAL_CREACION_SCRIPT%
echo. >> %RUTA_LOCAL_CREACION_SCRIPT%

SET "psCommand2=powershell -Command " $password = ConvertTo-SecureString -String %FILTRED_ENCRYPTED_PASSWORD% -ErrorAction Stop ; $bstr = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($password) ; $plainPassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($bstr) ; Write-Output $plainPassword"" >> %RUTA_LOCAL_CREACION_SCRIPT%

echo. >> %RUTA_LOCAL_CREACION_SCRIPT%

echo FOR /f "usebackq delims=" %%%%p IN (`%%psCommand2%%`) DO SET DECRYPTED_PASSWORD=%%%%p >> %RUTA_LOCAL_CREACION_SCRIPT%

echo. >> %RUTA_LOCAL_CREACION_SCRIPT%

REM ----------------------------------------------------------------------------

call .\Modulos\Comprobaciones_Generales\Modulo_Creacion_Nuevo_Script.bat
REM ESTE SCRIPT DEVUELVE OTRO SCRIPT COMPLETO LLAMADO ---- %NOMBRE_ARCHIVO% ----
REM echo %NOMBRE_ARCHIVO%

exit