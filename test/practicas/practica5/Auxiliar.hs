module Auxiliar where

{--recursion de reverse--}
reverseRec :: [a] -> [a]
reverseRec [] = []
reverseRec (x:xs) = reverseRec xs ++ [x]

{--Para saber si es par--}
esPar :: Int -> Bool
esPar n = restoDos n == 0

{--mod sin usar mod--}
restoDos :: Int -> Int
restoDos n = n - dosPor (cuentaMitades n 0)

{--multiplicacion por 2--}
dosPor :: Int -> Int
dosPor 0 = 0
dosPor x = succ (succ (dosPor (x - 1)))

{--division--}
mitad :: Int -> Int
mitad n = cuentaMitades n 0

cuentaMitades :: Int -> Int -> Int
cuentaMitades n acc = if n < 2 then acc else cuentaMitades (n - 2) (succ acc)

{--multiplicacion por 3--}
triplica :: Int -> Int
triplica 0 = 0
triplica x = succ (succ (succ (triplica (x - 1))))

{--sumar 1--}
sumaUno :: Int -> Int
sumaUno x = succ x

{--algoritmo extranio--}
siguiente :: Int -> Int
siguiente n = if esPar n then mitad n else sumaUno (triplica n)