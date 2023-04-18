@echo off

REM ---------------------------------------------------------------------------------------------------------------
REM -------------------- Cantidad de bloques/carpetas que tendra nuestro script posteriormente --------------------

:tag_40_reiniciar_pregunta_mapeo_copiar
    SET /p MAPEO_O_COPIAR="¿Quieres MAPEAR la carpeta remota o COPIAR sus archivos a una carpeta local? | 1.- MAPEAR | 2.- COPIAR | : "
IF %MAPEO_O_COPIAR% LSS 1 GOTO :tag_40_reiniciar_pregunta_mapeo_copiar
IF %MAPEO_O_COPIAR% GTR 2 GOTO :tag_40_reiniciar_pregunta_mapeo_copiar

IF "%MAPEO_O_COPIAR%"=="" GOTO :tag_40_reiniciar_pregunta_mapeo_copiar
IF "%MAPEO_O_COPIAR%"==" " GOTO :tag_40_reiniciar_pregunta_mapeo_copiar

SET "QUITAR_PUNTO_3=%MAPEO_O_COPIAR:.=%"
IF "%QUITAR_PUNTO_3%" NEQ "%MAPEO_O_COPIAR%" GOTO :tag_61_mapeo_copiar_aviso
GOTO :tag_62_mapeo_copiar_aviso_final

:tag_61_mapeo_copiar_aviso

    echo ----------------------------------------------------
    echo No puedes poner puntos en el nombre del nuevo script
    echo ----------------------------------------------------

GOTO :tag_40_reiniciar_pregunta_mapeo_copiar

:tag_62_mapeo_copiar_aviso_final

echo %MAPEO_O_COPIAR% > temp.txt

type temp.txt | FindStr /R /C:"[ABCDEFGHIJKLMNÑOPQRSTUVWXYZ]" > nul
IF %errorlevel%==0 GOTO :tag_35_inicio_cantidad_carpetas_script
type temp.txt | FindStr /R /C:"[abcdefghijklmnñopqrstuvwxyz]" > nul
IF %errorlevel%==0 GOTO :tag_35_inicio_cantidad_carpetas_script

del temp.txt

REM Devuelve esta variable -- %MAPEO_O_COPIAR% --

REM ----------------- Final cantidad de bloques/carpetas que tendra nuestro script posteriormente -----------------
REM ---------------------------------------------------------------------------------------------------------------