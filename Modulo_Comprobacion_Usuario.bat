@echo on

REM ---------------------------------------------------------------------------------------------------------------
REM -------------------- Cantidad de bloques/carpetas que tendra nuestro script posteriormente --------------------

:tag_36_inicio_nombre_usuario
    SET /p USUARIO="Introduce tu usuario remoto: "

IF "%USUARIO%"=="" GOTO :tag_36_inicio_nombre_usuario
IF "%USUARIO%"==" " GOTO :tag_36_inicio_nombre_usuario

REM ----------------- Final cantidad de bloques/carpetas que tendra nuestro script posteriormente -----------------
REM ---------------------------------------------------------------------------------------------------------------