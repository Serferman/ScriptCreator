@echo off  
net use * /delete /yes  
  
echo ------------------ BLOQUE 0 ------------------  
net use R: "\Documentos - Estudios\" /user:admin 87484579674907D11953626479FBF6545308CF8FE6377AF7970CD54BD760DCB4  
echo ----------------------------------------------  
  
echo ------------------ BLOQUE 1 ------------------  
SET CARPETA_RED=\\192.168.192.6\Documentos - Estudios\  
SET CARPETA_LOCAL=C:\Users\Sergio\Documents  
  
:tag_03_back1  
IF NOT EXIST C:\Users\Sergio\Documents GOTO :tag_01_inicio_bucle1  
GOTO :tag_02_final_bucle1  
  
:tag_01_inicio_bucle1  
  
    echo Creando la carpeta C:\Users\Sergio\Documents  
    mkdir C:\Users\Sergio\Documents  
    GOTO :tag_03_back1  
  
:tag_02_final_bucle1  
  
echo Copiando la carpeta local "C:\Users\Sergio\Documents" a la carpeta remota "\\192.168.192.6\Documentos - Estudios\"  
xcopy C:\Users\Sergio\Documents\* \\192.168.192.6\Documentos - Estudios\ /E /H /R /Y /I /D /C /F  
echo ----------------------------------------------  
  
echo ------------------ BLOQUE 2 ------------------  
net use T: "\Documentos - Miscelaneo\" /user:admin 87484579674907D11953626479FBF6545308CF8FE6377AF7970CD54BD760DCB4  
echo ----------------------------------------------  
  
