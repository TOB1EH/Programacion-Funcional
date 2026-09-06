# Trabajo Práctico 03

Implemente todas las funciones declaradas en el archivo `src/Lib.hs` **utilizando recursividad de cola**.

**IMPORTANTE:** No modifique los comentarios, ya que son casos de prueba. La implementación debe compilar sin errores ni advertencias, y deben pasar todos los casos de prueba.
No modifique ningún otro archivo del proyecto.

## Funciones a implementar

### `length' :: [a] -> Int`

Implemente todas las funciones usando recursividad de cola
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

### `factorial :: Integer -> Integer`

`factorial` calcula el factorial de un número entero (Integer)

**Ejemplos:**

```haskell

>>> factorial 0
1
>>> factorial 1
1
>>> factorial 10
3628800
>>> factorial 50
30414093201713378043612608166064768844377641568960512000000000000
```

### `fibo :: Integer -> Integer`

`fibo` calcula el enésimo número de Fibonacci F(n) donde F(n) = F(n-1) + F(n-2)

**Ejemplos:**

```haskell

>>> fibo 0
0
>>> fibo 1
1
>>> fibo 10
55
>>> fibo 42
267914296
```

### `pow :: (Integral a) => a -> a -> a`

`pow` x eleva un entero a una potencia entera

**Ejemplos:**

```haskell

>>> pow 12 2
144
>>> pow 2 10
1024
>>> pow 3 0
1
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
