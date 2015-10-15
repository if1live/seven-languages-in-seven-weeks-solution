-- allEven을 작성하기 위한 서로 다른 방법을 몇 개나 찾을 수 있는가?

module Main where

-- Recursive
allEven_1 :: [Integer] -> [Integer]
allEven_1 [] = []
allEven_1 (h:t) = if even h then h:allEven_1 t else allEven_1 t

-- List comprehension
allEven_2 :: [Integer] -> [Integer]
allEven_2 list = [(x) | x <- list, x `mod` 2 == 0]

-- Guard
allEven_3 :: [Integer] -> [Integer]
allEven_3 [] = []
allEven_3 (h:t)
  | h `mod` 2 == 0 = h:allEven_3 t
  | otherwise = allEven_3 t


run = do
  let foo = [1,2,3,4,5,6]
  print(allEven_1 foo)
  print(allEven_2 foo)
  print(allEven_3 foo)
