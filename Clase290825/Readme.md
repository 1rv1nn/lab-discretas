
## Modulos

 Reglas para construir un modulo
 
  1. Si quieres modular un archivo

	 `module NombreDelModulo (funciones) where` 
     
     Donde: 
	 - El nombre de un modulo debe empezar con mayusculas.
	 - `funciones` son el nombre de la funciones que vas a utilizar, deben ir separadas por comas.
     - El archivo a modular debe de tener el mismo nombre que el modulo.

  2. Al archivo donde haces llamar al modulo debe tener como encabezado la siguiente instrucción 
    
        `import NombreDelMOdulo`


 3. Para ejecutar un archivo modularizado y un archivo en el que importas este modulo en diferentes directorios:

    3.1. En el archivo a modular inserta:

    `module NombreDelDirectorio.NombreDelModulo (funciones) where`

    3.2. El archivo donde haces llamar a este modulo debe tener como encabezado la siguiente instrucción:

    `import NombreDelDirectorio.NombreDelModulo`

    3.3. (No funciona) Intepreta ambos archivos desde el directorio actual: 

    `ghci -i ../NombreDirectorioModulo/Modulo.hs archivo.hs`


    3.4. O tambien puedes intepretar ambos archivos desde el directorio raiz, con el siguiente comando:

    `ghci -iNombreDirectorioModulo NombreDirectorio/archivo.hs`
  
    En este caso puedes irte al directorio donde se encuentra todas los directorios de las clase y ejecutar el siguiente comando
	
	`ghci -iClase220825 Clase290825/nota.hs`
