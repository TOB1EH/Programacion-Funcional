# Trabajo Práctico 06

Este módulo consiste en la implementación de los tipos de dato `List` y `Pair`
Implemente todas las funciones declaradas en el archivo `src/Lib.hs`.

**IMPORTANTE:** No modifique los comentarios, ya que son casos de prueba. La
implementación debe compilar sin errores ni advertencias, y deben pasar todos
los casos de prueba.
No modifique ningún otro archivo del proyecto.


## Definición de Tipos de Datos

### `List`

El tipo de dato `List` es equivalente a una lista de Haskell:

```haskell
infixr 5 :::

data List a = Empty | a ::: List a deriving (Eq, Ord)
```

La función `show` debe definirse de tal forma que la representación
textual de la lista consista en los elementos de la lista, separados
por comas y rodeados por corchetes.

Ejemplos:

```haskell
>>> show (1 ::: 2 ::: 3 ::: Empty)
"[1,2,3]"
>>> show Empty
"[]"
```

### `Pair`

El tipo de dato `Pair` representa un par de datos de tipos arbitrarios:

```haskell
data Pair a b = Pair a b deriving (Eq, Ord)
```

La función `show` debe devolver una String con la representación de los dos
elementos del par, separados por una coma y encerrados entre paréntesis.

Ejemplos:

```haskell
>>> show (Pair True 3)
"(True,3)"
>>> show (Pair 'a' 4.4)
"('a',4.4)"
```

## Funciones a implementar

### `foldr' :: (a -> b -> b) -> b -> List a -> b`

`foldr'` aplicado a un operador binario, un valor inicial y una lista,
reduce la lista aplicando el operador de derecha a izquierda.

**Ejemplos:**

```haskell

>>> let l = 1 ::: 2 ::: 3 ::: 4 ::: Empty
>>> foldr' (+) 0 l
10
>>> foldr' (:) [] l
[1,2,3,4]
>>> foldr' (*) 1 Empty
1
```

### `foldl' :: (a -> b -> a) -> a -> List b -> a`

`foldl'` aplicado a un operador binario, un valor inicial y una lista,
reduce la lista aplicando el operador de izquierda a derecha.

**Ejemplos:**

```haskell

>>> let l = 1 ::: 2 ::: 3 ::: 4 ::: Empty
>>> foldl' (flip (:)) [] l
[4,3,2,1]
>>> foldl' (+) 0 l
10
>>> foldl' (*) 1 Empty
1
```

### `foldr1' :: (a -> a -> a) -> List a -> a`

`foldr1'` es una variante de `foldr'` que no toma un valor inicial
y por lo tanto no puede aplicarse sobre listas vacías.
Si la lista está vacía produce un error con el mensaje "empty list"

**Ejemplos:**

```haskell

>>> let l = 1 ::: 2 ::: 3 ::: 4 ::: Empty
>>> foldr1' min l
1
>>> foldr1' max l
4
>>> foldr1' max Empty
*** Exception: empty list
...
```

### `foldl1' :: (a -> a -> a) -> List a -> a`

`foldl1'` es una variante de `foldl'` que no toma un valor inicial
y por lo tanto no puede aplicarse sobre listas vacías.
Si la lista está vacía produce un error con el mensaje "empty list"

**Ejemplos:**

```haskell

>>> let l = 1 ::: 2 ::: 3 ::: 4 ::: Empty
>>> foldl1' min l
1
>>> foldl1' max l
4
>>> foldl1' max Empty
*** Exception: empty list
...
```

### `length' :: List a -> Int`

`length'` devuelve la longitud de una lista finita como un entero (`Int`).

**Ejemplos:**

```haskell

>>> let l = 1 ::: 2 ::: 3 ::: 4 ::: Empty
>>> length' l
4
>>> length' Empty
0
```

### `head' :: List a -> a`

`head'` devuelve el primer elemento de una lista, que no puede ser vacia

**Ejemplos:**

```haskell

>>> let l = 1 ::: 2 ::: 3 ::: 4 ::: Empty
>>> head' l
1
>>> head' Empty
... empty list
...
```

### `tail' :: List a -> List a`

`tail'` devuelve todos los elementos de una lista no vacia excepto el
 primero

**Ejemplos:**

```haskell

>>> let l = 1 ::: 2 ::: 3 ::: 4 ::: Empty
>>> tail' l
[2,3,4]
>>> tail' Empty
... empty list
...
```

