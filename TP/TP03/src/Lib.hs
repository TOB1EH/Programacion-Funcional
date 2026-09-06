-- | Módulo que implementa funciones utilizando recursividad de cola
module Lib
  ( -- * Identificación del práctico
    name,

    -- * Funciones recursivas
    --
    -- | Todas las funciones siguientes deben ser implementadas utilizando
    -- recursividad de cola.
    factorial,
    fibo,
    length',
    maximum',
    minimum',
    pow,
    product',
    reverse',
    sum',
    sumcubes,
    sumpowers,
    sumsquares,
  )
where

-- | 'name' identifica al trabajo práctico
name :: String
name = "TP03"

-- Implemente todas las funciones usando recursividad de cola

-- | 'length'' devuelve la longitud de una lista finita como un entero (Int)
--
-- Ejemplos:
--
-- >>> length' "hola"
-- 4
-- >>> length' [1..10]
-- 10
-- >>> length' []
-- 0
length' :: [a] -> Int
length' xs = contar 0 xs
  where
    contar acc [] = acc
    contar acc (_:xs) = contar (acc + 1) xs

-- | 'sum'' calcula la suma de una lista finita de números
--
-- Ejemplos:
--
-- >>> sum' [1..1000]
-- 500500
-- >>> sum' [1000,999..1]
-- 500500
-- >>> sum' []
-- 0
sum' :: (Num a) => [a] -> a
sum' xs = sumar 0 xs
  where
    sumar acc [] = acc
    sumar acc (x:xs) = sumar (acc + x) xs

-- | 'product'' calcula el producto de una lista finita de números
--
-- Ejemplos:
--
-- >>> product' [1..10]
-- 3628800
-- >>> product' [10,9..1]
-- 3628800
-- >>> product' []
-- 1
product' :: (Num a) => [a] -> a
product' xs = multi 1 xs
 where
  multi acc [] = acc
  multi acc (x:xs) = multi (acc * x) xs

-- | 'reverse'' toma una lista y la invierte
--
-- Ejemplos:
--
-- >>> reverse' "Hola"
-- "aloH"
-- >>> reverse' []
-- []
-- >>> reverse' [1..10]
-- [10,9,8,7,6,5,4,3,2,1]
-- >>> reverse' (reverse' [1..10])
-- [1,2,3,4,5,6,7,8,9,10]
reverse' :: [a] -> [a]
reverse' xs = reverso [] xs
  where
    reverso acc [] = acc
    reverso acc (x:xs) = reverso (x : acc) xs

-- | 'maximum'' devuelve el máximo de una lista de elementos
--
-- Si la lista está vacía, produce el error "empty list"
--
-- Ejemplos:
--
-- >>> maximum' "Hola"
-- 'o'
-- >>> maximum' [1..10]
-- 10
-- >>> maximum' [1,3,5,0,9,7,4,2,8,6]
-- 9
-- >>> maximum' [-1,-3,0,-5]
-- 0
-- >>> maximum' []
-- *** Exception: empty list
-- ...
maximum' :: (Ord a) => [a] -> a
maximum' [] = error "empty list"
maximum' (x:xs) = maximo x xs
 where
  maximo x [] = x
  maximo x (y:xs) = maximo (max x y) xs

-- | 'minimum'' devuelve el minimo de una lista de elementos
--
-- Si la lista está vacía, produce el error "empty list"
--
-- Ejemplos:
--
-- >>> minimum' "Hola"
-- 'H'
-- >>> minimum' [1..10]
-- 1
-- >>> minimum' [1,3,5,0,9,7,4,2,8,6]
-- 0
-- >>> minimum' [-1,-3,0,-5]
-- -5
-- >>> minimum' []
-- *** Exception: empty list
-- ...
minimum' :: (Ord a) => [a] -> a
minimum' [] = error "empty list"
minimum' (x:xs) = minimo x xs
  where
    minimo x [] = x
    minimo x (y:xs) = minimo (min x y) xs

-- | 'factorial' calcula el factorial de un número entero (Integer)
--
-- Ejemplos:
--
-- >>> factorial 0
-- 1
-- >>> factorial 1
-- 1
-- >>> factorial 10
-- 3628800
-- >>> factorial 50
-- 30414093201713378043612608166064768844377641568960512000000000000
factorial :: Integer -> Integer
factorial n = fact 1 n
  where
    fact acc 0 = acc
    fact acc n = fact (acc * n) (n - 1)

-- | 'fibo' calcula el enésimo número de Fibonacci F(n) donde F(n) = F(n-1) + F(n-2)
--
-- Ejemplos:
--
-- >>> fibo 0
-- 0
-- >>> fibo 1
-- 1
-- >>> fibo 10
-- 55
-- >>> fibo 42
-- 267914296
fibo :: Integer -> Integer
fibo n = fib 0 1 n
  where
    fib a b 0 = a
    fib a b n = fib b (a + b) (n - 1)

-- | 'pow' x eleva un entero a una potencia entera
--
-- Ejemplos:
--
-- >>> pow 12 2
-- 144
-- >>> pow 2 10
-- 1024
-- >>> pow 3 0
-- 1
pow :: (Integral a) => a -> a -> a
pow x n = potencia 1 n
  where
    potencia acc 0 = acc
    potencia acc n = potencia (acc * x) (n - 1)

-- | 'sumsquares' calcula la suma de los cuadrados de los números en un rango
--
-- Ejemplos:
--
-- >>> sumsquares 1 10
-- 385
-- >>> sumsquares 5 4
-- 0
sumsquares :: (Ord a, Integral a) => a -> a -> a
sumsquares a b = sumas2 0 a b
  where
    sumas2 acc a b
      | a > b     = acc
      | a == b    = acc + pow a 2
      | otherwise = sumas2 (acc + pow a 2) (a + 1) b

-- | 'sumpowers' calcula la suma de la enésima potencia de los números en un rango
--
-- Ejemplos:
--
-- >>> sumpowers 1 10 2
-- 385
-- >>> sumpowers 1 10 0
-- 10
-- >>> sumpowers 0 10 1
-- 55
sumpowers :: (Ord a, Integral a) => a -> a -> a -> a
sumpowers a b n = sumaN 0 a b n
  where
    sumaN acc a b n
      | a > b = acc
      | a == b = acc + pow a n
      | otherwise = sumaN (acc + pow a n) (a + 1) b n

-- | 'sumcubes' calcula la suma de los cubos de los números en un rango
--
-- Ejemplos:
--
-- >>> sumcubes 1 10
-- 3025
-- >>> sumcubes 0 0
-- 0
-- >>> sumcubes 3 4
-- 91
sumcubes :: (Ord a, Integral a) => a -> a -> a
sumcubes a b = suma3 0 a b
  where
    suma3 acc a b
      | a > b = acc
      | a == b = acc + pow a 3
      | otherwise = suma3 (acc + pow a 3) (a + 1) b
