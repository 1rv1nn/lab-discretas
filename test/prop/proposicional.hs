import Data.List
import Auxiliar

data Prop = T | F
           | Var Char
           | No Prop
           | Y Prop Prop
           | O Prop Prop
           | Implicacion Prop Prop
           | Syss Prop Prop  deriving (Eq, Show)

--Azucar sintactica


-- formula = (Var 'p') &&& (Var 'q') ==> (Var 'r')

(&&&) :: Prop -> Prop -> Prop
(&&&) p q = Y p q
infixl 8 &&&  -- infix left-asociativa (declaraciones directas al compilador/inteprete)   

(|||) :: Prop -> Prop -> Prop
(|||) p q = O p q
infixl 7 |||          
        


(==>) :: Prop -> Prop -> Prop
(==>) p q = Implicacion p q
infixr 6 ==>

(<=>) :: Prop -> Prop -> Prop
(<=>) p q = Syss p q
infixr 5 <=>

-- fin azucar sintactica


{- Función: vars 
   Descripción: Muestra las de variables en una formula
   Uso: vars ((Var 'p') &&& (Var 'q') ==> (Var 'r')) = p,q,r
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
 


-- Función nAts con length
nAts_length :: Prop -> Int
nAts_length p = length (vars p)

------ Segunda parte ---


{- Función: nAts 
   Descripción: Muestra el número de variables en una formula
   Uso: num_vars  num_vars ((Var 'p') &&& (Var 'q') ==> (Var 'r') ==> ( Var 'r' ||| Var 's' )) = 4
-}

nAts :: Prop -> Int
nAts T = 0
nAts F = 0
nAts (Var x ) = 1
nAts (No p) = nAts p 
nAts (Y p q) = contarLista ((vars p) `union` (vars q))
nAts (O p q) = contarLista ((vars p) `union` (vars q))
nAts (Implicacion p q) = contarLista ((vars p) `union` (vars q))
nAts (Syss p q) = contarLista ((vars p) `union` (vars q))








{- Función: evalua 
   Descripción: Evalúa una fórmula proposicional dada una asignación True de valores de verdad para las variables
   Uso: evalua ((Var 'p') &&& (Var 'q') ==> Var 'r') ['p','q'] = True
        evalua ((Var 'p') &&& (Var 'q')) ['p'] = False
        evalua ((Var 'p') ||| (Var 'q')) ['q'] = True
-}







{- Función: eliminarImplicaciones
   Descripción: Elimina las implicaciones usando equivalencias lógicas
-}









{- Función: 
   Descripción: 
-}



















{- Función: tablaVerdad
   Descripción: Genera todas las posibles asignaciones de verdad para las variables de una fórmula
   Uso: tablaVerdad (Var 'p' &&& Var 'q')
-}
