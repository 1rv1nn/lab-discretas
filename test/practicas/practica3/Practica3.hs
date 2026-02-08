module Practica3 where


-- esto es para lo de los creditos
   creditos :: Int -> [String]
   creditos 10 = ["Algebra Superior 1", "Estructuras Discretas"]
   creditos 12 = ["Matematicas para las Ciencias Aplicadas 1", "Introduccion a las Ciencias de la Computacion"]
   creditos 4 = ["Ingles 1"]
   creditos _ = []

-- Cuenta cuantos negativos hay en una lista

   negativos:: [Int] -> Int
   negativos xs = length [x | x <- xs, x<0]

-- Esto es para calcular los primos

   primos :: [Int] -> [Int]
   primos xs = [x | x <- xs, esPrimo x]

   esPrimo :: Int -> Bool
   esPrimo n = n > 1 && null [d | d <- [2..n-1], n `mod` d==0]

-- es para eliminar los repetidos en una lista

   conjuntoLista :: (Eq a) => [a] -> [a]
   conjuntoLista [] = []
   conjuntoLista (x:xs) = x:conjuntoLista [y | y <- xs, y /=x]
