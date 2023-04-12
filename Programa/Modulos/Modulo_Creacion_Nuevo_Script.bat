@echo on

REM ---------------------------------------------------------------------------------------------------------------
REM -------------------- Cantidad de bloques/carpetas que tendra nuestro script posteriormente --------------------

SET CONTADOR_BLOQUES=0

:tag_37_reinicio_bucle_principal_creacion_script
IF %CANTIDAD_CARPETAS% NEQ 0 GOTO :tag_38_inicio_bucle_principal_creacion_script
GOTO :tag_39_final_bucle_principal_creacion_script

    :tag_38_inicio_bucle_principal_creacion_script

    echo ------------------------------- PARAMETROS PARTICULARES DE CADA BLOQUE ---------------------------------
    echo.

    :tag_40_reiniciar_pregunta_mapeo_copiar
        SET /p MAPEO_O_COPIAR="¿Quieres MAPEAR la carpeta remota o COPIAR sus archivos a una carpeta local? | 1.- MAPEAR | 2.- COPIAR |:"
    IF %MAPEO_O_COPIAR% LSS 1 GOTO :tag_40_reiniciar_pregunta_mapeo_copiar
    IF %MAPEO_O_COPIAR% GTR 2 GOTO :tag_40_reiniciar_pregunta_mapeo_copiar

    IF %MAPEO_O_COPIAR%==1 GOTO :tag_41_mapeo_carpetas_remotas
    IF %MAPEO_O_COPIAR%==2 GOTO :tag_42_copiar_contenido_carpetas_remotas

    :tag_41_mapeo_carpetas_remotas

        echo.
        call .\Modulo_Comprobacion_Letra_Unidad_Remota.bat
        REM ESTE SCRIPT DEVUELVE UNA VARIABLE LLAMADA --------- %LETRA_UNIDAD_REMOTA% ---------
        REM echo %LETRA_UNIDAD_REMOTA%

        call .\Modulo_Comprobacion_Directorios_Remotos.bat
        REM ESTE SCRIPT DEVUELVE UNA VARIABLE LLAMADA ---------- %CARPETA_RED% ---------
        REM echo %CARPETA_RED%

        REM Mapeo de la carpeta en red a una unidad local, para ello necesitamos una letra de unidad.
        echo echo ------------------ BLOQUE %CONTADOR_BLOQUES% ------------------ >> %NOMBRE_ARCHIVO%
        echo net use %LETRA_UNIDAD_REMOTA% "%CARPETA_RED%" /user:%USUARIO% %password_hash% >> %NOMBRE_ARCHIVO%
        echo echo ---------------------------------------------- >> %NOMBRE_ARCHIVO%
        echo. >> %NOMBRE_ARCHIVO%
        SET /a CANTIDAD_CARPETAS -= 1
        SET /a CONTADOR_BLOQUES += 1

    GOTO :tag_37_reinicio_bucle_principal_creacion_script

    :tag_42_copiar_contenido_carpetas_remotas

        echo echo ------------------ BLOQUE %CONTADOR_BLOQUES% ------------------ >> %NOMBRE_ARCHIVO%
        REM Declaracion de la ruta y carpeta en red a una variable con el mismo nombre que la carpeta
        SET RUTA_REMOTA_COMPLETA=\\%RUTA_RED%%CARPETA_RED%
        echo SET CARPETA_RED=%RUTA_REMOTA_COMPLETA% >> %NOMBRE_ARCHIVO%

        call .\Modulo_Comprobacion_Directorios_Locales.bat
        REM ESTE SCRIPT DEVUELVE UNA VARIABLE LLAMADA --------- %RUTA_LOCAL_COMPLETA% ---------
        REM echo %RUTA_LOCAL_COMPLETA%

        call .\Modulos\Modulo_Comprobacion_Directorios_Remotos.bat
        REM ESTE SCRIPT DEVUELVE UNA VARIABLE LLAMADA ---------- %CARPETA_RED% ---------
        REM echo %CARPETA_RED%

        REM Declaracion de la ruta y carpeta local a una variable con el mismo nombre que la carpeta
        echo SET CARPETA_LOCAL=%RUTA_LOCAL_COMPLETA% >> %NOMBRE_ARCHIVO%

        REM -------------------------------------------Estructura---------------------------------------------
        @echo. >> %NOMBRE_ARCHIVO%
        echo :back%CONTADOR_BLOQUES% >> %NOMBRE_ARCHIVO%
        echo IF NOT EXIST %RUTA_LOCAL_COMPLETA% GOTO :inicio_bucle%CONTADOR_BLOQUES% >> %NOMBRE_ARCHIVO%
        echo GOTO :final_bucle%CONTADOR_BLOQUES% >> %NOMBRE_ARCHIVO%
        @echo. >> %NOMBRE_ARCHIVO%
        echo :inicio_bucle%CONTADOR_BLOQUES% >> %NOMBRE_ARCHIVO%
        echo echo Creando la carpeta %RUTA_LOCAL_COMPLETA% >> %NOMBRE_ARCHIVO%
        echo mkdir %RUTA_LOCAL_COMPLETA% >> %NOMBRE_ARCHIVO%
        @echo. >> %NOMBRE_ARCHIVO%
        echo GOTO :back%CONTADOR_BLOQUES% >> %NOMBRE_ARCHIVO%
        echo :final_bucle%CONTADOR_BLOQUES% >> %NOMBRE_ARCHIVO%
    
        REM --------------------------------------------COPIAR--------------------------------------------
        @echo. >> %NOMBRE_ARCHIVO%
        echo echo Copiando la carpeta local "%RUTA_LOCAL_COMPLETA%" a la carpeta remota "%RUTA_REMOTA_COMPLETA%" >> %NOMBRE_ARCHIVO%
        echo xcopy %RUTA_LOCAL_COMPLETA%\* %RUTA_REMOTA_COMPLETA% /E /H /R /Y /I /D /C /F >> %NOMBRE_ARCHIVO%
        echo echo ---------------------------------------------- >> %NOMBRE_ARCHIVO%
        @echo. >> %NOMBRE_ARCHIVO%

        SET /a CANTIDAD_CARPETAS -= 1
        SET /a CONTADOR_BLOQUES += 1

    GOTO :tag_37_reinicio_bucle_principal_creacion_script
    REM --------------------------- Finalización del bucle ---------------------------

:tag_39_final_bucle_principal_creacion_script

REM -------------------- Cantidad de bloques/carpetas que tendra nuestro script posteriormente --------------------
REM ---------------------------------------------------------------------------------------------------------------