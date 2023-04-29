# ScriptCreator Batch
## Descripcion
<p> Este proyecto se centra en crear un pequeño programa en Windows, con el que podremos crear un script de batch (*.bat) que nos permita realizar mapeos de carpetas remotas de nuestro servidor a unidades locales, asignandoles una letra o copiar los archivos de una carpeta local a una de las carpetas remotas. </p>

<p> De esta forma se ha creado una plantilla para crear una tarea/script que realize las tareas, que hemos comentado antes, para cada caso que hayamos creado con esta herramienta. </p>

<br>

<table>
  <tr align="center">
    <td><b>Modulos</b></td>
    <td><b>Variable</b></td>
    <td><b>Breve descripción</b></td>
  </tr>
  
  <tr>
    <td> Modulo Comprobacion Pregunta Cantidad Carpetas </td>
    <td align="center"><b>%CANTIDAD_CARPETAS%</b></td>
    <td></td>
  </tr>
  
  <tr>
    <td> Modulo Comprobacion Pregunta Nombre Nuevo Script </td>
    <td align="center"><b>%NOMBRE_ARCHIVO%</b></td>
    <td></td>
  </tr>
  
  <tr>
    <td> Modulo Comprobacion IP </td>
    <td align="center"><b>%RUTA_RED%</b></td>
    <td></td>
  </tr>
 
  <tr>
    <td> Modulo Comprobacion Pregunta Usuario </td>
    <td align="center"><b>%USUARIO%</b></td>
    <td></td>
  </tr>
  
  <tr>
    <td> Modulo Comprobacion Contraseña Cifrado </td>
    <td align="center"><b>%PASSWORD_HASH%</b></td>
    <td></td>
  </tr>
  
  <tr>
    <td> Modulo Comprobacion Pregunta Mapear Copiar </td>
    <td align="center"><b>%MAPEO_O_COPIAR%</b></td>
    <td></td>
  </tr>
  
  <tr>
    <td> Modulo Comprobacion Letra Unidad Remota </td>
    <td align="center"><b>%LETRA_UNIDAD_REMOTA%</b></td>
    <td></td>
  </tr>
  
  <tr>
    <td>Modulo comprobacion Letra Unidad Local</td>
    <td align="center"><b>%LETRA_UNIDAD_LOCAL%</b></td>
    <td></td>
  </tr>
  
  <tr>
    <td> Modulo Comprobacion Directorios Remotos </td>
    <td align="center"><b>%CARPETA_RED%</b></td>
    <td></td>
  </tr>
  
  <tr>
    <td> Modulo Comprobacion Directorios Locales </td>
    <td align="center"><b>%RUTA_LOCAL_COMPLETA%</b></td>
    <td></td>
  </tr>
  
  <tr>
    <td>Modulo Creacion Nuevo Script</td>
    <td></td>
  </tr>
  
  <tr>
    <td> MainApp </td>
    <td></td>
  </tr>
</table>

<br>

## Diagrama de los Modulos
  <table>
    <tr>
      <td><img src="Recursos/Diagramas/Diagrama_Flujo_ModulosV2.png"/></td>
    </tr>
  </table>

  <br><br>
  
## Diagrama de Flujo
  <table>
    <tr>
      <td><img src="Recursos/Diagramas/DiagramaDeFlujoV1.png"/></td>
    </tr>
  </table>
  
  <br>
