# Lógica Proposicional

La lógica de proposiciones es un sistema formal cuyos elementosprincipales son frases declarativas, llamadas proposiciones. Sedistinguen dos constantes lógicas que representan los valores de verdad Falso (False) y Verdadero (True).Y también, incluye conectivos lógicos: negación (no), disyunción (o), conjunción (y),implicación (si..entonces) y equivalencia (si y solo si), mediante los cuales se pueden crear nuevas proposiciones más complejas.

En la primer parte de nuestro apartado nos enfocaremos en la sintaxis del lenguaje de la lógica proposicional, al cual crearemos un tipo da dato llamado `Prop` donde se establece las constantes y conectivos lógicos previamente mencionados.

## Azucar Sintactica.

Hicimos uso de esta práctica para hacer que la escritura y lectura de nuestras formulas proposicionales sea más intuitiva y natural.

Para ello hicimos uso de la precedencia y asociatividad de operadores de acuerdo a cada conectivo:

	
	(&&&) :: Prop -> Prop -> Prop
	(&&&) p q = Y p q
	infixl 8 &&&  -- infix left-asociativa (declaraciones direc    tas al compilador/inteprete) 
	
Donde la declaración `inflixl 8 &&&` le esta diciendo directamente al interprete que debe asociar a la izquierda `l` y de acuerdo a la precedencia en Haskell y por convención nuestro orden lógico debe comenzar desde 8. Puedes revisar la precedencia en Haskell [aqui](https://wiki.uqbar.org/wiki/articles/precedencia-de-los-operadores-mas-comunes-en-haskell.html)

- Sin azúcar sintáctica	

		Implicacion (Y (Var 'p') (Var 'q')) (Var 'r')

- Con azúcar sintáctica

		(Var 'p') &&& (Var 'q') ==> (Var 'r')
	

	