### `last' :: List a -> a`

`last'` toma una lista y devuelve su último elemento

**Ejemplos:**

```haskell

>>> let l = 1 ::: 2 ::: 3 ::: 4 ::: Empty
>>> last' l
4
>>> last' Empty
*** Exception: empty list
...
```

### `init' :: List a -> List a`

`init'` toma una lista y devuelve todo excepto el último elemento

**Ejemplos:**

```haskell

>>> let l = 1 ::: 2 ::: 3 ::: 4 ::: Empty
>>> init' l
[1,2,3]
>>> init' Empty
... empty list
...
```

### `null' :: List a -> Bool`

`null'` devuelve verdadero si una lista está vacía y falso en caso
 contrario

**Ejemplos:**

```haskell

>>> null' (1 ::: Empty)
False
>>> null' Empty
True
```

### `(+++) :: List a -> List a -> List a`

`(+++)` concatena dos listas

**Ejemplos:**

```haskell

>>> let l = 1 ::: 2 ::: 3 ::: 4 ::: Empty
>>> l +++ l
[1,2,3,4,1,2,3,4]
>>> l +++ Empty
[1,2,3,4]
>>> Empty +++ l
[1,2,3,4]
>>> Empty +++ Empty
[]
```

### `at :: List a -> Int -> a`

`at` xs n devuelve el enésimo elemento de la lista (se comporta como !!)

**Ejemplos:**

```haskell

>>> let l = 1 ::: 2 ::: 3 ::: 4 ::: Empty
>>> at l 1
2
>>> l `at` 2
3
>>> l `at` (-1)
*** Exception: negative index
...
>>> l `at` 6
*** Exception: index too large
...
```

### `take' :: Int -> List a -> List a`

`take'` n xs devuelve una lista con los primeros n elementos de xs

**Ejemplos:**

```haskell

>>> let l = foldr (:::) Empty [1..]
>>> take' 10 l
[1,2,3,4,5,6,7,8,9,10]
>>> take' 10 (take' 5 l)
[1,2,3,4,5]
>>> take' 0 l
[]
>>> take' 10 Empty
[]
```

### `drop' :: Int -> List a -> List a`

`drop'` n xs devuelve una lista en la que se han descartado los primeros
 n elementos de xs

**Ejemplos:**

```haskell

>>> let l = foldr (:::) Empty [1..10]
>>> drop' 5 l
[6,7,8,9,10]
>>> drop' 0 l
[1,2,3,4,5,6,7,8,9,10]
>>> drop' 15 l
[]
>>> drop' 4 Empty
[]
```

### `sum' :: (Num a) => List a -> a`

`sum'` calcula la suma de una lista finita de números

**Ejemplos:**

```haskell

>>> let l = foldr (:::) Empty [1..100]
>>> sum' l
5050
>>> sum' Empty
0
```

### `product' :: (Num a) => List a -> a`

`product'` calcula el producto de una lista finita de números

**Ejemplos:**

```haskell

>>> let l = foldr (:::) Empty [1..10]
>>> product' l
3628800
>>> product' Empty
1
```

### `reverse' :: List a -> List a`

`reverse'` toma una lista y la invierte

**Ejemplos:**

```haskell

>>> let l = foldr (:::) Empty [1..10]
>>> reverse' l
[10,9,8,7,6,5,4,3,2,1]
>>> reverse' (reverse' l)
[1,2,3,4,5,6,7,8,9,10]
```

### `maximum' :: (Ord a) => List a -> a`

`maximum'` devuelve el máximo de una lista de elementos
 Si la lista está vacía produce un error con el mensaje "empty list"

**Ejemplos:**

```haskell

>>> let l = foldr (:::) Empty [1..10]
>>> maximum' l
10
>>> maximum' Empty
... empty list
...

prop> \x -> maximum' (x ::: Empty) == x
+++ OK, passed 100 tests.
```

### `minimum' :: (Ord a) => List a -> a`

`minimum'` devuelve el minimo de una lista de elementos
 Si la lista está vacía produce un error con el mensaje "empty list"

**Ejemplos:**

```haskell

>>> let l = foldr (:::) Empty ['a'..'z']
>>> minimum' l
'a'
>>> minimum' Empty
... empty list
...

prop> \x -> minimum' (x ::: Empty) == x
+++ OK, passed 100 tests.
```

