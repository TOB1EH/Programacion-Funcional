# Trabajo Práctico 08

Implemente todas las funciones/clases/métodos según las especificaciones.

**IMPORTANTE:** No modifique los comentarios, ya que son casos de prueba. La implementación debe compilar sin errores ni advertencias, y deben pasar todos los casos de prueba.
No modifique ningún otro archivo del proyecto.

## Especificaciones en `practico/package.scala`

## Objeto compañero `practico`

Paquete que contiene la función main

## Especificaciones en `rational/package.scala`

## Objeto compañero `rational`

Paquete que contiene la clase Rational

## Especificaciones en `rational/Rational.scala`

## Clase `Rational`

Implementa un tipo de dato racional

`numer` representa el numerador y `denom` el denominador. Los argumentos del
constructor se simplifican de manera que el máximo común divisor entre
numerador y denominador sea 1.

Un número racional negativo se representa con un numerador negativo y un
denominador positivo.

El cero se representa con numerador 0 y denominador 1.

Los enteros se representan con denominador 1.

### `val numer`

El numerador

### `val denom`

El denominador

### `override def toString: String`

Devuelve una String que representa este racional.

Si el número es entero devuelve únicamente el numerador.

```scala
scala> Rational(3,2).toString
val res0: String = 3/2

scala> Rational(0).toString
val res1: String = 0

scala> Rational(3).toString
val res2: String = 3

scala> Rational(3,-4).toString
val res3: String = -3/4
```

### `def +(that: Rational): Rational`

Implementa la suma de números racionales

```scala
scala> Rational(1,2) + Rational(1,3)
val res1: rational.Rational = 5/6

scala> Rational(1,3) + Rational(0)
val res2: rational.Rational = 1/3
```

### `def +(that: Int): Rational`

Implementa la suma con un entero

```scala
scala> Rational(1,2) + 1
val res3: rational.Rational = 3/2

scala> Rational(1,3) + 0
val res4: rational.Rational = 1/3
```

### `def -(that: Rational): Rational`

Implementa la diferencia de números racionales

```scala
scala> Rational(1,2) - Rational(1,3)
val res5: rational.Rational = 1/6

scala> Rational(1,3) - Rational(0)
val res6: rational.Rational = 1/3
```

### `def -(that: Int): Rational`

Implementa la resta de un entero

```scala
scala> Rational(1,2) - 1
val res7: rational.Rational = -1/2

scala> Rational(1,3) - 0
val res8: rational.Rational = 1/3
```

### `def /(that: Rational): Rational`

Implementa la división de números racionales

```scala
scala> Rational(1,2) / Rational(3,4)
val res9: rational.Rational = 2/3

scala> Rational(1,4) / Rational(1)
val res10: rational.Rational = 1/4

scala> Rational(2,5) / Rational(0)
java.lang.IllegalArgumentException: requirement failed: El denominador no puede ser 0
...
```
- **Lanza** `scala.IllegalArgumentException`: si el divisor es 0

### `def /(that: Int): Rational`

Implementa la división por un entero

```scala
scala> Rational(1,2) / 2
val res0: rational.Rational = 1/4

scala> Rational(1,6) / 1
val res1: rational.Rational = 1/6

scala> Rational(2) / 0
java.lang.IllegalArgumentException: requirement failed: El denominador no puede ser 0
...
```
- **Lanza** `scala.IllegalArgumentException`: si el divisor es 0

### `def *(that: Rational): Rational`

Implementa la multiplicación de números racionales

```scala
scala> Rational(1,2) * Rational(1,3)
val res3: rational.Rational = 1/6

scala> Rational(3,4) * Rational(1)
val res4: rational.Rational = 3/4

scala> Rational(4,5) * Rational(0)
val res5: rational.Rational = 0
```

### `def *(that: Int): Rational`

Implementa la multiplicación por un entero

```scala
scala> Rational(1,3) * 3
val res6: rational.Rational = 1

scala> Rational(1,4) * 1
val res7: rational.Rational = 1/4

scala> Rational(3,5) * 0
val res8: rational.Rational = 0
```

### `def unary_- : Rational`

Implementa la negación de un racional

```scala
scala> -Rational(1,2)
val res9: rational.Rational = -1/2

scala> -Rational(-1,2)
val res10: rational.Rational = 1/2

scala> -Rational(0)
val res11: rational.Rational = 0
```

### `def inverse: Rational`

Implementa el inverso de un racional

```scala
scala> Rational(3,2).inverse
val res12: rational.Rational = 2/3

scala> Rational(2).inverse
val res13: rational.Rational = 1/2

scala> Rational(1).inverse
val res14: rational.Rational = 1

scala> Rational(0).inverse
java.lang.IllegalArgumentException: requirement failed: El denominador no puede ser 0
...
```
- **Lanza** `scala.IllegalArgumentException`: si el racional es 0

### `def pow(n: Int): Rational`

Devuelve la potencia enésima de un racional

