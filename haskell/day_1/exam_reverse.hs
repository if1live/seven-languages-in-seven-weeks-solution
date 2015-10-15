-- 리스트를 받아들여서 똑같은 리스크가 순서만 거꾸로 된 채 리턴하는 함수를 작성하라

module Main where

reverseList :: [Integer] -> [Integer]
reverseList [] = []
reverseList (h:t) = (reverseList t) ++ [h]

run = do
  print(reverseList [])
  print(reverseList [1,2,3,4,5,6])
