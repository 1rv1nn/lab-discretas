# Mensajes de Error más comunes y su interpretación en GHCi.

1.     error: Variable not in scope:

Implica que no encuentra la variable a utilizar en tu función dada, por lo regular se trata de que el nombre es incorrecto o no se guardo de manera adecuada el archivo.       

2.     error: parse error (possibly incorrect indentation or mismatched brackets)

Cuida la identación de tu código, lo adecuado son dos espacios o un tab. 

3.     error:
        No instance for (Floating (Double -> Double))
        arising from a use of 'it'
        (maybe you haven't applied a function to enough arguments?)

     Tú función esta recibiendo más parametros de los que debe. Ejemplo de una función erronea:
         
        sin sin 0.5   

     Esta llamando a `sin` con dos argumentos `sin` y `0.5` pero `sin` solo acepta un argumento. 

        sin (sin 0.5)

4.     ghci> 3 +4)
        <interactive>:1:5: parse error on input `)'

  GHCi está mostrando un error en la línea 1: el carácter ')' en la posición 5 es inesperado; en otras palabras, la expresión no es sintácticamente correcta.    
