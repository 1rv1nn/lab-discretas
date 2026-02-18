# Lo que debes de saber antes de entrar al mundo de haskell


Las expresiones son la unidad más básica de un programa Haskell, y las funciones son un tipo específico de expresión. Las funciones en Haskell están relacionadas con las funciones matemáticas, es decir, mapean una entrada o un conjunto de entradas a una salida. Una función es una expresión que se aplica a un argumento y siempre devuelve un resultado. Dado que están compuestas exclusivamente por expresiones, siempre evaluarán el mismo resultado cuando se les proporcionen los mismos valores.


### Definición de funciones.

Las definiciones de funciones comparten algunas característicascomunes. En primer lugar, comienzan con el nombre de la función, despúes se indican los parámetros formales de la función, separados únicamente por espacios en blanco. A continuación, aparece un signo igual, que expresa la igualdad de los términos. Por último, hay una expresión que constituye el cuerpo de la función y que puede evaluarse para devolver un valor.

Ejemplo:

    mainHaskell = putStrLn "Hola mundo haskell"
    tiple x = x*3




## Basado en identación

En haskell define la estructura del código y se usa para evitarel uso de puntos y coma y llaves todo el tiempo. (Las sentencias then y else deben estar indentadas por esta razón. Si empiezan en la misma columna, serán instrucciones separadas, lo que sería incorrecto). 


	main = do putStrLn "What is 2 + 2?"
          x <- readLn
          if x == 4
              then putStrLn "You're right!"
              else putStrLn "You're wrong!"



En la función anterior, el primer carácter no blanco luego de do es especial. En este caso, es la p en putStrLn. Cada linea que empieza en la misma columna que la p es otra instrucción en el bloque do. Si se indenta más, se vuelve parte de la instrucción anterior. Si se indenta menos, se termina el bloque do

## Declaración explicita de tipos
En Haskell, el tipo de cada expresión se conoce en tiempo de compilación, lo que da lugar a un código más seguro. Si escribes un programa que intenta dividir un tipo booleano con un número,no se compilará. Esto es bueno porque es mejor detectar ese tipo de errores en tiempo de compilación, en lugar de que tu programa se bloquee más adelante. Todo en Haskell tiene un tipo, por lo que el compilador puede razonar bastante sobre tu programa antes de compilarlo.
A diferencia de Java o Pascal, Haskell tiene inferencia de tipos. Si escribimos un número, por ejemplo, no necesitamos decirlea Haskell que es un número, porque puede inferirlo por sí mismo. 

El operador `::` se leé como "Es de tipo". Los tipos explicitos estan siempre se denotan con la primera letra en mayusculas, 'a' es de tipo Char, que se entiende por carácter. `True` es un `Bool` o tipo booleano.

Las funciones también tienen tipo, cuando escribimos nuestras funciones, podemos elegir cual declaración explicita de tipos queremos. Esto es considerado como una buena práctica (excepto cuando escribes funciones muy cortas). En este curso a la mayoria de las funciones que hagamos tendrán declaraciones de tipos.

	sumaTres :: Int -> Int -> Int -> Int
	sumaTres x y z = x + y + z

### Layout

En ocasiones queremos producir tablas, números, imagenes, y una variedad de tipos más en formato de texto. haskell nos proveé la existencia de una función primitiva llamada `show` que imprime cadenas bajo el control que necesitemos, `show` toma un valor arbitrario como argumento y siempre que el valor este bien definido, lo convierte a una representación string. Por ejemplo, el valor de `(show n)` para un número n es la lista de carácteres que conforma la representación de n:

`show 42 = "42"`

De manera similar `(show b)` para un booleano b regresa la cadena que representa b:

`show True = "True"`


### Inmutabilidad.

Una vez que un valor se establece en datos (variable), será exactamente así para siempre. 

#### Ejemplo

      ejemplo :: Int
      ejemplo = 
          let x = 45
              y = x + 5   -- y usa x₁ = 45
          in let x = 51   -- Nueva x₂
                 z = x + 5  -- z usa x₂ = 51
              in y + z      -- y=50, z=56

        -- Resultado: 106
        -- y usa x₁=45 (no cambió)
        -- z usa x₂=51 (nueva variable)



### Tambien Haskell es compilado.

GHC tiene dos componentes principales: un intérprete interactivo (también conocido como GHCi) y un compilador de lotes, usando GHC. De hecho, GHC consta de un solo programa que se ejecuta con diferentes opciones para proporcionar el sistema interactivo o del lote. El sistema de ejecución (RST) es la JVM (Java Virtual Machine) de Haskell es decir cuando corres tu programa, GHC incluye invisiblemente un sistema que maneja cosas complejas como la memoria (Garbage Collector) y el manejo de hilos de procesamiento.

Para ejecutar un archivo Haskell (.hs) es necesario contar con la instrucción `main` bajo el siguiente comportamiento:

    main :: IO ()
    main = do
    -- Aqui haces llamar a todas tus funciones     
    putStrLn ("Triple de 5: " ++ show (triple 5))

Despúes de tener el anterior bloque de código, puedes compilarlo y ejecutarlo con las siguientes intrucciones:

    ghc nombre_archivo.hs
    ./nombre_archivo
