data Ent = Zero | Succ Ent | Neg Ent deriving ( Eq, Show)


suma_ent :: Ent -> Ent -> Ent
-- Casos Base (Identidad)
suma_ent Zero m = m
suma_ent n Zero = n

-- Casos Recursivos
suma_ent (Succ n) (Succ m) = Succ ( suma_ent n (Succ m ))
suma_ent (Neg n) (Neg m) = Neg (suma_ent n m)
suma_ent (Succ n) (Neg m) = resta_ent (Succ n) m
suma_ent (Neg n) (Succ m) = resta_ent (Succ m) n




resta_ent :: Ent -> Ent -> Ent
-- Casos Base
resta_ent n Zero = n
resta_ent Zero (Succ m) = Neg (Succ m)
resta_ent Zero (Neg m) = Succ m

-- Casos Recursivos
resta_ent (Succ n) (Succ m) = resta_ent n m 
resta_ent (Neg n) (Neg m) = resta_ent m n
resta_ent n (Neg m) = suma_ent n (Succ m) 
