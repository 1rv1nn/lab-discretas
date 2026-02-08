-- TestPractica6.hs
-- To compile and run: runhaskell practica6_Test.hs

import Test.HUnit
import Practica6 

-- Sample Trees for Testing
arbolEjemplo :: Arbol Int
arbolEjemplo = AB 4 Vacio (AB 3 Vacio Vacio)

arbolReflejo :: Arbol Int
arbolReflejo = AB 3 (AB 6 (AB 10 Vacio Vacio) (AB 11 Vacio Vacio)) (AB 7 Vacio (AB 12 Vacio Vacio))

arbolBalanceado :: Arbol Int
arbolBalanceado = AB 5 (AB 3 (AB 1 Vacio Vacio) (AB 4 Vacio Vacio)) (AB 7 (AB 6 Vacio Vacio) Vacio)

arbolNoBalanceado :: Arbol Int
arbolNoBalanceado = AB 1 Vacio (AB 2 Vacio (AB 3 Vacio Vacio))

-- Test for nVacios
testNVacios :: Test
testNVacios = "nVacios" ~: TestList
    [ "Counts empty nodes in a small tree" ~: 3 ~=? nVacios arbolEjemplo
    , "Counts empty nodes in an empty tree" ~: 1 ~=? nVacios Vacio
    ]

-- Test for refleja
testRefleja :: Test
testRefleja = "refleja" ~:
    let arbolOriginal = AB 1 (AB 2 Vacio Vacio) (AB 3 Vacio Vacio)
        arbolEsperado = AB 1 (AB 3 Vacio Vacio) (AB 2 Vacio Vacio)
    in "Reflects a simple tree" ~: arbolEsperado ~=? refleja arbolOriginal

-- Test for minimo
testMinimo :: Test
testMinimo = "minimo" ~: TestList
    [ "Finds minimum in a complex tree" ~: 1 ~=? minimo arbolBalanceado
    , "Finds minimum in a simple tree" ~: 3 ~=? minimo arbolEjemplo
    ]
    -- Note: Testing the 'error' case for Vacio requires special handling.

-- Test for recorrido
testRecorrido :: Test
testRecorrido = "recorrido" ~: TestList
    [ "InOrden traversal"  ~: [1, 3, 4, 5, 6, 7] ~=? recorrido arbolBalanceado InOrden
    , "PreOrden traversal" ~: [5, 3, 1, 4, 7, 6] ~=? recorrido arbolBalanceado PreOrden
    , "PosOrden traversal" ~: [1, 4, 3, 6, 7, 5] ~=? recorrido arbolBalanceado PosOrden
    ]


-- Test for esBalanceado
testEsBalanceado :: Test
testEsBalanceado = "esBalanceado" ~: TestList
    [ "A balanced tree" ~: True ~=? esBalanceado arbolBalanceado
    , "An unbalanced tree" ~: False ~=? esBalanceado arbolNoBalanceado
    , "An empty tree is balanced" ~: True ~=? esBalanceado Vacio
    , "A more complex unbalanced tree" ~: False ~=? esBalanceado (AB 5 (AB 3 (AB 1 Vacio Vacio) (AB 4 Vacio Vacio)) (AB 7 (AB 6 Vacio Vacio) (AB 10 (AB 8 Vacio (AB 9 Vacio Vacio)) Vacio)))
    ]

-- Test for listaArbol
testListaArbol :: Test
testListaArbol = "listaArbol" ~: TestList
    [ "Creates a BST from a list" ~: AB 5 (AB 3 (AB 1 Vacio Vacio) Vacio) (AB 7 Vacio (AB 9 Vacio Vacio)) ~=? listaArbol [5,3,7,1,9]
    , "Creates an empty tree from an empty list" ~: Vacio ~=? listaArbol ([] :: [Int])
    ]

-- Test for balancear (Placeholder, assuming it gets implemented)
-- testBalancear :: Test
-- testBalancear = "balancear" ~:
--     let arbolEsperado = AB 2 (AB 1 Vacio Vacio) (AB 3 Vacio Vacio)
--     in "Balances an unbalanced tree" ~: arbolEsperado ~=? balancear arbolNoBalanceado

-- Main test runner
main :: IO Counts
main = runTestTT $ TestList
    [ testNVacios
    , testRefleja
    , testMinimo
    , testRecorrido
    , testEsBalanceado
    , testListaArbol
    ]