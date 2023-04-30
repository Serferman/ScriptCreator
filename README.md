# ScriptCreator Batch
## Descripcion

<p> El enfoque de este proyecto es desarrollar un programa pequeño en Windows que nos permita generar scripts de batch (*.bat) para llevar a cabo diversas acciones, tales como asignar letras a las unidades locales para mapear carpetas remotas de nuestro servidor o copiar archivos de una carpeta local una carpeta remota. </p>

<p> Como resultado, se ha creado una plantilla que permite crear tareas/scripts personalizados para cada caso (Copiar o Mapear). </p>

<br>

<table>
  <tr align="center">
    <td><h3><b> Modulos </b></h3></td>
    <td><b> Variable </b></td>
  </tr>
  
  <tr>
    <td> Modulo_Comprobacion_Pregunta_Cantidad_Carpetas.bat </td>
    <td align="center"><b> %CANTIDAD_CARPETAS% </b></td>
  </tr>
  
  <tr>
    <td> Modulo_Comprobacion_Pregunta_Nombre_Nuevo_Script.bat </td>
    <td align="center"><b> %NOMBRE_ARCHIVO% </b></td>
  </tr>
  
  <tr>
    <td> Modulo_Comprobacion_IP.bat </td>
    <td align="center"><b> %RUTA_RED% </b></td>
  </tr>
 
  <tr>
    <td> Modulo_Comprobacion_Pregunta_Usuario.bat </td>
    <td align="center"><b> %USUARIO% </b></td>
  </tr>
  
  <tr>
    <td> Modulo_Comprobacion_Contraseña_Cifrado.bat </td>
    <td align="center"><b> %ENCRYPTED_PASSWORD% </b></td>
  </tr>
  
  <tr>
    <td> Modulo_Comprobacion_Pregunta_Mapear_Copiar.bat </td>
    <td align="center"><b> %MAPEO_O_COPIAR% </b></td>
  </tr>
  
  <tr>
    <td> Modulo_Comprobacion_Letra_Unidad_Remota.bat </td>
    <td align="center"><b> %LETRA_UNIDAD_REMOTA% </b></td>
  </tr>
  
  <tr>
    <td> Modulo_comprobacion_Letra_Unidad_Local.bat </td>
    <td align="center"><b> %LETRA_UNIDAD_LOCAL% </b></td>
  </tr>
  
  <tr>
    <td> Modulo_Comprobacion_Directorios_Remotos.bat </td>
    <td align="center"><b> %CARPETA_RED% </b></td>
  </tr>
  
  <tr>
    <td> Modulo_Comprobacion_Directorios_Locales.bat </td>
    <td align="center"><b> %RUTA_LOCAL_COMPLETA% </b></td>
  </tr>
  
<tr>
  <td> Modulo_Creacion_Nuevo_Script.bat </td>
  <td></td>
</tr>
  
<tr>
  <td> MainApp.bat </td>
  <td></td>
</tr>
  
</table>

<br>

## Diagrama de los Modulos
  <table>
    <tr>
      <td><img src="Recursos/Diagramas/Diagrama_Flujo_ModulosV3.png"/></td>
    </tr>
  </table>

  <br><br>
  
## Diagrama de Flujo
  <table>
    <tr>
      <td><img src="Recursos/Diagramas/DiagramaDeFlujoV2.png"/></td>
    </tr>
  </table>
  
  <br>
