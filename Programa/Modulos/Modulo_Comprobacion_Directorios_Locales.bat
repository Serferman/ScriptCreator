@echo on

call Modulo_Comprobacion_Letra_Unidad_Local.bat
REM ESTE SCRIPT DEVUELVE UNA VARIABLE LLAMADA --------- %LETRA_UNIDAD_LOCAL% ---------
REM echo %LETRA_UNIDAD_LOCAL%

SET RUTA_LOCAL_COMPLETA=%LETRA_UNIDAD_LOCAL%
SET CONT=0

:tag_58_nuevo_array

dir %RUTA_LOCAL_COMPLETA% > Letra_Carpeta.txt

SET b=0
FOR /f "delims=" %%A IN ('type "Letra_Carpeta.txt" ^| Find "DIR"') DO (
        call :subRutina7 "%%A"
)

GOTO :tag_50_saltar_subRutina7

:subRutina7
    SET SALIDA_COMANDO=%1
    CALL SET CARPETAS_VALUE_FILTRADO=%SALIDA_COMANDO:*>=%
    CALL SET CARPETAS_VALUE_COMILLAS_FILTRADO=%CARPETAS_VALUE_FILTRADO:"=%
    CALL SET CARPETAS_VALUE_ESPACIOS_FILTRADO=%CARPETAS_VALUE_COMILLAS_FILTRADO: =%
    CALL SET "CARPETAS[%b%]=%CARPETAS_VALUE_ESPACIOS_FILTRADO%"
    SET /a b+=1
GOTO :eof

:tag_50_saltar_subRutina7
DEL Letra_Carpeta.txt

SET g=0
SET /a LIMITE_BUCLE3 = %b%-1
FOR /L %%Y IN (0,1,%LIMITE_BUCLE3%) DO (
        call :subRutina8 %%Y
        SET /a g+=1
)

GOTO :tag_51_saltar_subRutina8
                                
:subRutina8
    CALL SET "CARPETAS_VALUE=%%CARPETAS[%1]%%"
    echo %1 - %CARPETAS_VALUE%
GOTO :eof

:tag_51_saltar_subRutina8

echo.

:tag_54_comprobacion_bucle_carpeta
    SET /p CARPETA_PREGUNTA="¿Quieres crear la carpeta nueva en esta o en otra? | 1.- ESTA | 2.- OTRA |:"
IF %CARPETA_PREGUNTA% LSS 1 GOTO :tag_54_comprobacion_bucle_carpeta
IF %CARPETA_PREGUNTA% GTR 2 GOTO :tag_54_comprobacion_bucle_carpeta

IF %CARPETA_PREGUNTA%==1 GOTO :tag_52_esta_carpeta_local
IF %CARPETA_PREGUNTA%==2 GOTO :tag_53_otra_carpeta_local

:tag_53_otra_carpeta_local

    :tag_55_comprobacion_bucle_carpeta_elegida
        SET /p CARPETA_LOCAL="Introduce el numero de la carpeta elegida: "
    IF %CARPETA_LOCAL% LSS 1 GOTO :tag_55_comprobacion_bucle_carpeta_elegida
    IF %CARPETA_LOCAL% GTR %b% GOTO :tag_55_comprobacion_bucle_carpeta_elegida

    IF %CONT%==0 GOTO :tag_56_primer_enlace_carpeta
    GOTO :tag_57_siguientes_enlaces_carpetas

    :tag_56_primer_enlace_carpeta

        CALL SET "CARPETAS_VALUE_ESPACIOS_FILTRADO=%%CARPETAS[%CARPETA_LOCAL%]%%"
        echo %CARPETAS_VALUE_ESPACIOS_FILTRADO%
        SET RUTA_LOCAL_COMPLETA=%LETRA_UNIDAD_LOCAL%\%CARPETAS_VALUE_ESPACIOS_FILTRADO%
        SET /a CONT +=1

    GOTO :tag_58_nuevo_array

    :tag_57_siguientes_enlaces_carpetas

        CALL SET "CARPETAS_VALUE_ESPACIOS_FILTRADO=%%CARPETAS[%CARPETA_LOCAL%]%%"
        echo %CARPETAS_VALUE_ESPACIOS_FILTRADO%
        CALL SET RUTA_LOCAL_COMPLETA=%RUTA_LOCAL_COMPLETA%\%CARPETAS_VALUE_ESPACIOS_FILTRADO%
        echo %RUTA_LOCAL_COMPLETA%  

    GOTO :tag_58_nuevo_array
  
:tag_52_esta_carpeta_local

    ECHO %RUTA_LOCAL_COMPLETA%
GOTO :eof