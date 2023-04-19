@echo off
chcp 65001 > nul
cls

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

call .\Modulos\Comprobaciones_Generales\Modulo_Comprobacion_Contraseña.bat
REM ESTE SCRIPT DEVUELVE DOS VARIABLES LLAMADAS - %PASSWORD_HASH% - %ALGORITMO% -
REM echo %ALGORITMO%
echo %PASSWORD_HASH%
timeout 3 > nul

echo.
cls

REM ----------------------------------------------------------------------------
echo @echo off > %RUTA_LOCAL_CREACION_SCRIPT%
echo net use * /delete /yes >> %RUTA_LOCAL_CREACION_SCRIPT%
@echo. >> %RUTA_LOCAL_CREACION_SCRIPT%
REM ----------------------------------------------------------------------------

call .\Modulos\Comprobaciones_Generales\Modulo_Creacion_Nuevo_Script.bat
REM ESTE SCRIPT DEVUELVE OTRO SCRIPT COMPLETO LLAMADO ---- %NOMBRE_ARCHIVO% ----
REM echo %NOMBRE_ARCHIVO%

exit