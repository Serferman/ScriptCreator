@echo off

REM ---------------------------------------------------------------------------------------------------------------
REM -------------------------- Letra de la unidad en la que mapearemos la carpeta remota --------------------------

:tag_20_inicio_bucle_comprobacion_letra_unidad

echo ---------------------------------------------------------------------
echo AVISO: Debes introducir una letra diferente a las que aparecen debajo
echo ---------------------------------------------------------------------
echo.

SET v=0
wmic logicaldisk get caption > Unidades.txt

FOR /f "skip=1" %%A IN ('type "Unidades.txt"') DO (
    IF not "%%A"=="" (
        call :subRutina3 %%A
        SET /a v+=1
    )
)
echo.

goto :tag_21_saltar_subRutina

    :subRutina3
        fsutil fsinfo drivetype %1 | Find ":"
        CALL SET "COMPUTER[%v%]=%1"
    GOTO :eof

:tag_21_saltar_subRutina

DEL Unidades.txt

SET /p LETRA_UNIDAD="Introduce la LETRA que usaras para mapear la carpeta remota LOCALMENTE: " 
echo %LETRA_UNIDAD% > temp.txt

type temp.txt | FindStr /R /C:"[ABCDEFGHIJKLMNÑOPQRSTUVWXYZ]" > nul

IF errorlevel 1 GOTO :tag_22_error_minusculas_mayusculas
GOTO :tag_23_saltar_error_minusculas_mayusculas

:tag_22_error_minusculas_mayusculas

    echo.
    echo -----------------------------------------------------------------------------------
    echo ERROR: La letra que has introducido no es valida. Introduce solo letras mayusculas.
    echo -----------------------------------------------------------------------------------
    echo.
    del temp.txt
    GOTO :tag_20_inicio_bucle_comprobacion_letra_unidad

:tag_23_saltar_error_minusculas_mayusculas

del temp.txt
SET /a LIMITE_BUCLE3 = %v% - 1

FOR /L %%I IN (0,1,%LIMITE_BUCLE3%) DO (
        call :subRutina4 %%I
)

GOTO :tag_34_final_modulo

    :subRutina4
    call SET "LETRA_ARRAY=%%COMPUTER[%1]%%"

        IF %LETRA_ARRAY% EQU %LETRA_UNIDAD%: GOTO :tag_32_inicio_comprobaciones_letras_elegidas
        GOTO :tag_33_final_comprobaciones_letras_elegidas

        :tag_32_inicio_comprobaciones_letras_elegidas
            echo.
            echo ---------------------------------------------
            call echo ERROR: La letra escogida ya esta en uso.
            
            REM ==============================================================================================================================================
 
            IF %LETRA_UNIDAD%==C GOTO :tag_24_comprobacion_letra_C
            GOTO :tag_28_final_comprobacion_letra_C

            :tag_24_comprobacion_letra_C

                echo Letra "%LETRA_UNIDAD%:" reservada: Normalmente usada por la particion/disco duro principal del sistema operativo.
                echo ----------------------------------------------------------------------------------------------------
                echo.
                GOTO :tag_20_inicio_bucle_comprobacion_letra_unidad

            :tag_28_final_comprobacion_letra_C

            REM ==============================================================================================================================================
            
            IF %LETRA_UNIDAD%==D GOTO :tag_25_comprobacion_letra_D
            GOTO :tag_29_final_comprobacion_letra_D

            :tag_25_comprobacion_letra_D

                echo Letra "%LETRA_UNIDAD%:" reservada: Normalmente asignada a la particion/disco duro secundario o al lector de CD/DVD del sistema operativo.
                echo ----------------------------------------------------------------------------------------------------------------------------
                echo.
                GOTO :tag_20_inicio_bucle_comprobacion_letra_unidad

            :tag_29_final_comprobacion_letra_D

            REM ==============================================================================================================================================
 
            IF %LETRA_UNIDAD%==A GOTO :tag_26_comprobacion_letra_A
            GOTO :tag_30_final_comprobacion_letra_A

            :tag_26_comprobacion_letra_A

                echo Letra "%LETRA_UNIDAD%:" reservada ^(Obsoleta^): Antiguamente usada por el disquete principal ^del sistema.
                echo ---------------------------------------------------------------------------------------------
                echo.

            :tag_30_final_comprobacion_letra_A

            REM ==============================================================================================================================================
 
            IF %LETRA_UNIDAD%==B GOTO :tag_27_comprobacion_letra_B
            GOTO :tag_31_final_comprobacion_letra_B

            :tag_27_comprobacion_letra_B

                echo Letra "%LETRA_UNIDAD%:" reservada ^(Obsoleta^): Antiguamente usada por el disquete secundario ^del sistema.
                echo ----------------------------------------------------------------------------------------------
                echo.

            :tag_31_final_comprobacion_letra_B

            echo ---------------------------------------------
            echo.
            GOTO :tag_20_inicio_bucle_comprobacion_letra_unidad     
        
        :tag_33_final_comprobaciones_letras_elegidas
    GOTO :eof

:tag_34_final_modulo

SET LETRA_UNIDAD_REMOTA=%LETRA_UNIDAD%:

REM Devuelve esta variable -- %LETRA_UNIDAD_REMOTA% --

REM ----------------------- Final letra de la unidad en la que mapearemos la carpeta remota -----------------------
REM ---------------------------------------------------------------------------------------------------------------