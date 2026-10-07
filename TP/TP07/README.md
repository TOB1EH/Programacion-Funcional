# Trabajo Práctico 07

Implemente todas las funciones/clases/métodos según las especificaciones.

**IMPORTANTE:** No modifique los comentarios, ya que son casos de prueba. La implementación debe compilar sin errores ni advertencias, y deben pasar todos los casos de prueba.
No modifique ningún otro archivo del proyecto.

## Especificaciones en `practico/Practico7.scala`

## Objeto compañero `Practico7`

Práctico 7

### `def length[T](xs: List[T]): Int`

Calcula la longitud de la lista xs

Si bien puede resolverse mediante distintas técnicas, en este caso se
podrán utilizar los siguientes métodos de la clase `List`:

  - `xs.isEmpty: Boolean` devuelve `true` si la lista `xs` está vacía
  - `xs.head: T` devuelve el primer elemento de la lista `xs`. Si la lista
    está vacía lanza una excepción.
  - `xs.tail: List[T]` devuelve la cola de la lista `xs`, esto es, la
    lista `xs` sin su primer elemento.

```scala
scala> length(Nil)
val res0: Int = 0

scala> length(List(1,2,3))
val res1: Int = 3

scala> length(List.range(1,1000))
val res2: Int = 999
```
- **Parámetro** `xs`: Una lista
- **Retorna**: La longitud de la lista `xs`

### `def sum(xs: List[Int]): Int`

Calcula la suma de los elementos de una lista de enteros.

Debe resolverse con las mismas herramientas que el método `length`

```scala
scala> sum(List())
val res4: Int = 0

scala> sum(List.range(1,10))
val res5: Int = 45

scala> sum(List.fill(100)(5))
val res7: Int = 500
```
- **Parámetro** `xs`: Una lista de enteros
- **Retorna**: La suma de los enteros de la lista

### `def max(xs: List[Int]): Int`

Devuelve el elemento más grande de una lista de enteros.

Si la lista `xs` está vacía lanza la excepción `NoSuchElementException`.

Es posible que sea necesario definir una función auxiliar.

```scala
scala> max(List(1))
val res8: Int = 1

scala> max(List.range(1,10000))
val res9: Int = 9999

scala> max(List.fill(100)(9))
val res10: Int = 9

scala> max(List())
java.util.NoSuchElementException
...
```
- **Parámetro** `xs`: Una lista de enteros
- **Retorna**: El elemento más grande de `xs`
- **Lanza** `NoSuchElementException`: si `xs` es una lista vacía

### `def factorial(n: Int): BigInt`

Devuelve el factorial de un número.

Si el número es negativo lanza la excepción IllegalArgumentException

```scala
scala> factorial(0)
val res12: BigInt = 1

scala> factorial(10)
val res13: BigInt = 3628800

scala> factorial(-1)
java.lang.IllegalArgumentException: requirement failed
...
```
- **Parámetro** `n`: es un entero
- **Retorna**: el factorial de `n`
- **Lanza** `IllegalArgumentException`: si el número es negativo.

### `def fibo(n: Int): BigInt`

Devuelve el enésimo número de Fibonacci.

Si el argumento es negativo lanza la excepción IllegalArgumentException

  - fibo(0) = 0
  - fibo(1) = 1
  - fibo(n) = fibo(n-1) + fibo(n-2)

```scala
scala> (0 until 10).map(fibo)
val res17: IndexedSeq[BigInt] = Vector(0, 1, 1, 2, 3, 5, 8, 13, 21, 34)

scala> fibo(50)
val res18: BigInt = 12586269025

scala> fibo(-1)
java.lang.IllegalArgumentException: requirement failed
...
```
- **Parámetro** `n`: es un entero
- **Retorna**: el enésimo número de Fibonacci
- **Lanza** `IllegalArgumentException`: si el número es negativo.

### `def pow(x: BigInt, n: Int): BigInt`

Calcula potencias enteras no negativas de enteros.

