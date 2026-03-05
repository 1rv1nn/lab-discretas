
## Modulos

Un módulo es una colección de funciones, tipos y clases de tipos relacionados. En un programa Haskell es una colección de módulos donde el módulo principal carga los otros módulos y luego usa las funciones definidas en ellos para hacer algo. Tener el código dividido trae principalmente dos ventajas.

1. Podemos estructurar nuestros scripts en fragmentos pequeños, separando pequeños grupos de funciones relacionadas en modulos separados.
   
2. Las funciones en un módulo compilado son mucho más rápidas de evaluar porque sus definiciones se compilan en código específico para la máquina, lo que conduce a un proceso de reducción mucho más eficiente. GHCi es un intérprete más que un compilador; evalúa formas internas de expresión que están mucho más cerca del lenguaje fuente de Haskell.


## Reglas para construir un modulo
 
  1. Si quieres modular un archivo agrega a la siguiente instrucción:

	 `module NombreDelModulo (funciones) where` 
     
     Donde: 
	 - El nombre de un modulo debe empezar con mayusculas.
	 - `funciones` son el nombre de la funciones que vas a utilizar, deben ir separadas por comas.
     - El archivo a modular debe de tener el mismo nombre que el modulo, empezando el nombre con mayuscula.

  2. Al archivo donde haces llamar al modulo debe tener como encabezado la siguiente instrucción 
    
        `import NombreDelModulo`


  3. Para ejecutar un archivo modularizado y un archivo en el que importas este modulo en el **mismo directorio**:

          ghci nombreArchivo.hs


 1. Para ejecutar un archivo modularizado y un archivo en el que importas este modulo en **diferentes directorios**:

      4.1. En el archivo a modular inserta:

    `module NombreDelModulo (funciones) where`

    3.2. El archivo donde haces llamar a este modulo debe tener como encabezado la siguiente instrucción:

    `import NombreDelModulo (funciones)`

    3.3. Intepreta el archivo donde utilizas el modulo desde el directorio actual: 

    `ghci -i../ruta_relativa_modulo/  archivo.hs`


    3.4. En este caso puedes descomentar la linea 1, posicionarte desde el directorio actual y ejecutar el siguiente comando. Verás que se cargan ambos modulos.
	
	  `ghci -i../IntroduccionHaskell_1/ nota.hs`
