## Funciones recursivas

Un problema complejo se resuelve reduciéndolo en uno o más subproblemas con la misma estructura que el problema original pero que son más pequeños y más simples de resolver que el problema original. A su vez cada subproblema se divide en subproblemas aún más simples pero con la misma estructura, así sucesivamente
hasta que los subproblemas sean tan sencillos que no haga falta dividirlos para resolverlos. La solución del problema inicial se obtiene combinando las soluciones de cada subproblema. A continuación se presentan ejemplos de funciones recursivas que involucran a los conjuntos definidos.

## Conjunto Naturales

El conjunto de los números naturales `Nat` se define recursivamente como:

**Caso Base:** 0 $\in$ `Nat`
**Caso Recursivo:** Si $x \in$ `Nat` entonces Suc(x) $\in$ `Nat`
**Caso Exclusión:** Sólo los elementos generados por el paso 1 y 2 son `Nat`

En Haskell declaramos nuestro propio tipo de dato `Nat` con dos contructores `Cero` y `S Natural` 

      data Natural = Cero | S Natural deriving (Eq, Show)

### Suma Naturales

**Caso Base:** SumaNat(Cero n) = Cero

      suma_nat Cero n = n

**Caso Recursivo:** SumaNat(Suc(m) ,n) = SumaNat(m,Suc(n))

      suma_nat (S m) n = suma_nat m (S n)

### Multiplicación Naturales

**Caso Base:** MultiplicaNat (Cero ,n) = 0

    multiplica_nat Cero n = Cero


**Caso Recursivo:** MultiplicaNat (Suc(m) ,n) = SumaNat(n, multiplicaNat(m,n))

    multiplica_nat (Suc m) n = suma_nat n (multiplica_nat m n)


## Conjunto Enteros

El conjunto de números Enteros, `Ent` se define recursicamente como:

**Caso Base:** $O \in$ `Ent`
**Caso Recursivo (+):** Si $x \in $ `Ent` entonces $Suc(x)$ `Ent`
**Caso Recursivo (-):** Si $x \in $ `Ent` entoces $Neg(n)$ $\in$ `Ent`

En esta estructura, un número negativo como $-3$ se representaría como $Neg(Suc(Suc(Suc(0))))$.

    data Ent = Zero | Succ Ent | Neg Ent deriving (Eq, Show)

### Suma Enteros.

#### Casos  Base (identidad).

    suma_ent Cero m = m
    suma_ent n Cero = n


 ¿Por qué? debido a la contrucción del conjunto y al tomar el cero como primer o segundo argumento, ejemplos:

  - Si tenemos 0 + 2 (Cero como primer argumento):
            
            suma_ent Cero (Succ (Succ Cero))
    identificamos que $m$ es (Succ (Succ Cero)) entoces nos regresa Suc (Suc Cero) 

  - Si tenemos  -1 + 0 (Cero como segundo argumento)  
 
          suma_ent (Neg (Suc Cero)) Cero

     identificamos que -1 es n asi que nos regresa Neg(Succ Cero)  

#### Casos Recursivos         