### `repeat' :: a -> List a`

`repeat'` toma un elemento y devuelve una lista infinita de ese elemento.

**Ejemplos:**

```haskell

>>> take' 10 (repeat' 'x')
['x','x','x','x','x','x','x','x','x','x']
>>> repeat' 9 `at` 1000
9
```

### `cycle' :: List a -> List a`

`cycle'` toma una lista no vacía y la reproduce infinitamente.

**Ejemplos:**

```haskell

>>> let l = 1 ::: 2 ::: 3 ::: Empty
>>> take' 7 (cycle' l)
[1,2,3,1,2,3,1]
```

### `replicate' :: Int -> a -> List a`

`replicate' n x` devuelve una lista con `n` copias de `x`.

**Ejemplos:**

```haskell

>>> replicate' 10 'x'
['x','x','x','x','x','x','x','x','x','x']
>>> replicate' 5 (1 ::: Empty)
[[1],[1],[1],[1],[1]]
```

### `map' :: (a -> b) -> List a -> List b`

`map'` toma una función y una lista y aplica esa función a cada elemento
 de la lista.

 Devuelve una nueva lista.

**Ejemplos:**

```haskell

>>> let numbers = foldr (:::) Empty [1..10]
>>> let letters = foldr (:::) Empty ['a'..'j']
>>> map' (\x -> x*x) numbers
[1,4,9,16,25,36,49,64,81,100]
>>> map' succ letters
['b','c','d','e','f','g','h','i','j','k']
>>> map' succ Empty
[]
```

### `filter' :: (a -> Bool) -> List a -> List a`

`filter'` toma un predicado y una lista, y devuelve una nueva lista con
 los elementos para los cuales se cumple el predicado.

**Ejemplos:**

```haskell

>>> let numbers = foldr (:::) Empty [1..10]
>>> let letters = foldr (:::) Empty ['a'..'j']
>>> filter' odd numbers
[1,3,5,7,9]
>>> filter' (>'c') letters
['d','e','f','g','h','i','j']
>>> filter' (<0) numbers
[]
>>> filter' (\_ -> True) Empty
[]
```

### `concat' :: List (List a) -> List a`

`concat'` concatena una lista de listas

**Ejemplos:**

```haskell

>>> let l1 = foldr (:::) Empty [1..3]
>>> let l2 = foldr (:::) Empty [4..6]
>>> let l3 = foldr (:::) Empty [7..10]
>>> let listOfLists = l1:::l2:::l3:::Empty
>>> listOfLists
[[1,2,3],[4,5,6],[7,8,9,10]]
>>> concat' listOfLists
[1,2,3,4,5,6,7,8,9,10]
```

### `and' :: List Bool -> Bool`

`and'` devuelve la conjunción de una lista de booleanos.
 Para que el resultado sea True, la lista debe ser finita.
 Para que sea False, debe haber un valor False en una posición finita
 de una lista finita o infinita.

**Ejemplos:**

```haskell

>>> and' (replicate' 10 True)
True
>>> and' Empty
True
>>> and' (False:::Empty)
False
>>> and' (True:::True:::True:::False:::Empty)
False
```

### `or' :: List Bool -> Bool`

`or'` devuelve la disyunción de una lista de booleanos.
 Para que el resultado sea False, la lista debe ser finita.
 Para que sea True, debe haber un valor True en una posición finita
 de una lista finita o infinita.

**Ejemplos:**

```haskell

>>> or' (replicate' 10 False)
False
>>> or' Empty
False
>>> or' (map' (==1000) (foldr (:::) Empty [1..]))
True
```

### `any' :: (a -> Bool) -> List a -> Bool`

`any'` toma un predicado y una lista y devuelve verdadero si el predicado
 se cumple para algún elemento de la lista

**Ejemplos:**

```haskell

>>> any' odd Empty
False
>>> let numbers = foldr (:::) Empty [1..]
>>> any' (==1000) numbers
True
>>> any' (==1000) (take' 100 numbers)
False
```

### `all' :: (a -> Bool) -> List a -> Bool`

`all'` toma un predicado y una lista y devuelve verdadero si el predicado
 se cumple para todos los elementos de la lista

**Ejemplos:**

```haskell

>>> let numbers = foldr (:::) Empty [1..100]
>>> all' odd numbers
False
>>> all' (>0) numbers
True
>>> all' (>0) Empty
True
```

