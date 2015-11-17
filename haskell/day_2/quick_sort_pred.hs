-- 리스트와 구대의 인수를 서로 비교하는 함수를 받아들여
-- 정렬된 리스트를 리턴하는 코드를 작성하라.
-- :load quick_sort.hs
-- quickSortPred [3, 1, 5, 2] (\x y -> x > y)
-- quickSortPred [3, 1, 5, 2] (\x y -> x < y)

module Main where

quickSortPred [] pred = []
quickSortPred (pivot:t) pred =
  quickSortPred [x | x <- t, (pred x pivot)] pred
  ++ [pivot] ++
  quickSortPred [x | x <- t, not (pred x pivot)] pred
