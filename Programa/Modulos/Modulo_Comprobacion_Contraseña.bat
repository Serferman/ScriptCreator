@echo off

REM ---------------------------------------------------------------------------------------------------------------
REM -------------------- "Ruta local donde se localizará la carpeta que crearemos posteriormente" -------------------

echo.
echo Introduce tu contraseña:
SET "psCommand1=powershell -Command "$pword = read-host ' ' -AsSecureString ; ^
    $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword); ^
    [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
FOR /f "usebackq delims=" %%p IN (`%psCommand1%`) DO set password=%%p

echo.
SET ALGORITMO_PREDETERMINADO=SHA256
SET LISTA_ALGORITMOS=SHA512 SHA384 %ALGORITMO_PREDETERMINADO% SHA1 MACTripleDES MD5 RIPEMD160

:tag_20_inicio_bucle_comprobacion_opcion_algoritmo_elegido
    SET /p PREGUNTA_ALGORITMO="¿Quieres usar el algoritmo por defecto (%ALGORITMO_PREDETERMINADO%) o usar otro? | 1.- Defecto | 2.- Otro |:"
IF %PREGUNTA_ALGORITMO% LSS 1 GOTO :tag_20_inicio_bucle_comprobacion_opcion_algoritmo_elegido
IF %PREGUNTA_ALGORITMO% GTR 2 GOTO :tag_20_inicio_bucle_comprobacion_opcion_algoritmo_elegido

echo.

IF %PREGUNTA_ALGORITMO% EQU 1 GOTO :tag_17_comprobacion_algoritmo_defecto
IF %PREGUNTA_ALGORITMO% EQU 2 GOTO :tag_18_comprobacion_algoritmo_cambiado

:tag_17_comprobacion_algoritmo_defecto
    SET ALGORITMO=%ALGORITMO_PREDETERMINADO%
GOTO :tag_19_final_comprobacion_algoritmo_defecto

:tag_18_comprobacion_algoritmo_cambiado
    SET g=0
    setlocal EnableDelayedExpansion
    FOR %%t IN (%LISTA_ALGORITMOS%) DO (
        SET ARRAY_LISTA_ALGORITMOS[!g!]=%%t
        SET /a g+=1
    )

    SET /a LIMITE_BUCLE2 = %g% - 1
    FOR /L %%k IN (0,1,%LIMITE_BUCLE2%) DO (
        FOR %%m IN (%%k) DO ( 
            IF %%m==2 (
                call echo %%m - !ARRAY_LISTA_ALGORITMOS[%%m]! - Predeterminada
            ) else (
                call echo %%m - !ARRAY_LISTA_ALGORITMOS[%%m]!
            )
        )
    )

    echo.

    SET /p PREGUNTA_ALGORITMO_CAMBIADO="¿Que algoritmo quiere usar? : "
    SET ALGORITMO=!ARRAY_LISTA_ALGORITMOS[%PREGUNTA_ALGORITMO_CAMBIADO%]!

    setlocal DisableDelayedExpansion
GOTO :tag_19_final_comprobacion_algoritmo_defecto

:tag_19_final_comprobacion_algoritmo_defecto
SET password_hash=0
SET "psCommand2=powershell -Command "$stream = [System.IO.MemoryStream]::new(); ^
    $writer = [System.IO.StreamWriter]::new($stream); ^
    $writer.Write('%password%'); ^
    $writer.Flush(); ^
    $stream.Position = 0; ^
    $hash = (Get-FileHash -InputStream $stream -Algorithm '%ALGORITMO%').Hash; ^
    Write-Output $hash ""
FOR /f "usebackq delims=" %%r IN (`%psCommand2%`) DO set password_hash=%%r
REM echo %password_hash%
REM echo %password_hash% >> hash.txt

REM ----------------- "Final ruta local donde se localizará la carpeta que crearemos posteriormente" ----------------
REM ---------------------------------------------------------------------------------------------------------------