### `elem' :: (Eq a) => a -> List a -> Bool`

`elem'` x xs devuelve verdadero si x está en xs y falso en caso contrario

**Ejemplos:**

```haskell

>>> let numbers = foldr (:::) Empty [1..100]
>>> elem' 5 numbers
True
>>> 10 `elem'` numbers
True
>>> 0 `elem'` numbers
False
>>> 0 `elem'` Empty
False
```

### `notElem' :: (Eq a) => a -> List a -> Bool`

`notElem'` x xs devuelve falso si x está en xs y verdadero en caso contrario

**Ejemplos:**

```haskell

>>> let numbers = foldr (:::) Empty [1..100]
>>> notElem' 5 numbers
False
>>> 10 `notElem'` numbers
False
>>> 0 `notElem'` numbers
True
>>> 0 `notElem'` Empty
True
```

### `find' :: (a -> Bool) -> List a -> Maybe a`

`find'` recibe un predicado y una lista y devuelve el primer elemento de
 la lista que cumple ese predicado, o Nothing en caso contrario

**Ejemplos:**

```haskell

>>> find' (>10) (1:::2:::3:::5:::Empty)
Nothing
>>> find' (>1) (1:::2:::Empty)
Just 2
>>> find' even (1:::2:::3:::5:::Empty)
Just 2
>>> find' even Empty
Nothing
```

### `fst' :: Pair a b -> a`

`fst'` devuelve el primer elemento de un par

**Ejemplos:**

```haskell

>>> fst' (Pair 3 4)
3
>>> fst' (Pair True 'a')
True
>>> fst' (Pair Empty Nothing)
[]
```

### `snd' :: Pair a b -> b`

`snd'` devuelve el segundo elemento de un par

**Ejemplos:**

```haskell

>>> snd' (Pair 3 4)
4
>>> snd' (Pair True 'a')
'a'
>>> snd' (Pair Empty Nothing)
Nothing
```

### `zip' :: List a -> List b -> List (Pair a b)`

`zip'` recibe dos listas y devuelve una lista de pares

**Ejemplos:**

```haskell

>>> let numbers = foldr (:::) Empty [1..6]
>>> let letters = foldr (:::) Empty ['a'..'z']
>>> zip' numbers letters
[(1,'a'),(2,'b'),(3,'c'),(4,'d'),(5,'e'),(6,'f')]
>>> zip' numbers Empty
[]
>>> zip' Empty Empty
[]
```

### `unzip' :: List (Pair a b) -> Pair (List a) (List b)`

`unzip'` recibe una lista de pares y devuelve un par de listas

**Ejemplos:**

```haskell

>>> let pairs = foldr (:::) Empty (map (\x -> Pair x (odd x)) [1..5])
>>> pairs
[(1,True),(2,False),(3,True),(4,False),(5,True)]
>>> unzip' pairs
([1,2,3,4,5],[True,False,True,False,True])
>>> let numbers = foldr (:::) Empty [1..6]
>>> let letters = foldr (:::) Empty ['a'..'f']
>>> unzip' (zip' numbers letters) == Pair numbers letters
True
```

### `lookup' :: (Eq k) => k -> List (Pair k v) -> Maybe v`

`lookup'` busca una clave entre los primeros elementos de una lista de
 pares y devuelve el segundo elemento encerrado en un Just, o Nothing si
 no lo encuentra.

**Ejemplos:**

```haskell

>>> let numbers = foldr (:::) Empty [1..]
>>> let letters = foldr (:::) Empty ['a'..'z']
>>> let pairs = zip' letters numbers
>>> take' 9 pairs
[('a',1),('b',2),('c',3),('d',4),('e',5),('f',6),('g',7),('h',8),('i',9)]
>>> lookup' 'c' pairs
Just 3
>>> lookup' 'z' pairs
Just 26
>>> lookup' 'C' pairs
Nothing
>>> lookup' 'c' Empty
Nothing
```

### `zipWith' :: (a -> b -> c) -> List a -> List b -> List c`

`zipWith'` toma una función que acepta dos parámetros, y dos listas
 y devuelve una nueva lista que resulta unir las otras dos mediante la función

**Ejemplos:**

