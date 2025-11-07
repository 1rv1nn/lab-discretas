module Auxiliar where

contarLista :: [a] -> Int
contarLista [] = 0
contarLista (x:xs) = 1 + contarLista xs