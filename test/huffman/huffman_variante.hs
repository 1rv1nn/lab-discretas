import Auxiliar

{-
  Funcion: Huffman_Decodificador 
  Descripcion: Decodifica un binario y un arbol huffman a su cadena de texto
  Uso: Huffman_Decodificador ("1010010001",Nodo (Nodo (Nodo (Nodo Vacio 'a') 'l') 'o') 'h') = hola
-}
huffman_decodificador :: (String, Huffa) -> String
huffman_decodificador (frase,arbol) = decodificador frase arbol arbol

{-
  Funcion: Huffman_Codificador 
  Descripcion: Codifica una cadena de texto a una variante de codificacion huffman
  Uso: Huffman_Codificador "hola" = ("1010010001",Nodo (Nodo (Nodo (Nodo Vacio 'a') 'l') 'o') 'h')
-}
huffman_codificador :: String -> (String, Huffa)
huffman_codificador [] = ([],Vacio ) 
huffman_codificador frase = codificador frase
