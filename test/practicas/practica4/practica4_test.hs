-- TestPractica4.hs
-- Para compilar y ejecutar: runhaskell practica4_test.hs
--
-- Asegúrate de que tus archivos se llamen:
-- 1. Auxiliar.hs (con "module Auxiliar where" al inicio)
-- 2. practica4.hs (con "module Practica4 where" al inicio)
-- 3. Mati.hs (con "module Mati where" al inicio)

import Test.HUnit
import Auxiliar
import Natural
import Mati

-- --- Helper Definitions for Natural Numbers ---
-- Definimos algunos naturales para facilitar la escritura de pruebas
n0 :: Natural
n0 = Cero
n1 :: Natural
n1 = S n0 -- 1
n2 :: Natural
n2 = S n1 -- 2
n3 :: Natural
n3 = S n2 -- 3
n5 :: Natural
n5 = S (S n3) -- 5
n6 :: Natural
n6 = S n5 -- 6
n9 :: Natural
n9 = S (S (S n6)) -- 9


-- --- Pruebas para Auxiliar.hs ---

testSumaNat :: Test
testSumaNat = "sumaNat" ~: TestList
    [ "Suma 3 + 2" ~: n5 ~=? sumaNat n3 n2
    , "Suma 3 + 0" ~: n3 ~=? sumaNat n3 n0
    , "Suma 0 + 2" ~: n2 ~=? sumaNat n0 n2
    ]

testMultiNat :: Test
testMultiNat = "multiNat" ~: TestList
    [ "Multiplica 3 * 2" ~: n6 ~=? multiNat n3 n2
    , "Multiplica 3 * 0" ~: n0 ~=? multiNat n3 n0
    , "Multiplica 0 * 2" ~: n0 ~=? multiNat n0 n2
    , "Multiplica 3 * 1" ~: n3 ~=? multiNat n3 n1
    ]

-- --- Pruebas para practica4.hs ---

testANatural :: Test
testANatural = "a_natural" ~: TestList
    [ "Convierte 2 a Natural" ~: n2 ~=? a_natural 2
    , "Convierte 0 a Natural" ~: n0 ~=? a_natural 0
    , "Convierte 3 a Natural" ~: n3 ~=? a_natural 3
    ]

testAEntero :: Test
testAEntero = "a_entero" ~: TestList
    [ "Convierte Natural 3 a Int" ~: 3 ~=? a_entero n3
    , "Convierte Cero a Int" ~: 0 ~=? a_entero n0
    , "Convierte Natural 2 a Int" ~: 2 ~=? a_entero n2
    ]

testPotenciaNat :: Test
testPotenciaNat = "potenciaNat" ~: TestList
    [ "Calcula 3^2" ~: n9 ~=? potenciaNat n3 n2
    , "Calcula 3^0" ~: n1 ~=? potenciaNat n3 n0
    , "Calcula 0^2" ~: n0 ~=? potenciaNat n0 n2
    , "Calcula 0^0" ~: n1 ~=? potenciaNat n0 n0 -- (0^0 es 1 por la definición)
    ]

testfacNat :: Test
testfacNat = "facNat" ~: TestList
    [ "Calcula 3!" ~: n6 ~=? facNat n3
    , "Calcula 0!" ~: n1 ~=? facNat n0
    , "Calcula 1!" ~: n1 ~=? facNat n1
    ]

-- --- Helper Definitions for Matrioskas ---
m0 :: Matrioska
m0 = Mati
m1 :: Matrioska
m1 = Cont m0
m2 :: Matrioska
m2 = Cont m1
m3 :: Matrioska
m3 = Cont m2

-- --- Pruebas para Mati.hs ---

testMayorIgual :: Test
testMayorIgual = "mayorIgual" ~: TestList
    [ "Mati >= Mati" ~: True ~=? mayorIgual m0 m0
    , "Cont Mati >= Mati" ~: True ~=? mayorIgual m1 m0
    , "Mati >= Cont Mati" ~: False ~=? mayorIgual m0 m1
    , "m2 >= m3" ~: False ~=? mayorIgual m2 m3
    , "m3 >= m2" ~: True ~=? mayorIgual m3 m2
    , "m2 >= m2" ~: True ~=? mayorIgual m2 m2
    ]

testAplana :: Test
testAplana = "aplana" ~: TestList
    [ "Aplana Mati" ~: [m0] ~=? aplana m0
    , "Aplana Cont Mati" ~: [m1, m0] ~=? aplana m1
    , "Aplana Cont (Cont Mati)" ~: [m2, m1, m0] ~=? aplana m2
    ]

-- --- Ejecutor Principal de Pruebas ---
main :: IO Counts
main = runTestTT $ TestList
    [ "Tests for Auxiliar" ~: TestList [testSumaNat, testMultiNat]
    , "Tests for Practica4" ~: TestList [testANatural, testAEntero, testPotenciaNat, testfacNat]
    , "Tests for Mati" ~: TestList [testMayorIgual, testAplana]
    ]