-- import Cuadrado
import Clase220825.Modulo

{- Función: leap
   Descripción: Determina si un año es biciesto o no
   Uso: leap 2004 = False
-}

leap :: Int -> Bool
leap x = ( x `mod` 4 == 0) && (x `mod` 100 /= 0  || x `mod` 400 == 0)






{- Función: sumSqrt 
   Descripción: Toma tres números y regresa la suma de los cuadrados de los dos números más grandes.
   Uso: sumSqrt 4 2 6 = 52 
-}

sumSqrt :: Int -> Int -> Int -> Int
sumSqrt x y z =
  if x <= y && x <= z
  then cuadrado y + cuadrado z
  else if y <= x && y <= z
       then cuadrado x + cuadrado z
       else cuadrado x  + cuadrado y
       






-- Tuplas

{- Función: persona
   Descripción: Función que toma una tupla (nombre, edad, ciudad) y regrese la información formateada
   Uso: persona ("Irvin" 25 "CDMX") = Irvin tiene 25 años y reside en CDMX
-}

persona :: ( String, Int, String ) -> String
persona (nombre, edad, residencia) = nombre ++ " tiene " ++ show edad ++ " y reside en " ++ residencia




{- Función: age
   Descripción: Función que toma dos fechas. La primera de ellas tu cumpleaños, la segunda la fecha actual y devuelve tu edad - Los dias que tienes-.
   Nota: Una fecha se representa como (d, m, y)
   Uso: age ((6, 5, 2000), (29, 8, 2025)) = 25
   Uso_dos = age ((6, 5, 2000), (29, 8, 2025)) = (25, 53)
-}

age :: ((Int, Int, Int), (Int, Int, Int)) -> Int
age ((d, m, y), (d1, m2, y1)) = y1 - y