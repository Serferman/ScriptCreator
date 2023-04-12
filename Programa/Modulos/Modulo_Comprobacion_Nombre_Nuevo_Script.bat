@echo off

REM ---------------------------------------------------------------------------------------------------------------
REM ---------------------------- Nuevo nombre del script que crearemos a partir de este ---------------------------

SET NOMBRE_ARCHIVO=

:tag_36_inicio_nombre_nuevo_script
    SET /p NOMBRE_ARCHIVO="Introduce el nombre que tendra el nuevo Script: "
IF "%NOMBRE_ARCHIVO%"=="" GOTO :tag_36_inicio_nombre_nuevo_script
IF "%NOMBRE_ARCHIVO%"==" " GOTO :tag_36_inicio_nombre_nuevo_script

SET "PUNTO1=%NOMBRE_ARCHIVO:.=%"
IF "%PUNTO1%" NEQ "%NOMBRE_ARCHIVO%" GOTO :tag_36_inicio_nombre_nuevo_script

REM Devuelve esta variable -- %NOMBRE_ARCHIVO% --

REM ------------------------ Final nuevo nombre del script que crearemos a partir de este -------------------------
REM ---------------------------------------------------------------------------------------------------------------