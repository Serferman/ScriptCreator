@echo off
chcp 65001 > nul

echo ----------------------------------MENU----------------------------------
echo.
echo -------------------------PARAMETROS GENERALES---------------------------
REM ------------------ Cantidad de bloques en el nuevo script ------------------

call Modulo_Comprobacion_Cantidad_Carpetas.bat
REM ESTE SCRIPT DEVUELVE UNA VARIABLE LLAMADA ------- %CANTIDAD_CARPETAS% ------
REM echo %CANTIDAD_CARPETAS%

call Modulo_Comprobacion_Nombre_Nuevo_Script.bat
REM ESTE SCRIPT DEVUELVE UNA VARIABLE LLAMADA --------- %NOMBRE_ARCHIVO% -------
REM echo %NOMBRE_ARCHIVO%

REM --------------- Defino la extensión de archivo que se creará ---------------
SET NOMBRE_ARCHIVO=%NOMBRE_ARCHIVO%.bat 

call Modulo_Comprobacion_IP.bat
REM ESTE SCRIPT DEVUELVE UNA VARIABLE LLAMADA ----------- %RUTA_RED% -----------
REM echo %RUTA_RED% 

call Modulo_Comprobacion_Directorios_Remotos.bat
REM ESTE SCRIPT DEVUELVE UNA VARIABLE LLAMADA ---------- %CARPETA_RED% ---------
REM echo %CARPETA_RED%

call Modulo_Comprobacion_Usuario.bat
REM ESTE SCRIPT DEVUELVE UNA VARIABLE LLAMADA --------- %USUARIO% --------
REM echo %USUARIO%

call Modulo_Comprobacion_Contraseña.bat
REM ESTE SCRIPT DEVUELVE UNA VARIABLE LLAMADA --------- %password_hash% --------
REM echo %password_hash%

echo.

REM ----------------------------------------------------------------------------
echo @echo off > %NOMBRE_ARCHIVO%
echo net use * /delete /yes >> %NOMBRE_ARCHIVO%
@echo. >> %NOMBRE_ARCHIVO%
REM ----------------------------------------------------------------------------

call Modulo_Creacion_Nuevo_Script.bat
REM ESTE SCRIPT DEVUELVE OTRO SCRIPT COMPLETO LLAMADO ---- %NOMBRE_ARCHIVO% ----
REM echo %NOMBRE_ARCHIVO%

exit