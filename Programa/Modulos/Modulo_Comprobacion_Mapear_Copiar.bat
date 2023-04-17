@echo off

REM ---------------------------------------------------------------------------------------------------------------
REM -------------------- Cantidad de bloques/carpetas que tendra nuestro script posteriormente --------------------

:tag_40_reiniciar_pregunta_mapeo_copiar
    SET /p MAPEO_O_COPIAR="¿Quieres MAPEAR la carpeta remota o COPIAR sus archivos a una carpeta local? | 1.- MAPEAR | 2.- COPIAR |:"
IF %MAPEO_O_COPIAR% LSS 1 GOTO :tag_40_reiniciar_pregunta_mapeo_copiar
IF %MAPEO_O_COPIAR% GTR 2 GOTO :tag_40_reiniciar_pregunta_mapeo_copiar

IF "%MAPEO_O_COPIAR%"=="" GOTO :tag_40_reiniciar_pregunta_mapeo_copiar
IF "%MAPEO_O_COPIAR%"==" " GOTO :tag_40_reiniciar_pregunta_mapeo_copiar

SET "QUITAR_PUNTO_3=%MAPEO_O_COPIAR:.=%"
IF "%QUITAR_PUNTO_3%" NEQ "%MAPEO_O_COPIAR%" GOTO :tag_40_reiniciar_pregunta_mapeo_copiar


REM Devuelve esta variable -- %MAPEO_O_COPIAR% --

REM ----------------- Final cantidad de bloques/carpetas que tendra nuestro script posteriormente -----------------
REM ---------------------------------------------------------------------------------------------------------------