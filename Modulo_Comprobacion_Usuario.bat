@echo off

REM ---------------------------------------------------------------------------------------------------------------
REM ------------------------------------------ Nombre del usuario remoto ------------------------------------------

:tag_36_inicio_nombre_usuario
    SET /p USUARIO="Introduce tu usuario remoto: "

IF "%USUARIO%"=="" GOTO :tag_36_inicio_nombre_usuario
IF "%USUARIO%"==" " GOTO :tag_36_inicio_nombre_usuario

REM --------------------------------------- Final nombre del usuario remoto ---------------------------------------
REM ---------------------------------------------------------------------------------------------------------------