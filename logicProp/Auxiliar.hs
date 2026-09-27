module Auxiliar where

-- Contar elementos de una lista.

contarLista :: [a] -> Int
contarLista [] = 0
contarLista (x:xs) = 1 + contarLista xs