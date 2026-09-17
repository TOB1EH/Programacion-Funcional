# Trabajo Práctico 05

Implemente todas las funciones declaradas en el archivo `src/Lib.hs` usando
`foldl`, `foldr`, `foldl'`, `foldl1`, `foldr1`, listas por comprensión o
una composición de funciones ya definidas.

**IMPORTANTE:** No modifique los comentarios, ya que son casos de prueba. La
implementación debe compilar sin errores ni advertencias, y deben pasar todos
los casos de prueba.
No modifique ningún otro archivo del proyecto.

## Funciones a implementar

### `length' :: [a] -> Int`

`length'` devuelve la longitud de una lista finita como un entero (Int)

**Ejemplos:**

```haskell

>>> length' "hola"
4
>>> length' [1..10]
10
>>> length' []
0
```

### `sum' :: (Num a) => [a] -> a`

`sum'` calcula la suma de una lista finita de números

**Ejemplos:**

```haskell

>>> sum' [1..1000]
500500
>>> sum' [1000,999..1]
500500
>>> sum' []
0
```

### `product' :: (Num a) => [a] -> a`

`product'` calcula el producto de una lista finita de números

**Ejemplos:**

```haskell

>>> product' [1..10]
3628800
>>> product' [10,9..1]
3628800
>>> product' []
1
```

### `reverse' :: [a] -> [a]`

`reverse'` toma una lista y la invierte

**Ejemplos:**

```haskell

>>> reverse' "Hola"
"aloH"
>>> reverse' []
[]
>>> reverse' [1..10]
[10,9,8,7,6,5,4,3,2,1]
>>> reverse' (reverse' [1..10])
[1,2,3,4,5,6,7,8,9,10]

prop> \xs -> xs == reverse' (reverse' xs)
+++ OK, passed 100 tests.
```

### `maximum' :: (Ord a) => [a] -> a`

`maximum'` devuelve el máximo de una lista de elementos

 Si la lista está vacía, produce el error "empty list"

**Ejemplos:**

```haskell

>>> maximum' "Hola"
'o'
>>> maximum' [1..10]
10
>>> maximum' [1,3,5,0,9,7,4,2,8,6]
9
>>> maximum' [-1,-3,0,-5]
0
>>> maximum' []
... empty list
...
```

### `minimum' :: (Ord a) => [a] -> a`

`minimum'` devuelve el minimo de una lista de elementos

 Si la lista está vacía, produce el error "empty list"

**Ejemplos:**

```haskell

>>> minimum' "Hola"
'H'
>>> minimum' [1..10]
1
>>> minimum' [1,3,5,0,9,7,4,2,8,6]
0
>>> minimum' [-1,-3,0,-5]
-5
>>> minimum' []
... empty list
...
```

### `map' :: (a -> b) -> [a] -> [b]`

`map'` toma una función y una lista y aplica esa función a cada elemento
 de la lista.

 Devuelve una nueva lista.

**Ejemplos:**

```haskell

>>> map' odd [1..10]
[True,False,True,False,True,False,True,False,True,False]
>>> map' (2*) [1..5]
[2,4,6,8,10]
>>> map' length ["uno", "dos", "tres", "cuatro"]
[3,3,4,6]
```

### `filter' :: (a -> Bool) -> [a] -> [a]`

`filter'` toma un predicado y una lista, y devuelve una nueva lista con
 los elementos para los cuales se cumple el predicado.

**Ejemplos:**

```haskell

>>> filter' odd [1..10]
[1,3,5,7,9]
>>> filter' (> 5) [6,5,1,8,9,0,3]
[6,8,9]
>>> filter' (< 0) [1..10]
[]
```

### `concat' :: [[a]] -> [a]`

`concat'` concatena una lista de listas

**Ejemplos:**

```haskell

>>> concat' [[1,2,3],[1],[],[5,0]]
[1,2,3,1,5,0]
>>> concat' ["Hola",", ","Haskell"]
"Hola, Haskell"
```

### `and' :: [Bool] -> Bool`

