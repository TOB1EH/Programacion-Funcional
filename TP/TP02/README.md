# Trabajo Práctico 02

Implemente todas las funciones declaradas en el archivo `src/Lib.hs`.

**IMPORTANTE:** No modifique los comentarios, ya que son casos de prueba. La implementación debe compilar sin errores ni advertencias, y deben pasar todos los casos de prueba.
No modifique ningún otro archivo del proyecto.

## Funciones a implementar

### `head' :: [a] -> a`

`head'` devuelve el primer elemento de una lista, que no puede ser vacia

Si la lista está vacía, produce el error "empty list"

**Ejemplos:**

```haskell

>>> head' "hola"
'h'
>>> head' [1..10]
1
>>> head' []
*** Exception: empty list
...
```

### `tail' :: [a] -> [a]`

`tail'` devuelve todos los elementos de una lista no vacia excepto el primero

 Si la lista está vacía, produce el error "empty list"

**Ejemplos:**

```haskell

>>> tail' "hola"
"ola"
>>> tail' [1..10]
[2,3,4,5,6,7,8,9,10]
>>> tail' []
*** Exception: empty list
...
```

### `last' :: [a] -> a`

`last'` toma una lista y devuelve su último elemento

 Si la lista está vacía, produce el error "empty list"

**Ejemplos:**

```haskell

>>> last' "hola"
'a'
>>> last' [1..10]
10
>>> last' []
*** Exception: empty list
...
```

### `init' :: [a] -> [a]`

`init'` toma una lista y devuelve todo excepto el último elemento

 Si la lista está vacía, produce el error "empty list"

**Ejemplos:**

```haskell

>>> init' "hola"
"hol"
>>> init' [1..10]
[1,2,3,4,5,6,7,8,9]
>>> init' []
*** Exception: empty list
...
```

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

### `null' :: [a] -> Bool`

`null'` devuelve verdadero si una lista está vacía y falso en caso contrario

**Ejemplos:**

```haskell

>>> null' "Hola"
False
>>> null' ""
True
>>> null' [1..]
False
>>> null []
True
```

### `(+++) :: [a] -> [a] -> [a]`

(+++) concatena dos listas

**Ejemplos:**

```haskell

>>> "Hola" +++ " mundo"
"Hola mundo"
>>> [1..10] +++ [10,9..1]
[1,2,3,4,5,6,7,8,9,10,10,9,8,7,6,5,4,3,2,1]
>>> [] +++ [1..10]
[1,2,3,4,5,6,7,8,9,10]
>>> [1..10] +++ []
[1,2,3,4,5,6,7,8,9,10]
>>> [] +++ []
[]
```

### `at :: [a] -> Int -> a`

`at` xs n devuelve el enésimo elemento de la lista (se comporta como (!!))

 Si n es negativo, produce el error "negative index".

 Si el índice es mayor o igual al tamaño de la lista, produce el error "index too large"

**Ejemplos:**

```haskell

>>> "Hola" `at` 1
'o'
>>> [1..] `at` 1000
1001
>>> "Hola" `at` 4
*** Exception: index too large
...
>>> [1..] `at` (-1)
*** Exception: negative index
...
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

### `take' :: Int -> [a] -> [a]`

`take'` n xs devuelve una lista con los primeros n elementos de xs

**Ejemplos:**

```haskell

>>> take' 3 "Hola"
"Hol"
>>> take' 5 "Hola"
"Hola"
>>> take' 0 [1..10]
[]
>>> take' 10 [1,3..]
[1,3,5,7,9,11,13,15,17,19]
```

### `drop' :: Int -> [a] -> [a]`

`drop'` n xs devuelve una lista en la que se han descartado los primeros
 n elementos de xs

**Ejemplos:**

```haskell

>>> drop' 3 "Hola"
"a"
>>> drop' 5 "Hola"
""
>>> drop' 0 "Hola"
"Hola"
>>> drop' 10 []
[]
>>> drop' 5 [1,3..15]
[11,13,15]
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
*** Exception: empty list
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
*** Exception: empty list
...
```

### `repeat' :: a -> [a]`

`repeat'` toma un elemento y devuelve una lista infinita de ese elemento

**Ejemplos:**

```haskell

>>> take 10 (repeat' 'x')
"xxxxxxxxxx"
>>> take 5 (repeat' 99)
[99,99,99,99,99]
>>> take 3 (repeat' [1,2])
[[1,2],[1,2],[1,2]]
>>> take 5 (repeat' [])
[[],[],[],[],[]]
>>> take 5 (repeat' "")
["","","","",""]
```

### `cycle' :: [a] -> [a]`

`cycle'` toma una lista no vacía y la reproduce infinitamente

 Si la lista está vacía, produce el error "empty list"

**Ejemplos:**

```haskell

>>> take 10 (cycle' "Hola")
"HolaHolaHo"
>>> take 10 (cycle' [1,2])
[1,2,1,2,1,2,1,2,1,2]
>>> take 10 (cycle' [])
*** Exception: empty list
...
```

### `replicate' :: Int -> a -> [a]`

`replicate` n x devuelve una lista con n copias de x

**Ejemplos:**

```haskell

>>> replicate' 10 'a'
"aaaaaaaaaa"
>>> replicate' 10 10
[10,10,10,10,10,10,10,10,10,10]
>>> replicate' 5 []
[[],[],[],[],[]]
```

### `fst' :: (a, b) -> a`

`fst'` devuelve el primer elemento de un par

**Ejemplos:**

```haskell

>>> fst' (1,2)
1
>>> fst' (True, 'a')
True
```

### `snd' :: (a, b) -> b`

`snd'` devuelve el segundo elemento de un par

**Ejemplos:**

```haskell

>>> snd' (1,2)
2
>>> snd' (True, 'a')
'a'
```

### `zip' :: [a] -> [b] -> [(a, b)]`

`zip'` recibe dos listas y devuelve una lista de pares

 La longitud de la lista resultante es la longitud de la lista de entrada
 más corta.

**Ejemplos:**

```haskell

>>> zip' ['a'..'f'] [1..]
[('a',1),('b',2),('c',3),('d',4),('e',5),('f',6)]
>>> zip' [1..] []
[]
>>> zip' [] [1..10]
[]
>>> zip' "Hola" "Haskell"
[('H','H'),('o','a'),('l','s'),('a','k')]
```

### `unzip' :: [(a, b)] -> ([a], [b])`

`unzip'` recibe una lista de pares y devuelve un par de listas

**Ejemplos:**

```haskell

>>> unzip' [('a',1),('b',2),('c',3),('d',4),('e',5),('f',6)]
("abcdef",[1,2,3,4,5,6])
>>> unzip' []
([],[])
>>> unzip' [('x',[])]
("x",[[]])
>>> unzip' [('H','H'),('o','a'),('l','s'),('a','k')]
("Hola","Hask")
```