```scala
scala> pow(2,32)
val res20: BigInt = 4294967296

scala> pow(100,0)
val res21: BigInt = 1

scala> pow(0,1000)
val res22: BigInt = 0

scala> pow(2,-1)
java.lang.IllegalArgumentException: requirement failed
...
```
- **Parámetro** `x`: la base
- **Parámetro** `n`: el exponente
- **Retorna**: x elevado a la n
- **Lanza** `IllegalArgumentException`: si el `n` es negativo

### `def sumrange(a: BigInt, b: BigInt): BigInt`

Calcula la suma de enteros contenidos en un rango.

```scala
scala> sumrange(0,10)
val res0: BigInt = 55

scala> sumrange(3,5)
val res1: BigInt = 12

scala> sumrange(10,7)
val res2: BigInt = 0

scala> sumrange(5,5)
val res3: BigInt = 5
```
- **Parámetro** `a`: el extremo inferior del rango
- **Parámetro** `b`: el extremo superior del rango
- **Retorna**: la suma de los números contenidos en el rango [a,b]

### `def sumsquares(a: BigInt, b: BigInt): BigInt`

Calcula la suma de los cuadrados de los enteros de un rango.

```scala
scala> sumsquares(0,10)
val res0: BigInt = 385

scala> sumsquares(10,7)
val res1: BigInt = 0

scala> sumsquares(10,10)
val res2: BigInt = 100
```
- **Parámetro** `a`: el extremo inferior del rango
- **Parámetro** `b`: el extremo superior del rango
- **Retorna**: la suma de cuadrados de los números en el rango [a,b]

### `def sumcubes(a: BigInt, b: BigInt): BigInt`

Calcula la suma de los cubos de los enteros de un rango.

```scala
scala> sumcubes(0,10)
val res3: BigInt = 3025

scala> sumcubes(10,7)
val res4: BigInt = 0

scala> sumcubes(10,10)
val res5: BigInt = 1000
```
- **Parámetro** `a`: el extremo inferior del rango
- **Parámetro** `b`: el extremo superior del rango
- **Retorna**: la suma de cubos de los números en el rango [a,b]

### `def sumpowers(a: BigInt, b: BigInt, n: Int): BigInt`

Calcula la suma de las potencias enésimas de los enteros de un rango.

```scala
scala> sumpowers(0,10,3)
val res6: BigInt = 3025

scala> sumpowers(10,7,2)
val res7: BigInt = 0

scala> sumpowers(10,7,-1)
val res8: BigInt = 0

scala> sumpowers(1,10,-2)
java.lang.IllegalArgumentException: requirement failed
...
```
- **Parámetro** `a`: el extremo inferior del rango
- **Parámetro** `b`: el extremo superior del rango
- **Parámetro** `n`: el exponente
- **Retorna**: la suma de las potencias enésimas de los números contenidos en el rango [a,b]
- **Lanza** `IllegalArgumentException`: si el `n` es negativo y el rango tiene al menos un elemento.

### `def quadraticRoots(`

Calcula las raíces de la ecuación de segundo grado ax^2 + bx + c.

Devuelve un par de pares, cada uno de los cuales representa un número
complejo.

```scala
scala> quadraticRoots(1,4,3)
val res0: ((Double, Double), (Double, Double)) = ((-1.0,0.0),(-3.0,0.0))

scala> quadraticRoots(1,4,5)
val res1: ((Double, Double), (Double, Double)) = ((-2.0,1.0),(-2.0,-1.0))

scala> quadraticRoots(0,2,4)
java.lang.IllegalArgumentException: requirement failed: ...
```
- **Parámetro** `a,b,c`: Los coeficientes
- **Retorna**: las raices de la ecuación
- **Lanza** `IllegalArgumentException`: si el coeficiente `a` es 0. Ejemplos:

### `def balance(chars: String): Boolean`

Determina si los paréntesis en una cadena de caracteres estan balanceados.

```scala
scala> balance("(()())")
val res0: Boolean = true

scala> balance("")
val res1: Boolean = true

scala> balance("()(")
val res2: Boolean = false

scala> balance("()))")
val res3: Boolean = false
```
- **Parámetro** `chars`: Una cadena de caracteres.
- **Retorna**: Verdadero si la cadena contiene paréntesis balanceados. Ejemplos:

## Especificaciones en `practico/package.scala`

## Objeto compañero `practico`

Paquete del práctico que contiene la función main
