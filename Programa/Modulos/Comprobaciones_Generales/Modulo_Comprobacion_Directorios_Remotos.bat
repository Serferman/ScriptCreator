@echo off

REM ---------------------------------------------------------------------------------------------------------------
REM -------------------- Ruta local donde se localizará la carpeta que crearemos posteriormente -------------------

SET "psCommand2=powershell -Command "$encrypted = '%ENCRYPTED_PASSWORD%' ; ^
    $password = ConvertTo-SecureString $encrypted -ErrorAction Stop ; ^
    $bstr = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($password) ; ^
    $plainPassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($bstr) ; ^
    Write-Output $plainPassword""

FOR /f "usebackq delims=" %%t IN (`%psCommand2%`) DO SET DECRYPTED_PASSWORD=%%t

NET USE \\%RUTA_RED% /user:%USUARIO% %DECRYPTED_PASSWORD% > nul

NET VIEW %RUTA_RED% | find "Disco" > listadoCarpetasRemotas.txt

REM Contamos la cantidad de lineas que tenemos en nuestro archivo y lo usamos de limitador 
for /f "delims=" %%E in ('type "listadoCarpetasRemotas.txt" ^| find /v /c ""') do set NUMERO_LINEAS=%%E

REM Creamos el array, que empieza en el 0 hasta el limite anteriormente definido, es decir %NUMERO_LINEAS%.
Set /a NUMERO_LINEAS-=1
Set i=0

FOR /f "tokens=1 delims=\" %%a IN ('type "listadoCarpetasRemotas.txt" ^| find "Disco"') DO (
    call :subRutina1 "%%a"
    SET /a i+=1 
) 

:subRutina1 

    SET COMPUTER[%i%]=%1
    IF %i% EQU %NUMERO_LINEAS% goto :end1
    GOTO :eof
:end1

DEL listadoCarpetasRemotas.txt

echo.

REM Mostramos el array creado anteriormente.
SET /a LIMITE_BUCLE1 = %i%
Set t=0

FOR /L %%i IN (0,1,%LIMITE_BUCLE1%) DO (
    FOR %%j IN (%%i) DO ( 
        call :subRutina2 %%j
        SET /a t+=1 
    )
)

goto :final_modulo

    :subRutina2

        CALL SET "COMPUTER_VALUE=%%COMPUTER[%1]%%"
        CALL SET COMPUTER_VALUE_FILTRADO=%COMPUTER_VALUE:"=%
        echo %1 - %COMPUTER_VALUE_FILTRADO%
        IF %t% EQU %NUMERO_LINEAS% goto :end2
        GOTO :eof
    :end2

    echo.

    :tag_11_inicio_bucle_comprobacion_carpeta_elegida
        SET /p PREGUNTA_CARPETA_RED="Introduce el NÚMERO correspondiente a la carpeta remota: "
    IF %PREGUNTA_CARPETA_RED% LSS 0 GOTO :tag_11_inicio_bucle_comprobacion_carpeta_elegida
    IF %PREGUNTA_CARPETA_RED% GTR %LIMITE_BUCLE1% GOTO :tag_11_inicio_bucle_comprobacion_carpeta_elegida


    call SET "SIN_FILTRAR_CARPETA_RED=%%COMPUTER[%PREGUNTA_CARPETA_RED%]%%"
    SET CON_0_FILTRADO_COMILLAS_CARPETA_RED=%SIN_FILTRAR_CARPETA_RED:"=%

    echo.

    SET CON_1_FILTRADO_ESPACIOS_CARPETA_RED=%CON_0_FILTRADO_COMILLAS_CARPETA_RED:  =%
    echo %CON_1_FILTRADO_ESPACIOS_CARPETA_RED% | find " Disco" > nul

    IF %errorlevel%==0 GOTO :tag_12_inicio_comprobacion_filtrado_con_espacios
    GOTO :tag_13_inicio_comprobacion_filtrado_sin_espacios

    :tag_12_inicio_comprobacion_filtrado_con_espacios

        echo %CON_1_FILTRADO_ESPACIOS_CARPETA_RED% | find ":" > nul
        
        IF %errorlevel%==0 GOTO :tag_15_inicio_comprobacion_existe_letra_unidad
        GOTO :tag_16_inicio_comprobacion_no_existe_letra_unidad

        :tag_15_inicio_comprobacion_existe_letra_unidad

            SET CON_2_FILTRADO_LETRA_CARPETA_RED=%CON_1_FILTRADO_ESPACIOS_CARPETA_RED:* Disco=%
            REM ----------------------------------------------------------------------------------
            CALL SET CON_3_FILTRADO_LETRA_CARPETA_RED=%%CON_1_FILTRADO_ESPACIOS_CARPETA_RED:%CON_2_FILTRADO_LETRA_CARPETA_RED%=%%
            REM ----------------------------------------------------------------------------------
            SET CON_3_FILTRADO_DISCO_CARPETA_RED=%CON_3_FILTRADO_LETRA_CARPETA_RED: Disco=%  
            REM ----------------------------------------------------------------------------------
            SET CARPETA_RED=%CON_3_FILTRADO_DISCO_CARPETA_RED:  =%
        
        GOTO :tag_14_final_comprobacion_filtrado
        
        :tag_16_inicio_comprobacion_no_existe_letra_unidad
            SET CARPETA_RED=%CON_1_FILTRADO_ESPACIOS_CARPETA_RED: Disco=%

    GOTO :tag_14_final_comprobacion_filtrado

    :tag_13_inicio_comprobacion_filtrado_sin_espacios
        
        REM SET CARPETA_RED=%CON_1_FILTRADO_CARPETA_RED:Disco=%
        echo %CON_1_FILTRADO_ESPACIOS_CARPETA_RED% | find ":" > nul
        
        IF %errorlevel%==0 GOTO :tag_15_inicio_comprobacion_existe_letra_unidad
        GOTO :tag_16_inicio_comprobacion_no_existe_letra_unidad

        :tag_15_inicio_comprobacion_existe_letra_unidad
        
            SET CON_2_FILTRADO_LETRA_CARPETA_RED=%CON_1_FILTRADO_ESPACIOS_CARPETA_RED:*Disco=%
            REM ----------------------------------------------------------------------------------
            CALL SET CON_3_FILTRADO_LETRA_CARPETA_RED=%%CON_1_FILTRADO_ESPACIOS_CARPETA_RED:%CON_2_FILTRADO_LETRA_CARPETA_RED%=%%
            REM ----------------------------------------------------------------------------------
            SET CON_3_FILTRADO_DISCO_CARPETA_RED=%CON_3_FILTRADO_LETRA_CARPETA_RED:Disco=%  
            REM ----------------------------------------------------------------------------------
            SET CARPETA_RED=%CON_3_FILTRADO_DISCO_CARPETA_RED:  =%
        
        GOTO :tag_14_final_comprobacion_filtrado

        :tag_16_inicio_comprobacion_no_existe_letra_unidad
            SET CARPETA_RED=%CON_1_FILTRADO_ESPACIOS_CARPETA_RED:Disco=%

    GOTO :tag_14_final_comprobacion_filtrado

    :tag_14_final_comprobacion_filtrado

SET CARPETA_RED=\%CARPETA_RED%

REM Devuelve esta variable -- %CARPETA_RED% --

:final_modulo

REM ----------------- Final ruta local donde se localizará la carpeta que crearemos posteriormente ----------------
REM ---------------------------------------------------------------------------------------------------------------