`and'` devuelve la conjunción de una lista de booleanos.
 Para que el resultado sea True, la lista debe ser finita.
 Para que sea False, debe haber un valor False en una posición finita
 de una lista finita o infinita.

**Ejemplos:**

```haskell

>>> and' [True, True, False]
False
>>> and' (replicate 100 True)
True
>>> and' (map (/=1000) [1..])
False
```

### `or' :: [Bool] -> Bool`

`or'` devuelve la disyunción de una lista de booleanos.
 Para que el resultado sea False, la lista debe ser finita.
 Para que sea True, debe haber un valor True en una posición finita
 de una lista finita o infinita.

**Ejemplos:**

```haskell

>>> or' [True, True, False]
True
>>> or' (replicate 100 False)
False
>>> or' (map (==1000) [1..])
True
```

### `any' :: (a -> Bool) -> [a] -> Bool`

`any'` toma un predicado y una lista y devuelve verdadero si el predicado
 se cumple para algún elemento de la lista.

**Ejemplos:**

```haskell

>>> any' odd [1..]
True
>>> any' odd [2,4..100]
False
>>> any' null ["uno", "dos", "tres", "cuatro"]
False
>>> any' even []
False
>>> any' (>1000) [1..]
True
```

### `all' :: (a -> Bool) -> [a] -> Bool`

`all'` toma un predicado y una lista y devuelve verdadero si el predicado
 se cumple para todos los elementos de la lista.

**Ejemplos:**

```haskell

>>> all' odd [1..]
False
>>> all' even [2,4..10]
True
>>> all' (not . null) ["uno", "dos", "tres", "cuatro"]
True
```

### `elem' :: (Eq a) => a -> [a] -> Bool`

`elem'` x xs devuelve verdadero si x está en xs y falso en caso contrario

**Ejemplos:**

```haskell

>>> 'o' `elem'` "Hola"
True
>>> 3 `elem'` [1..10]
True
>>> 0 `elem'` [1..1000]
False
>>> 9999 `elem'` [1..]
True
>>> 'h' `elem'` "Hola"
False
```

### `notElem' :: (Eq a) => a -> [a] -> Bool`

`notElem'` x xs devuelve falso si x está en xs y verdadero en caso
 contrario

**Ejemplos:**

```haskell

>>> 'o' `notElem'` "Hola"
False
>>> 3 `notElem'` [1..10]
False
>>> 0 `notElem'` [1..1000]
True
>>> 9999 `notElem'` [1..1000]
True
>>> 'h' `notElem'` "Hola"
True

prop> \x xs -> (x `elem'` xs) || (x `notElem'` xs)
+++ OK, passed 100 tests.

prop> \x xs -> not ((x `elem'` xs) && (x `notElem'` xs))
+++ OK, passed 100 tests.
```

### `find' :: (a -> Bool) -> [a] -> Maybe a`

`find'` recibe un predicado y una lista y devuelve el primer elemento de
 la lista que cumple ese predicado, o Nothing en caso contrario.

**Ejemplos:**

```haskell

>>> find' (>10) [1..5]
Nothing
>>> find' (>3) [1..5]
Just 4
```

### `sumsquares :: (Ord a, Integral a) => a -> a -> a`

`sumsquares` calcula la suma de los cuadrados de los números en un rango

**Ejemplos:**

```haskell

>>> sumsquares 1 10
385
>>> sumsquares 5 4
0
```

### `sumpowers :: (Ord a, Integral a) => a -> a -> a -> a`

`sumpowers` calcula la suma de la enésima potencia de los números en un rango

**Ejemplos:**

```haskell

>>> sumpowers 1 10 2
385
>>> sumpowers 1 10 0
10
>>> sumpowers 0 10 1
55
```

### `sumcubes :: (Ord a, Integral a) => a -> a -> a`

`sumcubes` calcula la suma de los cubos de los números en un rango

**Ejemplos:**

```haskell

>>> sumcubes 1 10
3025
>>> sumcubes 0 0
0
>>> sumcubes 3 4
91
```