```haskell

>>> let numbers = foldr (:::) Empty [1..10]
>>> let twos = replicate' 10 2
>>> zipWith' (*) numbers (tail' numbers)
[2,6,12,20,30,42,56,72,90]
>>> zipWith' (**) numbers twos
[1.0,4.0,9.0,16.0,25.0,36.0,49.0,64.0,81.0,100.0]
>>> zipWith' (-) numbers numbers
[0,0,0,0,0,0,0,0,0,0]
>>> zipWith' (+) numbers Empty
[]
>>> zipWith' (*) Empty Empty
[]
```

### `takeWhile' :: (a -> Bool) -> List a -> List a`

`takeWhile'` toma un predicado y una función y devuelve el prefijo más
 largo de la lista para el cual se verifica el predicado

**Ejemplos:**

```haskell

>>> let numbers = foldr (:::) Empty [1..]
>>> let letters = foldr (:::) Empty ['a'..'z']
>>> takeWhile' (/=7) numbers
[1,2,3,4,5,6]
>>> takeWhile' (\x -> notElem x "frog") letters
['a','b','c','d','e']
>>> takeWhile' odd numbers
[1]
>>> takeWhile' even numbers
[]
>>> takeWhile' odd Empty
[]
```

### `dropWhile' :: (a -> Bool) -> List a -> List a`

`dropWhile'` toma un predicado y una función y descarta el prefijo más
 largo de la lista para el cual se verifica el predicado

**Ejemplos:**

```haskell

>>> let numbers = foldr (:::) Empty [1..10]
>>> let letters = foldr (:::) Empty ['a'..'z']
>>> dropWhile' (/=7) numbers
[7,8,9,10]
>>> dropWhile' (\x -> notElem x "stop") letters
['o','p','q','r','s','t','u','v','w','x','y','z']
>>> dropWhile' odd numbers
[2,3,4,5,6,7,8,9,10]
>>> dropWhile' even numbers
[1,2,3,4,5,6,7,8,9,10]
>>> dropWhile' odd Empty
[]
```

### `span' :: (a -> Bool) -> List a -> Pair (List a) (List a)`

`span'` toma un predicado p y una lista xs, y devuelve una tupla en la que
 el primer elemento contiene los primeros elementos de xs que satisfacen p,
 y el segundo elemento contiene el resto de la lista
 `span' p xs` es equivalente a `Pair (takeWhile' p xs) (dropWhile' p xs)`

**Ejemplos:**

```haskell

>>> let numbers = foldr (:::) Empty [1..10]
>>> span' (/=7) numbers
([1,2,3,4,5,6],[7,8,9,10])
>>> span' (==7) numbers
([],[1,2,3,4,5,6,7,8,9,10])
>>> span' odd numbers
([1],[2,3,4,5,6,7,8,9,10])
>>> span' even numbers
([],[1,2,3,4,5,6,7,8,9,10])
>>> span' odd Empty
([],[])
```

### `partition' :: (a -> Bool) -> List a -> Pair (List a) (List a)`

`partition'` toma un predicado y una lista y devuelve un par de listas
 la primera de los cuales contiene los elementos que satisfacen el predicado
 y la segunda los que no lo satisfacen.
 `partition' p xs == Pair (filter' p xs)  (filter' (not . p) xs)`

**Ejemplos:**

```haskell

>>> let numbers = foldr (:::) Empty [1..10]
>>> partition' (/=7) numbers
([1,2,3,4,5,6,8,9,10],[7])
>>> partition' (==7) numbers
([7],[1,2,3,4,5,6,8,9,10])
>>> partition' odd numbers
([1,3,5,7,9],[2,4,6,8,10])
>>> partition' even numbers
([2,4,6,8,10],[1,3,5,7,9])
>>> partition' odd Empty
([],[])
```

### `iterate' :: (a -> a) -> a -> List a`

`iterate'` toma una función y un valor inicial, y devuelve una lista
 infinita que resulta de la aplicación repetida de la función sobre el valor -- inicial

**Ejemplos:**

```haskell

>>> take' 10 (iterate' (*2) 1)
[1,2,4,8,16,32,64,128,256,512]
>>> take' 5 (iterate' (\x -> x*x) 2)
[2,4,16,256,65536]
>>> take' 5 (iterate' (\x -> succ(head' x):::x) ('a':::Empty))
[['a'],['b','a'],['c','b','a'],['d','c','b','a'],['e','d','c','b','a']]
```
