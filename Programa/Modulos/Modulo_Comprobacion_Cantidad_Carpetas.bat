@echo off

REM ---------------------------------------------------------------------------------------------------------------
REM -------------------- Cantidad de bloques/carpetas que tendra nuestro script posteriormente --------------------

SET CANTIDAD_CARPETAS=

:tag_35_inicio_cantidad_carpetas_script
    SET /p CANTIDAD_CARPETAS="Introduce el numero de carpetas remotas que quieres mapear localmente: "
IF "%CANTIDAD_CARPETAS%"=="" GOTO :tag_35_inicio_cantidad_carpetas_script
IF "%CANTIDAD_CARPETAS%"==" " GOTO :tag_35_inicio_cantidad_carpetas_script
IF %CANTIDAD_CARPETAS% LEQ 0 GOTO :tag_35_inicio_cantidad_carpetas_script

SET "PUNTO2=%CANTIDAD_CARPETAS:.=%"
IF "%PUNTO2%" NEQ "%CANTIDAD_CARPETAS%" GOTO :tag_35_inicio_cantidad_carpetas_script

echo %CANTIDAD_CARPETAS% > temp.txt

type temp.txt | FindStr /R /C:"[ABCDEFGHIJKLMNÑOPQRSTUVWXYZ]" > nul
IF %errorlevel%==0 GOTO :tag_35_inicio_cantidad_carpetas_script
type temp.txt | FindStr /R /C:"[abcdefghijklmnñopqrstuvwxyz]" > nul
IF %errorlevel%==0 GOTO :tag_35_inicio_cantidad_carpetas_script

del temp.txt

REM %CANTIDAD_CARPETAS% 

REM ----------------- Final cantidad de bloques/carpetas que tendra nuestro script posteriormente -----------------
REM ---------------------------------------------------------------------------------------------------------------