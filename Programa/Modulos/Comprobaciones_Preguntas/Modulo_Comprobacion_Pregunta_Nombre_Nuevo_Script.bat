@echo off

REM ---------------------------------------------------------------------------------------------------------------
REM ---------------------------- Nuevo nombre del script que crearemos a partir de este ---------------------------

SET NOMBRE_ARCHIVO=

:tag_36_inicio_nombre_nuevo_script
    SET /p NOMBRE_ARCHIVO="Introduce el nombre que tendra el nuevo Script: "
IF "%NOMBRE_ARCHIVO%"=="" GOTO :tag_36_inicio_nombre_nuevo_script
IF "%NOMBRE_ARCHIVO%"==" " GOTO :tag_36_inicio_nombre_nuevo_script

SET "QUITAR_PUNTO_1=%NOMBRE_ARCHIVO:.=%"
IF "%QUITAR_PUNTO_1%" NEQ "%NOMBRE_ARCHIVO%" GOTO :tag_60_nombre_nuevo_script_aviso
GOTO :tag_59_nombre_nuevo_script_aviso_final

:tag_60_nombre_nuevo_script_aviso
    
    echo.
    echo ----------------------------------------------------
    echo No puedes poner puntos en el nombre del nuevo script
    echo ----------------------------------------------------
    echo.

GOTO :tag_36_inicio_nombre_nuevo_script

:tag_59_nombre_nuevo_script_aviso_final

REM Devuelve esta variable -- %NOMBRE_ARCHIVO% --

REM ------------------------ Final nuevo nombre del script que crearemos a partir de este -------------------------
REM ---------------------------------------------------------------------------------------------------------------