module Mati where
import Auxiliar

data Matrioska = Mati | Cont Matrioska deriving (Eq, Show)

{- Función: mayorIgual
Descripción: Compara 2 Matrioskas y regresa verdadero si la primera es mayor o igual a la segunda
Uso: mayorIgual (Cont(Cont Mati)) (Cont(Cont(Cont Mati))) = False
-}

mayorIgual :: Matrioska -> Matrioska -> Bool
mayorIgual Mati Mati = True
mayorIgual (Cont n) Mati = True
mayorIgual Mati (Cont m) = False
mayorIgual (Cont n) (Cont m) = mayorIgual n m

{- Función: aplana
Descripción: Recibe una Matrioska y regresa una lista de todas las Matrioskas dentro de la recibida 
Uso: aplana (Cont(Cont Mati)) = [ Cont ( Cont Mati ) , Cont Mati, Mati ]
-}

aplana :: Matrioska -> [Matrioska]
aplana Mati = [Mati]
aplana (Cont n) = (Cont n) :aplana n