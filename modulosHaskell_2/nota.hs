-- import IntroduccionHaskell_1.Modulo
import Cuadrado

{- Función: leap
   Descripción: Determina si un año es biciesto o no
   Uso: leap 2004 = True
-}
 
leap :: Int -> Bool
leap x = (x `mod` 4 == 0) && (x `mod` 100 /= 0 || x `mod` 400 == 0 )


{- Función: leap_years
   Descripción: Determina el número de años que faltan a partir de x para una año biciesto.
   Uso: leap_years 2011 = 1   
-}


leap_years :: Int -> Int
leap_years x = 
  let year = x `mod` 4 -- ¿Hasta esta linea la función leap_years esta bien? ¿Qué pasa si mod == 0?
  in (4 - year) `mod` 4


-- ¿Qué otra implementación de la función leap_years se te ocurre? más corta y precisa?
-- leap_years x =   


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
       else cuadrado x + cuadrado y


-- Tuplas

{- Función: persona
   Descripción: Función que toma una tupla (nombre, edad, ciudad) y regrese la información en formato
   Uso: persona ("Irvin" 25 "CDMX") = Irvin tiene 25 años y reside en CDMX
-}

persona :: (String, Int, String) -> String
persona (nombre, edad, residencia) = nombre ++ " tiene " ++ show edad ++ " anios y reside en " ++ residencia





{- Función: age
   Descripción: Función que toma dos fechas. La primera de ellas tu cumpleaños, la segunda la fecha actual regresando tu edad y los dias.
   Nota: Una fecha se representa como (d, m, y)
   Uso: age ((6, 5, 2000), (29, 8, 2025)) = 25
   Uso_dos = age ((6, 5, 2000), (29, 8, 2025)) = (25, 53)
-}

age :: ((Int, Int, Int), (Int,Int,Int)) -> Int 
age  ((d1, m1, y1),(d2, m2, y2)) = y2 - y1



-- Puedes modificar la anterior función para regresar el Uso_dos