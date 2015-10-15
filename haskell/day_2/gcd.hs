-- 두 정수의 최대공약수를 구하는 함수를 작성하라.

module Main where

gcdCore x y
  | y == 0 = x
  | otherwise = gcdCore y (mod x y)

gdc x y
  | x > y = gcdCore x y
  | x < y = gcdCore y x
  | x == y = x
