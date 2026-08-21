# Trabajo Práctico 01

Implemente todas las funciones declaradas en el archivo `src/Lib.hs`.

**IMPORTANTE:** No modifique los comentarios, ya que son casos de prueba. La implementación debe compilar sin errores ni advertencias, y deben pasar todos los casos de prueba.
No modifique ningún otro archivo del proyecto.

## Funciones a implementar

### `max' :: (Ord a) => a -> a -> a`

`max'` devuelve el máximo entre dos elementos que poseen una relación de
 orden

**Ejemplos:**

```haskell

>>> max' 0 1
1
>>> max' 1 0
1
>>> max' (-1) (-3)
-1
```

### `max3 :: (Ord a) => a -> a -> a -> a`

`max3` devuelve el valor máximo de tres elementos

**Ejemplos:**

```haskell

>>> max3 1 2 3
3
>>> max3 "ab" "ac" "aa"
"ac"
>>> max3 [1,2,3] [1,2] []
[1,2,3]
```

### `sum2 :: (Ord a, Num a) => a -> a -> a -> a`

`sum2` recibe tres números y devuelve la suma de los dos mayores

**Ejemplos:**

```haskell

>>> sum2 3 4 1
7
>>> sum2 4 7 9
16
>>> sum2 8 0 8
16
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

`fibo` calcula el enésimo número de Fibonacci \(F(n)\) donde
 \(F(n) = F(n-1) + F(n-2)\)

**Ejemplos:**

```haskell

>>> fibo 0
0
>>> fibo 1
1
>>> fibo 10
55
>>> fibo 34
5702887
```

### `square :: (Num a) => a -> a`

`square` calcula el cuadrado de un número

**Ejemplos:**

```haskell

>>> square 5
25
>>> square 5.0
25.0
>>> square 99
9801
```

### `pow :: (Integral a) => a -> a -> a`

`pow` x eleva un entero a una potencia entera. Si se invoca con un
 exponente negativo produce el error @Negative exponent@

**Ejemplos:**

```haskell

>>> pow 12 2
144
>>> pow 2 10
1024
>>> pow 3 0
1
>>> pow 2 (-1)
*** Exception: Negative exponent
...
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

`sumpowers` calcula la suma de la enésima potencia de los números en un
 rango. Si el rango no está vacío, y el exponente es negativo, produce el
 error @Negative exponent@

**Ejemplos:**

```haskell

>>> sumpowers 1 10 2
385
>>> sumpowers 1 10 0
10
>>> sumpowers 0 10 1
55
>>> sumpowers 1 0 5
0
>>> sumpowers 1 5 (-1)
*** Exception: Negative exponent
...
```

### `sumcubes :: (Ord a, Integral a) => a -> a -> a`

`sumcubes` calcula la suma de los cubos de los números en un rango.

**Ejemplos:**

```haskell

>>> sumcubes 1 10
3025
>>> sumcubes 0 0
0
>>> sumcubes 3 4
91
```

### `quadraticroots :: Double -> Double -> Double -> ((Double, Double), (Double, Double))`

`quadraticroots` calcula las raíces de la ecuación de segundo grado
 \(ax^2 + bx + c = 0\)

 Devuelve un par de pares, cada uno de los cuales representa un número
 complejo. Si el coeficiente `a` es cero, produce el error @bad equation@.

**Ejemplos:**

```haskell

>>> quadraticroots 1 4 3
((-1.0,0.0),(-3.0,0.0))
>>> quadraticroots 1 4 5
((-2.0,1.0),(-2.0,-1.0))
>>> quadraticroots 0 1 2
*** Exception: bad equation
...
```

### `not' :: Bool -> Bool`

`not'` implementa la función lógica "no"

**Ejemplos:**

```haskell

>>> not' (3 > 4)
True
>>> not' True
False
```

### `or' :: Bool -> Bool -> Bool`

`or'` implementa la función lógica "o"

 Debe implementarse sin usar las operaciones lógicas predefinidas

**Ejemplos:**

```haskell

>>> True `or'` True
True
>>> True `or'` False
True
>>> False `or'` True
True
>>> False `or'` False
False
```

### `xor' :: Bool -> Bool -> Bool`

`xor'` implementa la función lógica "o" exclusiva

 Debe implementarse sin usar las operaciones lógicas predefinidas

**Ejemplos:**

```haskell

>>> True `xor'` True
False
>>> True `xor'` False
True
>>> False `xor'` True
True
>>> False `xor'` False
False
```

### `and' :: Bool -> Bool -> Bool`

`and'` implementa la función lógica "y"

 Debe implementarse sin usar las operaciones lógicas predefinidas

**Ejemplos:**

```haskell

>>> True `and'` True
True
>>> True `and'` False
False
>>> False `and'` True
False
>>> False `and'` False
False
```
