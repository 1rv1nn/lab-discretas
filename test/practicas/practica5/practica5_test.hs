-- TestPractica5.hs
-- Para compilar y ejecutar: runhaskell practica5_test.hs

import Test.HUnit
import Practica5 

-- Prueba para hollerBack
testHollerBack :: Test
testHollerBack = "hollerBack" ~: TestList
    [ "Convierte 'haskell' a mayúsculas" ~: "HASKELL" ~=? hollerBack "haskell"
    , "Una cadena vacía no cambia"       ~: "" ~=? hollerBack ""
    , "Conserva mayúsculas existentes"   ~: "HOLA MUNDO" ~=? hollerBack "Hola Mundo"
    ]

-- Prueba para palindromo
testPalindromo :: Test
testPalindromo = "palindromo" ~: TestList
    [ "'ana' es un palíndromo"         ~: True ~=? palindromo "ana"
    , "'haskell' no es un palíndromo"  ~: False ~=? palindromo "haskell"
    , "'anitalavalatina' es un palíndromo"  ~: True ~=? palindromo "anitalavalatina"
    , "Una lista vacía es palíndromo"  ~: True ~=? palindromo ([] :: [Int])
    , "Lista numérica palíndromo"      ~: True ~=? palindromo [1, 2, 3, 2, 1]
    ]

-- Prueba para replica
testReplica :: Test
testReplica = "replica" ~: TestList
    [ "Replica 2 cinco veces" ~: [2, 2, 2, 2, 2] ~=? replica 2 5
    , "Replica un número 0 veces" ~: [] ~=? replica 10 0
    , "Replica un número una vez" ~: [7] ~=? replica 7 1
    ]

-- Prueba para recuperaElemento
testRecuperaElemento :: Test
testRecuperaElemento = "recuperaElemento" ~: TestList
    [ "Obtiene el elemento en el índice 1" ~: 4 ~=? recuperaElemento [2, 4, 6] 1
    , "Obtiene el primer elemento (índice 0)" ~: 1 ~=? recuperaElemento [1, 2, 3] 0
    , "Obtiene el último elemento" ~: 5 ~=? recuperaElemento [1, 2, 3, 4, 5] 4
    ]
    -- Nota: Probar los casos de error que usan `error` requiere un manejo especial
    -- que está fuera del alcance de las aserciones básicas de HUnit.

-- Prueba para rota
testRota :: Test
testRota = "rota" ~: TestList
    [ "Rota [1,2,3,4,5] dos veces" ~: [3, 4, 5, 1, 2] ~=? rota [1, 2, 3, 4, 5] 2
    , "Rotación mayor a la longitud de la lista" ~: [4, 5, 1, 2, 3] ~=? rota [1, 2, 3, 4, 5] 13
    , "Rotación negativa de -1" ~: [5, 1, 2, 3, 4] ~=? rota [1, 2, 3, 4, 5] (-1)
    , "Rotar una lista vacía" ~: ([]::[Int]) ~=? rota [] 5
    , "Rotar 0 veces no cambia la lista" ~: [1, 2, 3] ~=? rota [1, 2, 3] 0
    ]

-- Prueba para extranio 
testExtranio :: Test
testExtranio = "extranio" ~: TestList
    [ "Secuencia para n=6" ~: [6, 3, 10, 5, 16, 8, 4, 2, 1] ~=? extranio 6
    , "Secuencia para n=7" ~: [7, 22, 11, 34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1] ~=? extranio 7
    , "Caso base n=1" ~: [1] ~=? extranio 1
    ]


main :: IO Counts
main = runTestTT $ TestList
    [ testHollerBack
    , testPalindromo
    , testReplica
    , testRecuperaElemento
    , testRota
    , testExtranio
    ]