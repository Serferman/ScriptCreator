@echo off

REM ---------------------------------------------------------------------------------------------------------------
REM -------------------- Cantidad de bloques/carpetas que tendra nuestro script posteriormente --------------------

SET CONTADOR_BLOQUES=0

:tag_37_reinicio_bucle_principal_creacion_script
IF %CANTIDAD_CARPETAS% NEQ 0 GOTO :tag_38_inicio_bucle_principal_creacion_script
GOTO :tag_39_final_bucle_principal_creacion_script

    :tag_38_inicio_bucle_principal_creacion_script

    SET "PRESENTACION_PARAMETROS_PARTICULARES=%ComSpec% /C echo ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█████████████████ PARAMETROS PARTICULARES DE CADA BLOQUE ████████████████▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ "
                                                                
    cls
    %PRESENTACION_PARAMETROS_PARTICULARES%
    echo.

    call .\Modulos\Comprobaciones_Preguntas\Modulo_Comprobacion_Pregunta_Mapear_Copiar.bat
    REM ESTE SCRIPT DEVUELVE UNA VARIABLE LLAMADA --------- %MAPEO_O_COPIAR%---------
    REM echo %MAPEO_O_COPIAR%

    IF %MAPEO_O_COPIAR%==1 GOTO :tag_41_mapeo_carpetas_remotas
    IF %MAPEO_O_COPIAR%==2 GOTO :tag_42_copiar_contenido_carpetas_remotas

    :tag_41_mapeo_carpetas_remotas

        cls
        %PRESENTACION_PARAMETROS_PARTICULARES%
        echo.

        call .\Modulos\Comprobaciones_Generales\Modulo_Comprobacion_Letra_Unidad_Remota.bat
        REM ESTE SCRIPT DEVUELVE UNA VARIABLE LLAMADA --------- %LETRA_UNIDAD_REMOTA% ---------
        REM echo %LETRA_UNIDAD_REMOTA%
        
        cls
        %PRESENTACION_PARAMETROS_PARTICULARES%

        call .\Modulos\Comprobaciones_Generales\Modulo_Comprobacion_Directorios_Remotos.bat
        REM ESTE SCRIPT DEVUELVE UNA VARIABLE LLAMADA ---------- %CARPETA_RED% ---------
        REM echo %CARPETA_RED%

        REM Mapeo de la carpeta en red a una unidad local, para ello necesitamos una letra de unidad.
        echo echo ------------------------------------ BLOQUE %CONTADOR_BLOQUES% ------------------------------------ >> %RUTA_LOCAL_CREACION_SCRIPT%
        echo    net use %LETRA_UNIDAD_REMOTA% "\\%RUTA_RED%%CARPETA_RED%" /user:%USUARIO% %%DECRYPTED_PASSWORD%% >> %RUTA_LOCAL_CREACION_SCRIPT%
        echo echo ---------------------------------------------------------------------------------- >> %RUTA_LOCAL_CREACION_SCRIPT%
        echo. >> %RUTA_LOCAL_CREACION_SCRIPT%
        SET /a CANTIDAD_CARPETAS -= 1
        SET /a CONTADOR_BLOQUES += 1

        cls

    GOTO :tag_37_reinicio_bucle_principal_creacion_script

    :tag_42_copiar_contenido_carpetas_remotas

        echo echo ------------------------------------ BLOQUE %CONTADOR_BLOQUES% ------------------------------------ >> %RUTA_LOCAL_CREACION_SCRIPT%
        echo. >> %RUTA_LOCAL_CREACION_SCRIPT%
        REM Declaracion de la ruta y carpeta en red a una variable con el mismo nombre que la carpeta
        SET RUTA_REMOTA_COMPLETA=\\%RUTA_RED%%CARPETA_RED%
        echo    SET CARPETA_RED=%RUTA_REMOTA_COMPLETA% >> %RUTA_LOCAL_CREACION_SCRIPT%

        cls
        %PRESENTACION_PARAMETROS_PARTICULARES%

        call .\Modulos\Comprobaciones_Generales\Modulo_Comprobacion_Directorios_Locales.bat
        REM ESTE SCRIPT DEVUELVE UNA VARIABLE LLAMADA --------- %RUTA_LOCAL_COMPLETA% ---------
        REM echo %RUTA_LOCAL_COMPLETA%

        cls
        %PRESENTACION_PARAMETROS_PARTICULARES%

        call .\Modulos\Comprobaciones_Generales\Modulo_Comprobacion_Directorios_Remotos.bat
        REM ESTE SCRIPT DEVUELVE UNA VARIABLE LLAMADA ---------- %CARPETA_RED% ---------
        REM echo %CARPETA_RED%

        REM Declaracion de la ruta y carpeta local a una variable con el mismo nombre que la carpeta
        echo    SET CARPETA_LOCAL=%RUTA_LOCAL_COMPLETA% >> %RUTA_LOCAL_CREACION_SCRIPT%

        REM -------------------------------------------Estructura---------------------------------------------
        echo. >> %RUTA_LOCAL_CREACION_SCRIPT%
        echo    :tag_03_back%CONTADOR_BLOQUES% >> %RUTA_LOCAL_CREACION_SCRIPT%
        echo    IF NOT EXIST %RUTA_LOCAL_COMPLETA% GOTO :tag_01_inicio_bucle%CONTADOR_BLOQUES% >> %RUTA_LOCAL_CREACION_SCRIPT%
        echo    GOTO :tag_02_final_bucle%CONTADOR_BLOQUES% >> %RUTA_LOCAL_CREACION_SCRIPT%
        echo. >> %RUTA_LOCAL_CREACION_SCRIPT%
        echo    :tag_01_inicio_bucle%CONTADOR_BLOQUES% >> %RUTA_LOCAL_CREACION_SCRIPT%
        echo. >> %RUTA_LOCAL_CREACION_SCRIPT%
        echo        echo Creando la carpeta %RUTA_LOCAL_COMPLETA% >> %RUTA_LOCAL_CREACION_SCRIPT%
        echo        mkdir %RUTA_LOCAL_COMPLETA% >> %RUTA_LOCAL_CREACION_SCRIPT%
        echo        GOTO :tag_03_back%CONTADOR_BLOQUES% >> %RUTA_LOCAL_CREACION_SCRIPT%
        echo. >> %RUTA_LOCAL_CREACION_SCRIPT%
        echo    :tag_02_final_bucle%CONTADOR_BLOQUES% >> %RUTA_LOCAL_CREACION_SCRIPT%
    
        REM --------------------------------------------COPIAR--------------------------------------------
        echo. >> %RUTA_LOCAL_CREACION_SCRIPT%
        echo    echo Copiando la carpeta local "%RUTA_LOCAL_COMPLETA%" a la carpeta remota "%RUTA_REMOTA_COMPLETA%" >> %RUTA_LOCAL_CREACION_SCRIPT%
        echo    xcopy %RUTA_LOCAL_COMPLETA%\* %RUTA_REMOTA_COMPLETA% /E /H /R /Y /I /D /C /F >> %RUTA_LOCAL_CREACION_SCRIPT%
        echo. >> %RUTA_LOCAL_CREACION_SCRIPT%
        echo echo ---------------------------------------------------------------------------------- >> %RUTA_LOCAL_CREACION_SCRIPT%
        echo. >> %RUTA_LOCAL_CREACION_SCRIPT%

        SET /a CANTIDAD_CARPETAS -= 1
        SET /a CONTADOR_BLOQUES += 1

        cls

    GOTO :tag_37_reinicio_bucle_principal_creacion_script
    REM --------------------------- Finalización del bucle ---------------------------

:tag_39_final_bucle_principal_creacion_script

REM -------------------- Cantidad de bloques/carpetas que tendra nuestro script posteriormente --------------------
REM ---------------------------------------------------------------------------------------------------------------