```scala
scala> Rational(1,2).pow(10)
val res16: rational.Rational = 1/1024

scala> Rational(1,2).pow(-5)
val res17: rational.Rational = 32

scala> Rational(2).pow(-9)
val res18: rational.Rational = 1/512

scala> Rational(3,4).pow(0)
val res19: rational.Rational = 1

scala> Rational(0).pow(10)
val res20: rational.Rational = 0

scala> Rational(0).pow(-2)
java.lang.IllegalArgumentException: requirement failed: El denominador no puede ser 0
...
```
- **Lanza** `scala.IllegalArgumentException`: si el racional es 0 y la potencia es negativa

### `override def equals(other: Any): Boolean`

Implementa la comparación de igualdad

```scala
scala> Rational(1,2) == Rational(2,4)
val res22: Boolean = true

scala> Rational(2,3) == Rational(2,4)
val res23: Boolean = false
```

### `override def hashCode: Int`

Calcula un código hash para el racional

Si dos racionales son iguales, deben tener el mismo hashCode

```scala
scala> Rational(1).hashCode == Rational(2,2).hashCode
val res24: Boolean = true
```

### `override def compare(that: Rational): Int`

Compara `this` con `that`

Devuelve `x` tal que

  - x < 0 si `this` < `that`
  - x == 0 si `this` == `that`
  - x > 0 si `this` > `that`

```scala
scala> Rational(1).compare(Rational(2,2))
val res25: Int = 0

scala> Rational(1,3).compare(Rational(1,2)) < 0
val res26: Boolean = true

scala> Rational(-1,2).compare(Rational(0)) < 0
val res27: Boolean = true

scala> Rational(0).compare(-Rational(1,2)) > 0
val res28: Boolean = true
```

## Objeto compañero `Rational`

Objeto compañero de la clase Rational

### `def apply(n: Int, d: Int): Rational`

Método factoría, construye una instancia de Rational

```scala

scala> val q = Rational(1,2)
val q: rational.Rational = 1/2

scala> val r = Rational(1,0)
java.lang.IllegalArgumentException: requirement failed: El denominador no puede ser 0
...
```
- **Parámetro** `n`: numerador
- **Parámetro** `d`: denominador
- **Lanza** `IllegalArgumentException`: si el denominador es 0

### `def apply(n: Int): Rational`

Método factoría, construye un Rational a partir de un entero

```scala
scala> val one = Rational(1)
val one: rational.Rational = 1
```
- **Parámetro** `n`: el entero

### `def apply(s: String): Rational`

Método factoría, construye un Rational a partir de una String

Ejemplos:
```scala
scala> Rational("1/2")
val res0: rational.Rational = 1/2

scala> Rational("5")
val res1: rational.Rational = 5

scala> Rational("")
java.lang.NumberFormatException: For input string ""
  at rational.Rational$.apply(Rational.scala:360)
  ... 38 elided

scala> Rational("1/")
java.lang.NumberFormatException: For input string "1/"
  at rational.Rational$.apply(Rational.scala:360)
  ... 38 elided

scala> Rational("1/0")
java.lang.IllegalArgumentException: requirement failed: El denominador no * puede ser 0
  at scala.Predef$.require(Predef.scala:337)
  at rational.Rational.<init>(Rational.scala:17)
  at rational.Rational$.apply(Rational.scala:323)
  at rational.Rational$.apply(Rational.scala:356)
  ... 38 elided
```
- **Parámetro** `s`: una string de la forma "a/b" o "a" donde a y b son enteros
- **Lanza** `NumberFormatException`: si la string no tiene el formato adecuado
- **Lanza** `IllegalArgumentException`: si el formato es correcto pero el denominador es cero.

### Métodos de extensión sobre `Int`

Métodos de extensión

#### `def +(that: Rational)`

Extensión de la clase Int que permite sumar un Rational

```scala
scala> 1 + Rational(1,2)
val res1: rational.Rational = 3/2

scala> 0 + Rational(1,4)
val res2: rational.Rational = 1/4
```

#### `def -(that: Rational)`

Extensión de la clase Int que permite restar un Rational

```scala
scala> 1 - Rational(1,2)
val res1: rational.Rational = 1/2

scala> 0 - Rational(1,4)
val res2: rational.Rational = -1/4
```

#### `def *(that: Rational)`

Extensión de la clase Int que permite multiplicar por un Rational

```scala
scala> 1 * Rational(1,2)
val res1: rational.Rational = 1/2

scala> 0 * Rational(1,4)
val res2: rational.Rational = 0
```

#### `def /(that: Rational)`

Extensión de la clase Int que permite dividir por un Rational

```scala
scala> 1 / Rational(1,2)
val res1: rational.Rational = 2

scala> 0 / Rational(1,4)
val res2: rational.Rational = 0

scala> 2 / Rational(0)
java.lang.IllegalArgumentException: requirement failed: El denominador no puede ser 0
...
```
- **Lanza** `scala.IllegalArgumentException`: si `that` es Rational(0)
