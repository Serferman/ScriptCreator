@echo off

REM ---------------------------------------------------------------------------------------------------------------
REM ------------------------------ Comprobacion que la IP o FQDN del servidor existe ------------------------------

SET /p RUTA_RED="Introduce la IP o FQDN del servidor: "
echo.

SET CONTADOR_CAMBIAR_IP=0
SET CAMBIAR_IP=0

ping -n 1 %RUTA_RED% | find "TTL=" 
echo.

:tag_07_conexion_exitosa

IF %errorlevel%==0 GOTO :tag_08_comprobacion_general_conexion_exitosa
GOTO :tag_09_comprobacion_general_conexion_erronea

:tag_08_comprobacion_general_conexion_exitosa

    echo ---------------------------------------
    echo La conexion al servidor ha sido exitosa
    echo ---------------------------------------

GOTO :tag_10_final_bucle_comprobacion_general_conexion_exitosa

:tag_09_comprobacion_general_conexion_erronea   

    echo ----------------------------------
    echo La conexion al servidor ha fallado
    echo ----------------------------------

    :tag_03_mini_bucle_decision_cambiar_IP
    echo.
    SET /p CAMBIAR_IP="¿Quieres cambiar la direccion IP? | 1.- SI | 2.- NO |: "

    IF %CAMBIAR_IP% LSS 1 GOTO :tag_03_mini_bucle_decision_cambiar_IP
    IF %CAMBIAR_IP% GTR 2 GOTO :tag_03_mini_bucle_decision_cambiar_IP

    IF %CAMBIAR_IP% EQU 1 GOTO :tag_05_inicio_bucle_nueva_IP
    GOTO :tag_04_final_bucle_comprobacion_conexion_IP

        :tag_05_inicio_bucle_nueva_IP
        echo.
        SET /p RUTA_RED="Introduce una nueva IP o FQDN del servidor: "
        echo.

        ping -n 1 %RUTA_RED% | find "TTL="
        IF %errorlevel% NEQ 0 (
            echo ------------------------------
            echo La IP %RUTA_RED% es incorrecta
            echo ------------------------------
            GOTO :tag_03_mini_bucle_decision_cambiar_IP
        ) else (
            GOTO :tag_07_conexion_exitosa
        )
 
    :tag_04_final_bucle_comprobacion_conexion_IP

        echo.
        echo -------------------------------------------------------------------------------------------
        echo El programa terminó abruptamente, porque no se encontró una IP valida o decidio terminarlo.
        echo -------------------------------------------------------------------------------------------

        timeout 10
        exit

:tag_10_final_bucle_comprobacion_general_conexion_exitosa
echo.

REM Devuelve esta variable -- %RUTA_RED% --

REM --------------------------- Final comprobacion que la IP o FQDN del servidor existe ---------------------------
REM ---------------------------------------------------------------------------------------------------------------