import Auxiliar


{- lista, recibe una cadena y regresa una lista de tuplas indicando su frecuencia.
   Uso: lista "Haskell" = [('h',1),('a',1),('s',1),('k',1),('e',1),('l',2)]
-}

lista :: String -> [(Char, Int)]
lista "" = []
lista (x:xs) = (x, frecuencia x (x:xs)): (lista [y | y <- xs, y /= x])



{-
ordenaLista = Ordena una lista de acuerdo a su frecuencia
Uso: ordenaLista 
-}

ordenaLista :: [(Char,Int)] -> [(Char,Int)]
ordenaLista xs = quicksort xs

{-
construirArbol. Constuye un árbol a partir de una lista ordenada.
Uso: construirArbol [('A', 5), ('R', 2), ('V', 1)] =  Nodo (Nodo (Nodo Vacio (Hoja 'V')) (Hoja 'R')) (Hoja 'A')
-}

construirArbol :: [(Char, Int)] -> HuffmanTree
construirArbol [] = Vacio
construirArbol ((c, n):xs) = Nodo (construirArbol xs) (Hoja c)

-- Caso Recursivo:
-- Tomamos el primer elemento (el de mayor frecuencia) (c, n)
-- y el resto de la lista (xs).
-- La hoja derecha será la 'Hoja c'.
-- La rama izquierda será el resultado de construir el árbol con 'xs'.



{-
  Recorrer el árbol para generar los códigos
  Uso: generarTabla (odo (Nodo (Nodo Vacio (Hoja 'R')) (Hoja 'E')) (Hoja 'B'))
-}
generarTabla :: HuffmanTree -> [(Char, String)]
generarTabla arbol = generarTablaAux arbol ""



-- Función principal de codificación
codificar :: String -> [(Char, String)] -> String
codificar [] _ = ""
codificar (c:cs) tabla =
  let codigoChar = buscarCodigo c tabla
  in codigoChar ++ (codificar cs tabla)




codificar_comprimir :: String -> (String, HuffmanTree)
codificar_comprimir texto =
  let frecs = lista texto
      frecsOrdenadas = ordenaLista frecs
      arbol = construirArbol frecsOrdenadas
      tabla = generarTabla arbol
      textoCodificado = codificar texto tabla
  in (textoCodificado, arbol)