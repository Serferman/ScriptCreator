@echo on

REM ---------------------------------------------------------------------------------------------------------------
REM -------------------------- Letra de la unidad en la que crearemos la carpeta local --------------------------

:tag_43_inicio_bucle_comprobacion_letra_unidad
SET v=0
wmic logicaldisk get caption > Unidades.txt
FOR /f "skip=1" %%A IN ('type "Unidades.txt"') DO (
    IF not "%%A"=="" (
        call :subRutina5 %%A
        SET /a v+=1
    )
)
echo.

goto :tag_44_saltar_subRutina

:subRutina5
    fsutil fsinfo drivetype %1 | Find ":"
    CALL SET "COMPUTER[%v%]=%1"
GOTO :eof

:tag_44_saltar_subRutina
DEL Unidades.txt

SET /p LETRA_UNIDAD="Introduce la LETRA de la unidad donde crearas la carpeta: " 
echo %LETRA_UNIDAD% > temp.txt

type temp.txt | FindStr /R /C:"[ABCDEFGHIJKLMNÑOPQRSTUVWXYZ]" > nul

echo.

IF errorlevel 1 GOTO :tag_45_error_minusculas_mayusculas
GOTO :tag_46_saltar_error_minusculas_mayusculas

:tag_45_error_minusculas_mayusculas
    echo -----------------------------------------------------------------------------------
    echo ERROR: La letra que has introducido no es valida. Introduce solo letras mayusculas.
    echo -----------------------------------------------------------------------------------
    echo.
    del temp.txt
    GOTO :tag_43_inicio_bucle_comprobacion_letra_unidad
:tag_46_saltar_error_minusculas_mayusculas

del temp.txt

SET VALIDACION=0
SET /a LIMITE_BUCLE3 = %v% - 1
FOR /L %%I IN (0,1,%LIMITE_BUCLE3%) DO (
        call :subRutina6 %%I
)

GOTO :tag_47_final_modulo

:subRutina6
call SET "LETRA_ARRAY=%%COMPUTER[%1]%%"

    IF %LETRA_ARRAY% EQU %LETRA_UNIDAD%: GOTO :tag_48_inicio_comprobaciones_letras_elegidas
    GOTO :tag_49_final_comprobaciones_letras_elegidas

    :tag_48_inicio_comprobaciones_letras_elegidas
        SET VALIDACION=1    

    :tag_49_final_comprobaciones_letras_elegidas
GOTO :eof

:tag_47_final_modulo

IF %VALIDACION%==0 GOTO :tag_43_inicio_bucle_comprobacion_letra_unidad

REM Devuelve la variable con la ruta raiz local ya construida.
SET LETRA_UNIDAD_LOCAL=%LETRA_UNIDAD%:

REM ------------------------ Final letra de la unidad en la que crearemos la carpeta local ------------------------
REM ---------------------------------------------------------------------------------------------------------------