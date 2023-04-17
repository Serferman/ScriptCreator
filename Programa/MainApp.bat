@echo off
chcp 65001 > nul

echo ---------------------------------- MENU ----------------------------------
echo ------------------------- PARAMETROS GENERALES ---------------------------
echo.

call .\Modulos\Comprobaciones_Preguntas\Modulo_Comprobacion_Pregunta_Cantidad_Carpetas.bat
REM ESTE SCRIPT DEVUELVE UNA VARIABLE LLAMADA ------- %CANTIDAD_CARPETAS% ------
REM echo %CANTIDAD_CARPETAS%

echo.

call .\Modulos\Comprobaciones_Preguntas\Modulo_Comprobacion_Pregunta_Nombre_Nuevo_Script.bat
REM ESTE SCRIPT DEVUELVE UNA VARIABLE LLAMADA --------- %NOMBRE_ARCHIVO% -------
REM echo %NOMBRE_ARCHIVO%

echo.

REM -------------- Definición de la extensión del archivo creado ---------------
SET RUTA_LOCAL_CREACION_SCRIPT=.\%NOMBRE_ARCHIVO%.bat 


call .\Modulos\Comprobaciones_Generales\Modulo_Comprobacion_IP.bat
REM ESTE SCRIPT DEVUELVE UNA VARIABLE LLAMADA ----------- %RUTA_RED% -----------
REM echo %RUTA_RED% 

echo.

call .\Modulos\Comprobaciones_Preguntas\Modulo_Comprobacion_Pregunta_Usuario.bat
REM ESTE SCRIPT DEVUELVE UNA VARIABLE LLAMADA ------------ %USUARIO% -----------
REM echo %USUARIO%

call .\Modulos\Comprobaciones_Generales\Modulo_Comprobacion_Contraseña.bat
REM ESTE SCRIPT DEVUELVE DOS VARIABLES LLAMADAS - %PASSWORD_HASH% - %ALGORITMO% -
REM echo %PASSWORD_HASH%
REM echo %ALGORITMO%

echo.

REM ----------------------------------------------------------------------------
echo @echo off > %RUTA_LOCAL_CREACION_SCRIPT%
echo net use * /delete /yes >> %RUTA_LOCAL_CREACION_SCRIPT%
@echo. >> %RUTA_LOCAL_CREACION_SCRIPT%
REM ----------------------------------------------------------------------------

call .\Modulos\Comprobaciones_Generales\Modulo_Creacion_Nuevo_Script.bat
REM ESTE SCRIPT DEVUELVE OTRO SCRIPT COMPLETO LLAMADO ---- %NOMBRE_ARCHIVO% ----
REM echo %NOMBRE_ARCHIVO%

exit