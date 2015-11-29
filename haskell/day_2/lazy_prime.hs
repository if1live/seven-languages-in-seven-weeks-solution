-- 소수만 담는 게으른 시퀀스를 생성하라.

module Main where

isRelativelyPrime x y
  | mod x y == 0 = False
  | otherwise = True

isPrimeCheck num [] = True

isPrimeCheck num (h:t) = (isRelativelyPrime num h) && (isPrimeCheck num t)

isPrime num = isPrimeCheck num [2 .. (num - 1)]

nextPrime num
  | isPrime (num + 1) == True = num + 1
  | otherwise = nextPrime (num + 1)

lazyPrime x y = x:(lazyPrime y (nextPrime y))

prime = lazyPrime 2 3

run = do
  print(take 10 (prime))
