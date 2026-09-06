{-# OPTIONS_GHC -Wno-type-defaults #-}
import Control.Exception (SomeException, catch, evaluate)
import Control.Monad (unless)
import Data.List (isInfixOf)
import Lib
  ( factorial,
    fibo,
    length',
    maximum',
    minimum',
    name,
    pow,
    product',
    reverse',
    sum',
    sumcubes,
    sumpowers,
    sumsquares,
  )
import Test.Tasty (TestTree, defaultMain, localOption, mkTimeout, testGroup)
import Test.Tasty.HUnit (testCase)
import Test.Tasty.QuickCheck (testProperty)
import Test.HUnit (assertBool, assertFailure, (@?=))
import Test.HUnit.Approx (assertApproxEqual)
import Test.QuickCheck (Property, (==>))
import Test.QuickCheck.Assertions (Result, (~==?))

main :: IO ()
main = defaultMain (testGroup "TP03" tests)

catchToBool :: a -> [Char] -> IO Bool
catchToBool assertion message =
  catch
    ( do
        _ <- evaluate assertion
        return False
    )
    ((\e -> return (message `isInfixOf` show e)) :: SomeException -> IO Bool)

assertRaises :: a -> [Char] -> IO ()
assertRaises assertion message = do
  x <- catchToBool assertion message
  unless x (assertFailure "Exception not thrown")

tests :: [TestTree]
tests =
  [ testGroup
      "Name"
      [ testCase "name" (name @?= "TP03")
      ],
    testGroup
      "Lists"
      [ testProperty "length'" ((\xs -> length xs == length' xs) :: [Int] -> Bool),
        testProperty "int sum'" ((\xs -> sum xs == sum' xs) :: [Int] -> Bool),
        testProperty "int product'" ((\xs -> product xs == product' xs) :: [Int] -> Bool),
        testProperty "double sum'" ((\xs -> sum xs ~==? sum' xs) :: [Double] -> Result),
        testProperty "double product'" ((\xs -> product xs ~==? product' xs) :: [Double] -> Result),
        testCase "null length" (length' [] @?= 0),
        testCase "zero product" (product' [3.1, 2.3, 5.0, 0.0] @?= 0.0),
        testCase "double sum case" (assertApproxEqual "double sum" 1e-6 4.6 (sum' [1.2, 3.4])),
        testCase "double product case" (assertApproxEqual "double product" 1e-6 4.08 (product' [1.2, 3.4])),
        testProperty "reverse'" ((\xs -> reverse xs == reverse' xs) :: [Char] -> Bool),
        testProperty "maximum'" ((\xs -> xs /= [] ==> maximum xs == maximum' xs) :: [Int] -> Property),
        testProperty "minimum'" ((\xs -> xs /= [] ==> minimum xs == minimum' xs) :: [Int] -> Property),
        testCase "maximum' empty list" (assertRaises (maximum' [] :: [Int]) "empty list"),
        testCase "minimum' empty list" (assertRaises (minimum' [] :: [Int]) "empty list")
      ],
    testGroup
      "Numbers"
      [ testProperty "factorial" (\n -> n >= 0 ==> factorial n == product [1 .. n]),
        testCase "fibo" (map fibo [0 .. 15] @?= [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610]),
        testProperty "pow" ((\x n -> n >= 0 ==> pow x n == x ^ n) :: Int -> Int -> Property),
        testProperty "sumsquares" ((\a b -> sumsquares a b == sum (map (\x -> x * x) [a .. b])) :: Int -> Int -> Bool),
        testProperty "sumcubes" ((\a b -> sumcubes a b == sum (map (\x -> x * x * x) [a .. b])) :: Int -> Int -> Bool),
        testProperty "sumpowers" ((\a b n -> n >= 0 ==> sumpowers a b n == sum (map (^ n) [a .. b])) :: Int -> Int -> Int -> Property)
      ],
    localOption (mkTimeout 20000000)
      ( testGroup
          "Entradas grandes"
          [ testCase "length' de una lista larga" (length' [1 .. 1000000] @?= 1000000),
            testCase "sum' de una lista larga" (sum' [1 .. 1000000] @?= 500000500000),
            testCase "product' de una lista larga" (product' (replicate 1000000 1) @?= 1),
            testCase "reverse' de una lista larga" (assertBool "reverse' [1..1000000] /= [1000000,999999..1]" (reverse' [1 .. 1000000] == [1000000, 999999 .. 1])),
            testCase "maximum' de una lista larga" (maximum' [1 .. 1000000] @?= 1000000),
            testCase "minimum' de una lista larga" (minimum' [1 .. 1000000] @?= 1),
            testCase "factorial de un número grande" (assertBool "factorial 100000 <= 0" (factorial 100000 > 0)),
            testCase "fibo de un número grande" (fibo 100 @?= 354224848179261915075),
            testCase "pow con exponente grande" (pow 1 1000000 @?= 1),
            testCase "sumsquares de un rango largo" (sumsquares 1 1000000 @?= 333333833333500000),
            testCase "sumcubes de un rango largo" (sumcubes 1 1000000 @?= 250000500000250000000000),
            testCase "sumpowers de un rango largo" (sumpowers 1 1000000 1 @?= 500000500000)
          ]
      )
  ]
