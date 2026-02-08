-- TestPractica3.hs
-- To compile and run: runhaskell TestPractica3.hs

import Test.HUnit
import Practica3 -- Assumes your functions are in a module named Practica3

-- Test for negativos
-- Counts the number of negative numbers in a list.
testNegativos :: Test
testNegativos = "negativos" ~: TestList
    [ "Counts negatives in a mixed list"    ~: 2 ~=? negativos [-1, 2, 4, 6, -4]
    , "Returns 0 for a list with no negatives" ~: 0 ~=? negativos [1, 2, 3, 4]
    , "Returns 0 for an empty list"            ~: 0 ~=? negativos []
    , "Counts all negatives in a list"         ~: 4 ~=? negativos [-1, -2, -3, -4]
    ]

-- Test for primos
-- Returns a list of prime numbers from a given list.
testPrimos :: Test
testPrimos = "primos" ~: TestList
    [ "Finds primes from 1 to 20" ~: [2, 3, 5, 7, 11, 13, 17, 19] ~=? primos [1..20]
    , "Returns an empty list if no primes are found" ~: [] ~=? primos [1, 4, 6, 8, 9]
    , "Returns an empty list for an empty input list" ~: [] ~=? primos []
    ]

-- Test for conjuntoLista
-- Removes duplicate elements from a list.
testConjuntoLista :: Test
testConjuntoLista = "conjuntoLista" ~: TestList
    [ "Removes duplicates from an integer list" ~: [1, 2, 3] ~=? conjuntoLista [1, 2, 2, 1, 3]
    , "Removes duplicates from an integer list" ~: [1, 2, 3, 5, 7, 9, 0] ~=? conjuntoLista [1, 2, 3, 5, 7, 7, 9, 0, 0]
    , "Handles a list with no duplicates"      ~: [1, 2, 3] ~=? conjuntoLista [1, 2, 3]
    , "Handles an empty list"                  ~: ([] :: [Int]) ~=? conjuntoLista []
    ]

-- Main test runner
main :: IO Counts
main = runTestTT $ TestList
    [ testNegativos
    , testPrimos
    , testConjuntoLista
    ]