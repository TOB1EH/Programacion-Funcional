# Trabajo Práctico 04

Implemente todas las funciones declaradas en el archivo `src/Lib.hs`.

**IMPORTANTE:** No modifique los comentarios, ya que son casos de prueba. La implementación debe compilar sin errores ni advertencias, y deben pasar todos los casos de prueba.
No modifique ningún otro archivo del proyecto.

## Funciones a implementar

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

### `zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]`

`zipWith'` toma una función que acepta dos parámetros, y dos listas
 y devuelve una nueva lista que resulta unir las otras dos mediante la
 función.

**Ejemplos:**

```haskell

>>> zipWith' (+) [1..10] [10,9..1]
[11,11,11,11,11,11,11,11,11,11]
>>> zipWith' (*) [1..10] [1..]
[1,4,9,16,25,36,49,64,81,100]
>>> zipWith' (++) ["a", "b", "c"] ["1", "2", "3", "4"]
["a1","b2","c3"]
```

### `takeWhile' :: (a -> Bool) -> [a] -> [a]`

`takeWhile'` toma un predicado y una función y devuelve el prefijo más
 largo de la lista para el cual se verifica el predicado.

**Ejemplos:**

```haskell

>>> takeWhile' (< 3) [1,2,3,4,1,2,3,4]
[1,2]
>>> takeWhile' (< 9) [1,2,3]
[1,2,3]
>>> takeWhile' (< 0) [1,2,3]
[]
```

### `dropWhile' :: (a -> Bool) -> [a] -> [a]`

`dropWhile'` toma un predicado y una función y descarta el prefijo más
 largo de la lista para el cual se verifica el predicado.

**Ejemplos:**

```haskell

>>> dropWhile' (< 3) [1,2,3,4,5,1,2,3]
[3,4,5,1,2,3]
>>> dropWhile' (< 9) [1,2,3]
[]
>>> dropWhile' (< 0) [1,2,3]
[1,2,3]
```

### `span' :: (a -> Bool) -> [a] -> ([a], [a])`

`span'`, toma un predicado p y una lista xs, y devuelve una tupla en la que
 el primer elemento contiene los primeros elementos de xs que satisfacen p,
 y el segundo elemento contiene el resto de la lista.

**Ejemplos:**

```haskell

>>> span' (< 3) [1,2,3,4,1,2,3,4]
([1,2],[3,4,1,2,3,4])
>>> span' (< 9) [1,2,3]
([1,2,3],[])
>>> span' (< 0) [1,2,3]
([],[1,2,3])

@span' p xs@ es equivalente a @(takeWhile p xs, dropWhile p xs)@

prop> \xs -> span' odd xs == (takeWhile odd xs, dropWhile odd xs)
+++ OK, passed 100 tests.
```

### `partition' :: (a -> Bool) -> [a] -> ([a], [a])`

`partition'` toma un predicado y una lista y devuelve un par de listas
 la primera de los cuales contiene los elementos que satisfacen el predicado
 y la segunda los que no lo satisfacen.

**Ejemplos:**

```haskell

>>> partition' odd [1..10]
([1,3,5,7,9],[2,4,6,8,10])
>>> partition' (<5) [1..10]
([1,2,3,4],[5,6,7,8,9,10])
>>> partition' (<'l') "Hola"
("Ha","ol")
>>> partition' ((==6) . length) ["uno", "dos", "tres", "cuatro"]
(["cuatro"],["uno","dos","tres"])

@(partition' p xs)@ es equivalente a @(filter p xs, filter (not . p) xs)@

prop> \xs -> partition' odd xs == (filter odd xs, filter (not . odd) xs)
+++ OK, passed 100 tests.
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

### `iterate' :: (a -> a) -> a -> [a]`

`iterate'` toma una función y un valor inicial, y devuelve una lista infinita
 que resulta de la aplicación repetida de la función sobre el valor inicial.

**Ejemplos:**

```haskell

>>> take 10 (iterate' (*2) 1)
[1,2,4,8,16,32,64,128,256,512]
>>> take 5 (iterate' (\x -> x*x) 2)
[2,4,16,256,65536]
```
