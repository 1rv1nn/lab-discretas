--Para las siguientes funciones ocuparemos funciones auxiliares ubicadas en Aux.hs
import Auxiliar

{-Funcion: frecuencia
Descripcion: recibe una cadena y regresa una lista de tuplas ordenada indicando su frecuencia.
Uso : frecuencia "Hola cara de bola" = [('a',4),(' ',3),('l',2),('o',2),('b',1),('e',1),('d',1),('r',1),('c',1),('H',1)]
-}

frecuencia :: String -> [(Char, Int)]
frecuencia "" = []
frecuencia (x:xs) = quicksort (frecuenciaAux (x:xs))

{-Funcion: arbolH
Descripcion: recibe una cadena y regresa el arbol de Huffman asociado
Uso : arbolH "Hola cara de bola" = Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo Vacio (Hoja 'H')) (Hoja 'c')) (Hoja 'r')) (Hoja 'd')) (Hoja 'e')) (Hoja 'b')) (Hoja 'o')) (Hoja 'l')) (Hoja ' ')) (Hoja 'a')
-}

arbolH :: String -> ArbolH
arbolH "" = Vacio
arbolH (x:xs) = creaArbol (frecuencia (x:xs))


{-Funcion: comprimir
Descripcion: recibe una cadena y regresa la cadena comprimida junto con su resectivo arbol.
Uso : comprime "hola" = ("0001001011",Nodo (Nodo (Nodo (Nodo Vacio (Hoja 'h')) (Hoja 'o')) (Hoja 'l')) (Hoja 'a'))
-}

comprime :: String -> (String, ArbolH)
comprime "" = ("", Vacio)
comprime (x:xs) = (comprimeAux (x:xs) (arbolH (x:xs)), arbolH (x:xs))

{-Funcion: decodificacion
Descripcion: recibe una cadena comprimida y su respectivo arbol y regresa la cadena decodificada.
Uso : descomprime "0001001011" (Nodo (Nodo (Nodo (Nodo Vacio (Hoja 'h')) (Hoja 'o')) (Hoja 'l')) (Hoja 'a')) = "hola"
-}

descomprime :: String -> ArbolH -> String
descomprime (x:xs) Vacio = error "Es necesario un arbol para realizar la decodificación"
descomprime [] (Nodo t1 t2) = error "No se puede decodificar una cadena vacia"
descomprime (x:xs) (Nodo t1 t2) = descomprimeAux (separa (x:xs) [] []) (Nodo t1 t2) 
