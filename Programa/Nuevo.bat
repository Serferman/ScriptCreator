@echo off  
net use * /delete /yes  
  
echo ------------------ BLOQUE 0 ------------------  
net use R: "\Public\" /user:admin   
echo ----------------------------------------------  
  
echo ------------------ BLOQUE 1 ------------------  
SET CARPETA_RED=\\192.168.192.6\Public\  
SET CARPETA_LOCAL=\Users\Sergio\Documents  
  
:back1  
IF NOT EXIST \Users\Sergio\Documents GOTO :inicio_bucle1  
GOTO :final_bucle1  
  
:inicio_bucle1  
echo Creando la carpeta \Users\Sergio\Documents  
mkdir \Users\Sergio\Documents  
  
GOTO :back1  
:final_bucle1  
  
echo Copiando la carpeta local "\Users\Sergio\Documents" a la carpeta remota "\\192.168.192.6\Public\"  
xcopy \Users\Sergio\Documents\* \\192.168.192.6\Public\ /E /H /R /Y /I /D /C /F  
echo ----------------------------------------------  
  
echo ------------------ BLOQUE 2 ------------------  
net use T: "\Documentos - Miscelaneo\" /user:admin   
echo ----------------------------------------------  
  
