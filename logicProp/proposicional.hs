import Auxiliar
import Data.List

data Prop = T | F
          | Var Char
          | No Prop
          | Y Prop Prop
          | O Prop Prop
          | Implicacion Prop Prop
          | Syss Prop Prop deriving (Eq)


data ArbolSintaxis = Hoja String 
                  | Uni String ArbolSintaxis 
                  | Bin String ArbolSintaxis ArbolSintaxis 
                  deriving (Eq, Show)           

-- Azucar sintactica --

(&&&) :: Prop -> Prop -> Prop
(&&&) p q = Y p q
infixl 8 &&&

(|||) :: Prop -> Prop -> Prop
(|||) p q = O p q
infixl 7 |||

(==>) :: Prop -> Prop -> Prop
(==>) p q = Implicacion p q
infixr 6 ==>

(<=>) :: Prop -> Prop -> Prop
(<=>) p q = Syss p q
infixl 5 <=>

-- fin azucar sintactica ----

instance Show Prop where
  show T = "T"
  show F = "F"
  show (Var x) = [x]
  show (No p) = "No (" ++  show p ++ ")"
  show (Y p q) = "(" ++ show p ++ " &&& " ++ show q ++ ")"
  show (O p q) = "(" ++ show p ++ " ||| " ++ show q ++ ")"
  show (Implicacion p q) = "(" ++ show p ++ " ==> " ++ show q ++ " )"
  show (Syss p q) = "(" ++ show p ++ " <==> "++ show q ++ " )"




{- Función: arbolSintaxis
   Descripción: Construye el árbol de sintaxis de una fórmula proposicional.
   Uso_1: arbolSintaxis ((Var 'p') &&& (No (Var 'q'))) = Bin "Y" (Hoja "p") (Uni "No" (Hoja "q"))
   Uso_2: arbolSintaxis  ((No ((Var 'q') ==> (No (Var 's')))) ||| (No (No (Var 't'))))
-}

arbolSintaxis :: Prop -> ArbolSintaxis
arbolSintaxis T = Hoja "T"
arbolSintaxis F = Hoja "F"
arbolSintaxis (Var x) = Hoja [x]
arbolSintaxis (No p) = Uni "No" (arbolSintaxis p)
arbolSintaxis (Y p q) = Bin "Y" (arbolSintaxis p) (arbolSintaxis q)
arbolSintaxis (O p q) = Bin "O" (arbolSintaxis p) (arbolSintaxis q)
arbolSintaxis (Implicacion p q) = Bin "Implicacion" (arbolSintaxis p) (arbolSintaxis q)
arbolSintaxis (Syss p q) = Bin "Syss" (arbolSintaxis p) (arbolSintaxis q)




{- Función: vars 
   Descripción: Muestra las variables en una formula
   Uso: vars (((Var 'p') &&& (Var 'q')) ==> (Var 'r')) = p,q,r
-}

vars :: Prop -> [Char]
vars T = []
vars F = []
vars (Var x) = [x]
vars (No p) = vars p
vars (Y p q) = (vars p) `union` (vars q)
vars (O p q) = (vars p) `union` (vars q)
vars (Implicacion p q) = (vars p) `union` (vars q)
vars (Syss p q) = (vars p) `union` (vars q) 

 



{- Función: nAts 
   Descripción: Muestra el número de variables en una formula
   Uso: nAts ((Var 'p') &&& (Var 'q') ==> (Var 'r') ==> ( Var 'r' ||| Var 's' )) = 4
-}
nAts :: Prop -> Int
nAts T = 0
nAts F = 0
nAts (Var x) = 1
nAts (No p) = nAts p
nAts (Y p q) = contarLista ((vars p) `union` (vars q))
nAts (O p q) = contarLista ((vars p) `union` (vars q))
nAts (Implicacion p q) = contarLista ((vars p) `union` (vars q))
nAts (Syss p q) = contarLista ((vars p) `union` (vars q)) 


-- Función nAts con length
nAts_length :: Prop -> Int
nAts_length p = length (vars p)



{- Función: evalua 
   Descripción: Evalúa una fórmula proposicional dada una asignación True de valores de verdad para las variables
   Uso: evalua ((Var 'p' &&& Var 'q' ) ==> Var 'r') ['p','q'] = False
        evalua ((Var 'p') &&& (Var 'q')) ['p'] = False
        evalua ((Var 'p') ||| (Var 'q')) ['q'] = True

       
-}
 
evalua :: Prop -> [Char] -> Bool
evalua T _ = True
evalua F _ = False
evalua (Var x) [] = False
evalua (Var x) (y:l) = if (x == y ) then True else evalua (Var x) l
evalua (No p) l = not (evalua p l)  --- Representa toda la lista
evalua (Y p q) l = (evalua p l) && (evalua q l)
evalua (O p q) l = (evalua p l) || (evalua q l)
evalua (Implicacion p q) l = (not (evalua p l)) || (evalua q l)
evalua (Syss p q) l = (evalua p l) == (evalua q l)



{- Función: eliminarImplicaciones
   Descripción: Elimina las implicaciones usando equivalencias lógicas
   Uso: eliminarImplicaciones (Var 'p' ==> (Var 'q' && Var 'r')) = No (Var 'p') &&& (Var 'q' && Var 'r') = O (No (Var 'p')) (Y (Var 'q') (Var 'r'))
   ¿Por qué me regresa sin azucar sintactica?
-}

eliminarImplicaciones :: Prop -> Prop
eliminarImplicaciones (Implicacion p q) = O (No (eliminarImplicaciones p)) (eliminarImplicaciones q)
eliminarImplicaciones (Syss p q) = Y (eliminarImplicaciones (Implicacion p q)) (eliminarImplicaciones (Implicacion q p))
eliminarImplicaciones (No p) = No (eliminarImplicaciones p)
eliminarImplicaciones (Y p q) = Y (eliminarImplicaciones p) (eliminarImplicaciones q)
eliminarImplicaciones (O p q) = O (eliminarImplicaciones p) (eliminarImplicaciones q)
eliminarImplicaciones x = x



{- Función: aplicarLeyesDeMorgan
   Descripción: Distribuye la negación en una expresión.  
-}

aplicarLeyesDeMorgan :: Prop -> Prop
aplicarLeyesDeMorgan (No (Y p q)) = O (aplicarLeyesDeMorgan (No p )) (aplicarLeyesDeMorgan (No q))
aplicarLeyesDeMorgan (No (O p q)) = Y (aplicarLeyesDeMorgan (No p )) (aplicarLeyesDeMorgan (No q))
aplicarLeyesDeMorgan (No (No p)) = aplicarLeyesDeMorgan p
aplicarLeyesDeMorgan (No p) = No (aplicarLeyesDeMorgan p)
aplicarLeyesDeMorgan (Y p q) = Y (aplicarLeyesDeMorgan p) (aplicarLeyesDeMorgan q)
aplicarLeyesDeMorgan (O p q) = O (aplicarLeyesDeMorgan p) (aplicarLeyesDeMorgan q)
aplicarLeyesDeMorgan x = x